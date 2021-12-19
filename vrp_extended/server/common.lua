vRPEXT = {}

vRPEXT.Players = {}
vRPEXT.ServerCallbacks = {}
vRPEXT.TimeoutCount = -1
vRPEXT.CancelledTimeouts = {}

AddEventHandler("vrpext:getSharedObject", function(cb)
	cb(vRPEXT)
end)

function getSharedObject()
	return vRPEXT
end

RegisterServerEvent("vrpext:clientLog")
AddEventHandler("vrpext:clientLog", function(msg)
	if Config.EnableDebug then
		print(("[^2TRACE^7] %s^7"):format(msg))
	end
end)

RegisterServerEvent("vrpext:triggerServerCallback")
AddEventHandler("vrpext:triggerServerCallback", function(name, requestId, ...)
	local playerId = source
	vRPEXT.TriggerServerCallback(name, requestId, playerId, function(...)
		TriggerClientEvent("vrpext:serverCallback", playerId, requestId, ...)
	end, ...)
end)