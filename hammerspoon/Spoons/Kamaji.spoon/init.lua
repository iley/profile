local spoon = {}

spoon.name = "Kamaji Device Control"
spoon.version = "1.0"
spoon.author = "Ilya Strukov <ilya@istrukov.com>"
spoon.license = "MIT"

local function scriptPath()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
end

local icons = dofile(scriptPath() .. "/icons.lua")

local EXPECTED_DEVICE_NAME = "SparkFun Pro Micro"
local CHANNEL_LEDS = 0
local CHANNEL_BUZZER = 1
local NOTE_TO_PLAYER = {
  [24] = 0, [25] = 1, [26] = 2, [27] = 3,
  [28] = 4, [29] = 5, [30] = 6, [31] = 7,
}
-- for blinking LEDs
local PLAYER_TO_NOTE = {
  [0] = 24, [1] = 25, [2] = 26, [3] = 27,
  [4] = 28, [5] = 29, [6] = 30, [7] = 31,
}
local MAX_VELOCITY = 127

local state = {
  device = nil,
  menu = nil,
  lastDeviceList = {},
  alertsMuted = false,
  blinkOnPress = true,
}

local function blinkLED(player, durationSec)
  if state.device == nil then
    return
  end

  local note = PLAYER_TO_NOTE[player]
  if note == nil then
    return
  end

  local metadata = {
    channel = CHANNEL_LEDS,
    note = note,
    velocity = MAX_VELOCITY,
  }
  state.device:sendCommand("noteOn", metadata)

  local function sendNoteOff()
    local metadata = {
      channel = CHANNEL_LEDS,
      note = note,
      velocity = 0,
    }
    state.device:sendCommand("noteOff", metadata)
  end

  hs.timer.doAfter(durationSec, sendNoteOff)
end

local function showAlert(message)
  if not state.alertsMuted then
    hs.alert.show(message)
  end
end

local function handleMute()
  state.alertsMuted = not state.alertsMuted
end

local function handleBlinkOnPress()
  state.blinkOnPress = not state.blinkOnPress
end

local function handleBlink()
  blinkLED(0, 1) -- player 0, 1 second
end

local function getMenuItems()
  local menuItems = {
    {
      title = "Mute alerts",
      fn = handleMute,
      checked = state.alertsMuted,
    },
    {
      title = "Blink on button press",
      fn = handleBlinkOnPress,
      checked = state.blinkOnPress,
    },
    { 
      title = "Blink Player 1 LED",
      fn = handleBlink,
    },
  }
  return menuItems
end

local function showMenu()
  if not state.menu:isInMenuBar() then
    state.menu:returnToMenuBar()
    state.menu:setIcon(icons.kamaji)
  end
end

local function hideMenu()
  if state.menu:isInMenuBar() then
    state.menu:removeFromMenuBar()
  end
end

local function handlePushDown(player)
  -- a player button was pushed down
  showAlert(string.format("Player %d button pushed", player + 1))
  if state.blinkOnPress then
    blinkLED(player, 0.5)
  end
end

local function handlePushUp(player)
  -- a player button was pushed up after previously being pushed down
end

local function handleMidiEvent(object, deviceName, commandType, description, metadata)
  if commandType == "noteOn" then
    note = metadata.note
    player = NOTE_TO_PLAYER[note]
    if player ~= nil then
      handlePushDown(player)
    end
  elseif commandType == "noteOff" then
    note = metadata.note
    player = NOTE_TO_PLAYER[note]
    if player ~= nil then
      handlePushUp(player)
    end
  end
end

local function handleDevicesUpdate(devices, virtualDevices)
  if table.concat(devices, "|") == table.concat(state.lastDeviceList, "|") then
    -- the device list did not change, ignore update
    return
  end

  state.device = nil
  for _, deviceName in ipairs(devices) do
    if deviceName == EXPECTED_DEVICE_NAME then
      state.device = hs.midi.new(deviceName)
      state.device:callback(handleMidiEvent)
    end
  end

  if state.device == nil then
    hideMenu()
  else
    -- this message cannot be muted
    hs.alert.show("Kamaji device connected")
    showMenu()
  end

  state.lastDeviceList = devices
end

function spoon:init()
  state.menu = hs.menubar.new():setIcon(icons.kamaji):setMenu(getMenuItems)
  hs.midi.deviceCallback(handleDevicesUpdate)
end

return spoon
