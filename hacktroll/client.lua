RegisterNetEvent("hackeffect:start")
AddEventHandler("hackeffect:start", function(data)
    print("hackeffect:start triggered on client")
    print("Data:", json.encode(data))

    SendNUIMessage({
        action = "show",
        ip = data.ip,
        discord = data.discord,
        steam = data.steam,
        license = data.license
    })

    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)


     Citizen.CreateThread(function()
         Citizen.Wait(45000)
         SendNUIMessage({ action = "hide" })
     end)
end)

RegisterNetEvent("hackeffect:stop")
AddEventHandler("hackeffect:stop", function()
    print("hackeffect:stop triggered on client")

    SendNUIMessage({ action = "hide" })

end)
