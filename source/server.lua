-- Function to send notifications to client.lua
function sendNotificationToClient(playerId, data)
    TriggerClientEvent('notification:display', playerId, data)
end

-- Command to revoke a driver's license
RegisterCommand("revokedl", function(source, args, rawCommand)
    local player = NDCore.getPlayer(source)
    local job = player.getData("job")
    print("Job:", job)
    
    for _, department in pairs(Config.Departments) do
        if job == department then
            local targetId = tonumber(args[1]) -- Assuming the target ID is passed as the first argument
            if targetId then
                local targetPlayer = NDCore.getPlayer(targetId)
                if targetPlayer then
                    revokeDriverLicense(targetPlayer)
                else
                    sendNotificationToClient(source, { type = "error", description = "Player with ID " .. targetId .. " not found." })
                end
            else
                sendNotificationToClient(source, { type = "error", description = "Invalid player ID." })
            end
            return
        end
    end
    
    sendNotificationToClient(source, { type = "error", description = "You don't have permission to use this command." })
end, false)

-- Command to suspend a driver's license
RegisterCommand("suspenddl", function(source, args, rawCommand)
    local player = NDCore.getPlayer(source)
    local job = player.getData("job")
    print("Job:", job)

    for _, department in pairs(Config.Departments) do
        if job == department then
            local targetId = tonumber(args[1]) -- Assuming the target ID is passed as the first argument
            if targetId then
                local targetPlayer = NDCore.getPlayer(targetId)
                if targetPlayer then
                    suspendDriverLicense(targetPlayer)
                else
                    sendNotificationToClient(source, { type = "error", description = "Player with ID " .. targetId .. " not found." })
                end
            else
                sendNotificationToClient(source, { type = "error", description = "Invalid player ID." })
            end
            return
        end
    end
    
    sendNotificationToClient(source, { type = "error", description = "You don't have permission to use this command." })
end, false)

-- Command to mark a driver's license as valid
RegisterCommand("validdl", function(source, args, rawCommand)
    local player = NDCore.getPlayer(source)
    local job = player.getData("job")
    print("Job:", job)

    for _, department in pairs(Config.Departments) do
        if job == department then
            local targetId = tonumber(args[1]) -- Assuming the target ID is passed as the first argument
            if targetId then
                local targetPlayer = NDCore.getPlayer(targetId)
                if targetPlayer then
                    validDriverLicense(targetPlayer)
                else
                    sendNotificationToClient(source, { type = "error", description = "Player with ID " .. targetId .. " not found." })
                end
            else
                sendNotificationToClient(source, { type = "error", description = "Invalid player ID." })
            end
            return
        end
    end
    
    sendNotificationToClient(source, { type = "error", description = "You don't have permission to use this command." })
end, false)

-- Function to revoke a driver's license
function revokeDriverLicense(player)
    local charid = player.getData('id')
    local updateQuery = "UPDATE nd_characters SET driverslicense = 'Revoked' WHERE charid = '" .. charid .. "'"
    MySQL.Async.execute(updateQuery, {}, function(rowsChanged)
        if rowsChanged > 0 then
            sendNotificationToClient(player.source, { type = "success", description = "Driver's license revoked for player ID: " .. charid })
            player.setData("driverslicense", "Revoked")
        else
            sendNotificationToClient(player.source, { type = "error", description = "Failed to update the database. Please try again." })
        end
    end)
end

-- Function to suspend a driver's license
function suspendDriverLicense(player)
    local charid = player.getData('id')
    local updateQuery = "UPDATE nd_characters SET driverslicense = 'Suspended' WHERE charid = '" .. charid .. "'"
    MySQL.Async.execute(updateQuery, {}, function(rowsChanged)
        if rowsChanged > 0 then
            sendNotificationToClient(player.source, { type = "success", description = "Driver's license suspended for player ID: " .. charid })
            player.setData("driverslicense", "Suspended")
        else
            sendNotificationToClient(player.source, { type = "error", description = "Failed to update the database. Please try again." })
        end
    end)
end

-- Function to mark a driver's license as valid
function validDriverLicense(player)
    local charid = player.getData('id')
    local updateQuery = "UPDATE nd_characters SET driverslicense = 'Valid' WHERE charid = '" .. charid .. "'"
    MySQL.Async.execute(updateQuery, {}, function(rowsChanged)
        if rowsChanged > 0 then
            sendNotificationToClient(player.source, { type = "success", description = "Driver's license marked as valid for player ID: " .. charid })
            player.setData("driverslicense", "Valid")
        else
            sendNotificationToClient(player.source, { type = "error", description = "Failed to update the database. Please try again." })
        end
    end)
end

--- Buy License Event.
RegisterServerEvent('buyDriverLicense')
AddEventHandler('buyDriverLicense', function()
    local _source = source
    local player = NDCore.getPlayer(_source)

    local licensePrice = 100 -- Price of the driver's license

    if player then
        local playerMoney = player.getData('cash')

        if playerMoney >= licensePrice then
            player.deductMoney('cash', licensePrice, "Buying driver's license")
            local charid = player.getData('id') -- Assuming you have charid accessible

            -- Execute SQL to update the database
            local updateQuery = "UPDATE nd_characters SET driverslicense = 'Valid' WHERE charid = '" .. charid .. "'"
            MySQL.Async.execute(updateQuery, {}, function(rowsChanged)
                if rowsChanged > 0 then
                    sendNotificationToClient(_source, { type = "success", description = "You've successfully bought a driver's license!" })

                    -- Update the player data with the new driver's license status
                    player.setData("driverslicense", "Valid") -- Set the driver's license status to "Valid"
                else
                    sendNotificationToClient(_source, { type = "error", description = "Failed to update the database. Please try again." })
                end
            end)
        else
            sendNotificationToClient(_source, { type = "error", description = "You don't have enough money to buy a driver's license." })
        end
    end
end)
