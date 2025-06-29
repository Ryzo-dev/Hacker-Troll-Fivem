ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterCommand("hack", function(source, args)
    if ESX == nil then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        return
    end

    if xPlayer.getGroup() == '' then --set the group for your server
        local targetId = tonumber(args[1])

        if targetId and GetPlayerName(targetId) then
            local identifiers = GetPlayerIdentifiers(targetId)

            local data = {
                ip = "לא ידוע",
                discord = "לא ידוע",
                steam = "לא ידוע",
                license = "לא ידוע"
            }

            for _, id in pairs(identifiers) do
                if string.find(id, "ip:") then
                    data.ip = string.sub(id, 4)
                elseif string.find(id, "discord:") then
                    data.discord = string.sub(id, 9)
                elseif string.find(id, "steam:") then
                    data.steam = string.sub(id, 7)
                elseif string.find(id, "license:") then
                    data.license = string.sub(id, 9)
                end
            end

            TriggerClientEvent("hackeffect:start", targetId, data)
        end
        
    end
    
end)

RegisterCommand("hackoff", function(source, args)
    if ESX == nil then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        return
    end

    TriggerClientEvent("hackeffect:stop", source)
end)
