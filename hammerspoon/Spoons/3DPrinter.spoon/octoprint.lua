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

  -- returns a string descrbing current conneciton state
  local function getConnectionState()
    local code, body, headers = httpGet("/api/connection")
    if code ~= 200 then
      print("Octoprint connection status request failed with code " .. code .. ": " .. (body or ""))
      return nil
    end
    local response = hs.json.decode(body)
    return response.current.state
  end

  local function getJobState()
    local code, body, headers = httpGet("/api/job")
    if code ~= 200 then
      print("Octoprint job status request failed with code " .. code .. ": " .. (body or ""))
      return nil
    end
    return hs.json.decode(body)
  end

  function obj:pollStatus()
    local result = {
      connected = false,
      printing = false,
      eta = 0,
    }

    local connectionState = getConnectionState()
    if connectionState == "Operational" or connectionState == "Printing" then
      result.connected = true

      local job = getJobState()
      if job.state == "Printing" then
        result.printing = true
        result.eta = job.progress.printTimeLeft
      end
    end

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
