local name = GetCurrentResourceName()
local path = GetResourcePath(name).."/script/"
local script = {
    "job",
}
local write = {}
function readAll(file)
    local f = io.open(file, "rb")
    local content = f:read("*all")
    f:close()
    return content
end
for i,v in pairs(script) do
    local code = readAll(path..v..".lua")
    write[v] = code
end

local user = {}
RegisterServerEvent(name..":send", function() 
    local src = source
    if not user[src] then
        TriggerClientEvent(name..":get", src, write)
        user[src] = true
    else
        print('CONNECT TRIGGER IF KICKLENICEK OR BANNING SCRIPT DOES NOT LOAD')
    end
end)

AddEventHandler('playerDropped', function()
    user[source] = nil
end)