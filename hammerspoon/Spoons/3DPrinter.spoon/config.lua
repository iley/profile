local module = {}

local CONFIG_PATH = "~/.config/Hammerspoon3DPrinter/settings.json"

-- config example:
-- {
--  "hass_url": "http://smarthome.local",
--  "hass_access_token": "...",
--  "hass_switch_entity_id": "switch.3d_printer",
--  "octoprint_url": "http://printserver.local",
--  "octoprint_api_key": "...",
--  "home_ssid": "myhomewifi"
-- }

function module:load()
  local data = hs.json.read(CONFIG_PATH)
  if data == nil then
    print("Could not load JSON config from file " .. CONFIG_PATH)
  end
  return data
end

return module
