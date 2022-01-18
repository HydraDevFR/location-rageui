ESX = nil



Citizen.CreateThread(function()

	while ESX == nil do

		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

		Citizen.Wait(100)

	end

end)





Confighydradev              = {}

Confighydradev.DrawDistance = 100

Confighydradev.Size         = {x = 1.0, y = 1.0, z = 1.0}

Confighydradev.Color        = {r = 255, g = 255, b = 255}

Confighydradev.Type         = -1



local position = {

        {x = -732.42,   y = -1381.91,  z = 1.59},        

}  



Citizen.CreateThread(function()

     for k in pairs(position) do

        local blip = AddBlipForCoord(position[k].x, position[k].y, position[k].z)

        SetBlipSprite(blip, 410)

        SetBlipColour(blip, 33)

        SetBlipScale(blip, 0.7)

        SetBlipAsShortRange(blip, true)



        BeginTextCommandSetBlipName('STRING')

        AddTextComponentString("Location Bateau")

        EndTextCommandSetBlipName(blip)

    end

end)



Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)

        local coords, letSleep = GetEntityCoords(PlayerPedId()), true



        for k in pairs(position) do

            if (Confighydradev.Type ~= -1 and GetDistanceBetweenCoords(coords, position[k].x, position[k].y, position[k].z, true) < Confighydradev.DrawDistance) then

                DrawMarker(Confighydradev.Type, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Confighydradev.Size.x, Confighydradev.Size.y, Confighydradev.Size.z, Confighydradev.Color.r, Confighydradev.Color.g, Confighydradev.Color.b, 100, false, true, 2, false, false, false, false)

                letSleep = false

            end

        end



        if letSleep then

            Citizen.Wait(500)

        end

    end

end)



RMenu.Add('hydradev', 'main', RageUI.CreateMenu("Location Bateaux", "Louer vos meilleurs véhicules !"))





Citizen.CreateThread(function()

    while true do



        RageUI.IsVisible(RMenu:Get('hydradev', 'main'), true, true, true, function()



            RageUI.Separator("↓ ~y~   Bateaux  ~s~↓")





            RageUI.ButtonWithStyle("Jetski", nil, {RightLabel = "~g~500$"},true, function(Hovered, Active, Selected)

            if (Selected) then   

                TriggerServerEvent('hydradev:vehicule', 'seashark', 200)

                RageUI.CloseAll()

            end

            end)



                       RageUI.ButtonWithStyle("Zodiac", nil, {RightLabel = "~g~3000$"},true, function(Hovered, Active, Selected)

            if (Selected) then   

                TriggerServerEvent('hydradev:vehicule', 'dinghy2', 3000)

                RageUI.CloseAll()

            end

            end)



            RageUI.ButtonWithStyle("Bateau de Luxe", nil, {RightLabel = "~g~4000$"},true, function(Hovered, Active, Selected)

                if (Selected) then   

                    TriggerServerEvent('hydradev:vehicule', 'jetmax', 4000)

                    RageUI.CloseAll()

                end

                end)



            RageUI.ButtonWithStyle("Ranger le véhicule", "Pour ranger le véhicule.", {RightLabel = "→→→"},true, function(Hovered, Active, Selected)

                if (Selected) then   

                local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)

                if dist4 < 4 then

                    ESX.ShowAdvancedNotification("Garagiste Bateaux ", "Le véhicule est de retour merci!", "", "CHAR_SOCIAL_CLUB", 1)

                    DeleteEntity(veh)

                end 

                end

                end)  





        end, function()

        end)



        Citizen.Wait(0)

    end

end)







Citizen.CreateThread(function()

        while true do

            Citizen.Wait(0)

    

            for k in pairs(position) do

    

                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

    

                if dist <= 3.0 then

                    RageUI.Text({

                        message = "Appuyez sur [~b~E~w~] pour louer un véhicule",

                        time_display = 1

                    })

                    if IsControlJustPressed(1,51) then

                        RageUI.Visible(RMenu:Get('hydradev', 'main'), not RageUI.Visible(RMenu:Get('hydradev', 'main')))

                    end   

                end

            end

        end

    end)



RegisterNetEvent('hydradev:spawnCar')
AddEventHandler('hydradev:spawnCar', function(car)  
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -735.47, -1382.02, -0.47, 127.14, true, false)
	local playerPed = PlayerPedId()
	local plaque = "Prestige"
    SetVehicleNumberPlateText(vehicle, plaque) 
	TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
end)




Citizen.CreateThread(function()

    local hash = GetHashKey("csb_sol")



    while not HasModelLoaded(hash) do

        RequestModel(hash)

        Wait(20)

    end



    ped = CreatePed("a_m_m_beach_02", "csb_sol", -732.42, -1381.91, 0.6 , 236.03, false, true)

    SetBlockingOfNonTemporaryEvents(ped, true)

    SetEntityInvincible(ped, true)

    FreezeEntityPosition(ped, true)

end)

