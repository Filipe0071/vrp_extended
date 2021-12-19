AddEventHandler("vrpext:getSharedObject", function(cb)
	cb(vRPEXT)
end)

function getSharedObject()
	return vRPEXT
end