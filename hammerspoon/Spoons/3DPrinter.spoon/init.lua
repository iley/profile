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


local CONN_DISCONNECTED = "disconnected"
local CONN_CONNECTED = "connected"
local CONN_CONNECTING = "connecting"
local CONN_DISCONNECTING = "disconnecting"

local state = {
  connectionStatus = CONN_DISCONNECTED,
  config = nil,
  octoprint = nil,
}

local function handleConnect()
  state.connectionStatus = CONN_CONNECTING
  local success = state.octoprint:connect()
  if success then
    hs.notify.new({title="3D Printer Status", informativeText="3D printer was successfully turned on and connected"}):send()
    state.connectionStatus = CONN_CONNECTED
  else
    hs.notify.new({title="3D Printer Error", informativeText="Octoprint connection attempt was failed"}):send()
    state.connectionStatus = CONN_DISCONNECTED
  end
end

local function handleDisconnect()
  state.connectionStatus = CONN_DISCONNECTING
  local success = state.octoprint:disconnect()
  if success then
    hs.notify.new({title="3D Printer Status", informativeText="3D printer was successfully disconnected"}):send()
  else
    hs.notify.new({title="3D Printer Error", informativeText="Octoprint connection attempt was failed"}):send()
  end
  state.connectionStatus = CONN_DISCONNECTED
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

local function pollPrinterStatus()
  if state.connectionStatus == CONN_CONNECTING then
    -- Skip polling if we're in the process of connecting
    return
  end

  local status = state.octoprint.pollStatus()
  if status.connected then
    state.connectionStatus = CONN_CONNECTED
  else
    state.connectionStatus = CONN_DISCONNECTED
  end
end

function spoon:init()
  local menuBar = hs.menubar.new():setIcon(icons.nozzle):setMenu(getMenuItems)

  state.config = config:load()
  if state.config == nil then
    hs.notify.new({title="Config error", informativeText="Could not load config for the 3D Printer Spoon"}):send()
  end

  state.octoprint = octoprint.new(state.config.octoprint_url, state.config.octoprint_api_key)

  statusUpdater = hs.timer.new(5, pollPrinterStatus)
  statusUpdater:start()

  pollPrinterStatus()
end

return spoon
