vRPEXT = {}

vRPEXT.ServerCallbacks = {}

AddEventHandler("vrpext:getSharedObject", function(cb)
	cb(vRPEXT)
end)

function getSharedObject()
	return vRPEXT
end

RegisterServerEvent("vrpext:triggerServerCallback")
AddEventHandler("vrpext:triggerServerCallback", function(name, requestId, ...)
	local playerId = source
	vRPEXT.TriggerServerCallback(name, requestId, playerId, function(...)
		TriggerClientEvent("vrpext:serverCallback", playerId, requestId, ...)
	end, ...)
end)
