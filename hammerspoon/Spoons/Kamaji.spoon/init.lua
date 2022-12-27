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

local state = {
  device = nil,
  menu = nil,
}

local function handleBlink()
  -- TODO
end

local function getMenuItems()
  local menuItems = {
    { 
      title = "Blink LED",
      fn = handleBlink,
    }
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

local function handleDevicesUpdate(devices, virtualDevices)
  state.device = nil
  for _, deviceName in ipairs(devices) do
    if deviceName == EXPECTED_DEVICE_NAME then
      state.device = hs.midi.new(deviceName)
    end
  end

  if state.device == nil then
    hideMenu()
  else
    showMenu()
  end
end

function spoon:init()
  state.menu = hs.menubar.new():setIcon(icons.kamaji):setMenu(getMenuItems)
  hs.midi.deviceCallback(handleDevicesUpdate)
end

return spoon
