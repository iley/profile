local module = {}

function module.new(baseUrl, apiKey)
  local obj = {}

  local function httpGet(path)
    local headers = {
      ["X-Api-Key"] = apiKey
    }
    local url = baseUrl .. path
    return hs.http.get(url, headers)
  end

  local function httpPost(path, data)
    local headers = {
      ["X-Api-Key"] = apiKey,
      ["Content-Type"] = "application/json",
    }
    local url = baseUrl .. path
    local dataStr = hs.json.encode(data)
    return hs.http.post(url, dataStr, headers)
  end

  function obj:pollStatus()
    local code, body, headers = httpGet("/api/connection")
    if code ~= 200 then
      print("Octoprint status request failed with code " .. code .. ": " .. body)
      return nil
    end
    local response = hs.json.decode(body)

    local result = {
      connected = (response.current.state == "Operational"),
    }
    return result
  end

  -- Returns whether the connection attempt was successful.
  function obj:connect()
    local data = {command = "connect"}
    local code, body, headers = httpPost("/api/connection", data)
    if code ~= 204 then
      print("Octoprint connect request failed with code " .. code .. ": " .. (body or ""))
      return false
    end
    return true
  end

  function obj:disconnect()
    local data = {command = "disconnect"}
    local code, body, headers = httpPost("/api/connection", data)
    if code ~= 204 then
      print("Octoprint disconnect request failed with code " .. code .. ": " .. (body or ""))
      return false
    end
    return true
  end

  return obj
end

return module
