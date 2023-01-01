local name = GetCurrentResourceName()
local start = false
AddEventHandler('onClientResourceStart', function(resource)
	if resource == name then
		Citizen.Wait(700)
		TriggerServerEvent(name..":send")
	end
end)

RegisterNetEvent(name..":get")
AddEventHandler(name..":get", function(scripts)
	if start then return end
	TriggerEvent("esx:showNotification", "~g~Client side loaded")
	for k,v in pairs(scripts) do
		local loaded, err = load(v)
		if loaded then
			loaded()
		else
			print("Derleme Hatası:", err)
		end
		Citizen.Wait(10)
	end
	start = true
end)