local module = {}

function module.new(baseUrl, apiToken, entityId)
  local obj = {}

  local function httpPost(path, data)
    local headers = {
      ["Authorization"] = "Bearer " .. apiToken,
      ["Content-Type"] = "application/json",
    }
    local url = baseUrl .. path
    local dataStr = hs.json.encode(data)
    return hs.http.post(url, dataStr, headers)
  end

  function obj:turnOn()
    local data = { ["entity_id"] = entityId }
    local path = "/api/services/switch/turn_on"
    local code, body, headers = httpPost(path, data)
    if code ~= 200 then
      print("Home assistant request failed with code " .. code .. ": " .. (body or ""))
      return false
    end
    return true
  end

  function obj:turnOff()
    local data = { ["entity_id"] = entityId }
    local path = "/api/services/switch/turn_off"
    local code, body, headers = httpPost(path, data)
    if code ~= 200 then
      print("Home assistant request failed with code " .. code .. ": " .. (body or ""))
      return false
    end
    return true
  end

  return obj
end

return module
