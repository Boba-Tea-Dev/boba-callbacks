RegisterNetEvent("Boba:Server:ProcessServerCallback", function(event, ticket, ...)
    local src = source
	local p = promise.new()

    TriggerEvent(event, function(...)
		p:resolve({...})
	end, src, ...)

	local result = Citizen.Await(p)

	TriggerClientEvent(('Boba:Client:ServerCallbackEvent:%s:%s'):format(event, ticket), src, table.unpack(result))
end)