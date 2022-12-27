local spoon = {}

spoon.name = "3D Printer Control"
spoon.version = "1.0"
spoon.author = "Ilya Strukov <ilya@istrukov.com>"
spoon.license = "MIT"

local function scriptPath()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
end

local icons = dofile(scriptPath() .. "/icons.lua")
local config = dofile(scriptPath() .. "/config.lua")
local octoprint = dofile(scriptPath() .. "/octoprint.lua")
local hass = dofile(scriptPath() .. "/hass.lua")


local CONN_DISCONNECTED = "disconnected"
local CONN_CONNECTED = "connected"

local WATCH_INTERVAL_SECONDS = 60
local PRINTER_START_DELAY_SECONDS = 10

-- put all global state here
local state = {
  menuBar = nil,
  connectionStatus = CONN_DISCONNECTED,
  octoprint = nil,
  hass = nil,
  switchEntityId = nil,
  wifiWatcher = nil,
}

local function formatEta(etaSeconds)
  minutes = etaSeconds / 60
  if minutes < 0 then
    minutes = 0
  end
  return string.format("%02d:%02d", math.floor(minutes / 60), math.floor(minutes % 60))
end

local function pollPrinterStatus()
  local status = state.octoprint.pollStatus()
  if status.connected then
    state.connectionStatus = CONN_CONNECTED
    if status.printing then
      etaString = formatEta(status.eta)
      tooltip = string.format("Printing with %s remaining", etaString)
      state.menuBar:setTitle(etaString .. "R"):setTooltip(tooltip)
    else
      state.menuBar:setTitle("idle"):setTooltip("Printer is connected and ready to print")
    end
  else
    state.menuBar:setTitle(nil):setTooltip("Printer is disconnected")
    state.connectionStatus = CONN_DISCONNECTED
  end
end

local function waitForStatus(expectedStatus)
  local attemptsLeft = 20 -- circuit breaker

  local function check()
    -- quit if we tried too many times
    if attemptsLeft <= 0 then
      return true
    end

    return state.connectionStatus == expectedStatus
  end

  hs.timer.doUntil(check, pollPrinterStatus) -- poll every second until check succeeds (or gives up)
end

local function handleConnect()
  local function continue()
    local success = state.octoprint:connect()
    if success then
      hs.notify.new({title="3D Printer Status", informativeText="3D printer was successfully turned on and connected"}):send()
      waitForStatus(CONN_CONNECTED)
    else
      hs.notify.new({title="3D Printer Error", informativeText="Octoprint connection attempt failed"}):send()
    end
  end

  local hassSuccess = state.hass:turnOn(state.switchEntityId)
  if not hassSuccess then
    hs.notify.new({title="3D Printer Error", informativeText="Home Assistant turn on attempt failed"}):send()
    return
  end

  -- Let the 3D printer power on before atttempting connection.
  hs.timer.doAfter(PRINTER_START_DELAY_SECONDS, continue)
end

local function handleDisconnect()
  local octoprintSuccess = state.octoprint:disconnect()
  if not octoprintSuccess then
    hs.notify.new({title="3D Printer Error", informativeText="Octoprint connection attempt failed"}):send()
  end

  local hassSuccess = state.hass:turnOff(state.switchEntityId)
  if not hassSuccess then
    hs.notify.new({title="3D Printer Error", informativeText="Home Assistant turn off attempt failed"}):send()
  end

  if hassSuccess and octoprintSuccess then
    hs.notify.new({title="3D Printer Status", informativeText="3D printer was successfully disconnected"}):send()
    waitForStatus(CONN_DISCONNECTED)
  end
end

local function getMenuItems()
  local menuItems = {
    { 
      title = "Turn on and connect",
      disabled = state.connectionStatus ~= CONN_DISCONNECTED,
      fn = handleConnect,
    },
    {
      title = "Disconnect and turn off",
      disabled = state.connectionStatus ~= CONN_CONNECTED,
      fn = handleDisconnect,
    },
  }
  return menuItems
end

local function handleWifiChange(watcher, message, interface)
  if message ~= "SSIDChange" then
    return
  end
  ssid = hs.wifi.currentNetwork()
  if ssid == state.homeSSID then
    state.statusUpdater:start()
  else
    state.statusUpdater:stop()
    -- clear up the title in case something was displayed there before
    state.menuBar:setTitle(nil)
  end
end

function spoon:init()
  state.menuBar = hs.menubar.new():setIcon(icons.nozzle):setMenu(getMenuItems)

  local settings = config:load()
  if settings == nil then
    hs.notify.new({title="Config error", informativeText="Could not load config for the 3D Printer Spoon"}):send()
  end

  state.octoprint = octoprint.new(settings.octoprint_url, settings.octoprint_api_key)
  state.hass = hass.new(settings.hass_url, settings.hass_access_token)
  state.switchEntityId = settings.hass_switch_entity_id
  state.homeSSID = settings.home_ssid

  state.statusUpdater = hs.timer.new(WATCH_INTERVAL_SECONDS, pollPrinterStatus)

  -- start the watcher manually once before the wifi watcher below kicks in
  if hs.wifi.currentNetwork() == state.homeSSID then
    state.statusUpdater:start()
    pollPrinterStatus()
  end

  -- register a callback on SSID change to only poll when on the right network
  state.wifiWatcher = hs.wifi.watcher.new(handleWifiChange)
  state.wifiWatcher:start()
end

return spoon
