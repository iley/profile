local module = {}

local CONFIG_PATH = "~/.config/Hammerspoon3DPrinter/settings.json"

function module:load()
  local data = hs.json.read(CONFIG_PATH)
  if data == nil then
    print("Could not load JSON config from file " .. CONFIG_PATH)
  end
  return data
end

return module
