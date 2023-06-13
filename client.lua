function ExecuteServerCallback(event, ...)
    local ticket = GetGameTimer()
    local p = promise.new()

    RegisterNetEvent(('Boba:Client:ServerCallbackEvent:%s:%s'):format(event, ticket))

    local e = AddEventHandler(('Boba:Client:ServerCallbackEvent:%s:%s'):format(event, ticket), function(...)
        p:resolve({...})
    end)

    TriggerServerEvent("Boba:Server:ProcessServerCallback", event, ticket, ...)

    local result = Citizen.Await(p)
	

	RemoveEventHandler(e)
	
	return table.unpack(result) or result
end
exports("ExecuteServerCallback", ExecuteServerCallback)
