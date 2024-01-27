local licenseLocation = Config.LicenseLocation
local licensePrice = Config.LicensePrice
-- Event handler to display notifications
-- Event handler to display notifications
RegisterNetEvent('notification:display')
AddEventHandler('notification:display', function(data)
    local defaultDuration = Config.DefaultDuration
    local defaultPosition = Config.DefaultPosition
    local defaultIcon = Config.DefaultIcon
    local defaultAlignIcon = Config.DefaultAlignIcon

    local notificationType = data.type
    local notificationDescription = data.description

    local icon = Config.NotificationTypes[notificationType] or defaultIcon

    lib.notify({
        type = notificationType,
        title = notificationType:sub(1, 1):upper() .. notificationType:sub(2), -- Capitalize the first letter
        description = notificationDescription,
        duration = defaultDuration,
        position = defaultPosition,
        icon = icon,
        alignIcon = defaultAlignIcon
    })
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        local distance = #(playerPos - licenseLocation)

        if distance < 2.0 then
            DrawText3D(licenseLocation.x, licenseLocation.y, licenseLocation.z, "~b~Press E to buy a driver's license for $" .. licensePrice)
            if IsControlJustReleased(0, 38) then -- 'E' key
                TriggerServerEvent('buyDriverLicense') -- Send an event to the server to handle the purchase
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)

    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end
