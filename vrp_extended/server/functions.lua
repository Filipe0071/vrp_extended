vRPEXT.Trace = function(msg)
	if Config.EnableDebug then
		print(("[^2TRACE^7] %s^7"):format(msg))
	end
end

vRPEXT.SetTimeout = function(msec, cb)
	local id = vRPEXT.TimeoutCount + 1
	SetTimeout(msec, function()
		if vRPEXT.CancelledTimeouts[id] then
			vRPEXT.CancelledTimeouts[id] = nil
		else
			cb()
		end
	end)
	vRPEXT.TimeoutCount = id
	return id
end

vRPEXT.ClearTimeout = function(id)
	vRPEXT.CancelledTimeouts[id] = true
end

vRPEXT.RegisterServerCallback = function(name, cb)
	vRPEXT.ServerCallbacks[name] = cb
end

vRPEXT.TriggerServerCallback = function(name, requestId, source, cb, ...)
	if vRPEXT.ServerCallbacks[name] then
		vRPEXT.ServerCallbacks[name](source, cb, ...)
	else
		print(('[^3WARNING^7] Server callback ^5"%s"^0 does not exist. ^1Please Check The Server File for Errors!'):format(name))
	end
end