# FiveM Client → Server Callback Utility

This resource is to be used as a utility dependency. Routing server events via this utility means you don't need to [expose them to clients](https://docs.fivem.net/docs/scripting-reference/runtimes/lua/functions/RegisterNetEvent/) for sensitive functions (e.g. adding/ removing items).

While this utility doesn't expose events to clients *directly*, you should ensure any data received is properly sanitizied before using it in your application.

> Any code provided in this repository is provided as-is, without warranty or support. You are expected to have any required technical knowledge prior to the use of this resource.

Contributions can be made by [opening a pull request](https://github.com/itstait/fivem-server-callbacks/pulls), or if you notice an issue please [raise an issue](https://github.com/itstait/fivem-server-callbacks/issues).

# Examples

## Requesting a server callback from the client

```lua
RegisterNetEvent("ResourceName:EventName", function(cb, src, arg)
    print(("Event triggered on the server. Value received: %s"):format(arg))

    cb("This value is sent to the client")
end)
```

## Handling callbacks server-side

```lua
CreateThread(function()
    local result = exports["boba-callbacks"]:ExecuteServerCallback("ResourceName:EventName", "Example value sent to the server event")
    print(result)
end)
```