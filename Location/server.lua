ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)RegisterNetEvent("hydradev:vehicule")AddEventHandler("hydradev:vehicule", function(car, price)    local _src = source	local xPlayer = ESX.GetPlayerFromId(_src)		if xPlayer.getMoney() >= price then 		xPlayer.removeMoney(price)        TriggerClientEvent('esx:showNotification', source, "Vous avez payer : ~g~"..price.."$~s~.", "", 1)        TriggerClientEvent('esx:showNotification', source, "Tu en est ~g~responsable~s~ ne te fait pas attraper par la police !", "", 1)        TriggerClientEvent('esx:showNotification', source, "Tien ton véhicule ! Bonne route !", "", 1)		TriggerClientEvent('hydradev:spawnCar',source,car)	else		TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d'argent.", "", 1)	endend)

