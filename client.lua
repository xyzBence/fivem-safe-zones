ESX = nil
local isInSafezone = false
local lastSafezoneState = false


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


local function isPlayerInSafezone()
    local playerCoords = GetEntityCoords(PlayerPedId()) 
    for _, zone in ipairs(Config.Safezones) do
        local distance = #(playerCoords - zone.coords) 
        if distance <= zone.radius then
            return true
        end
    end
    return false
end


Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        isInSafezone = isPlayerInSafezone()


        if isInSafezone and not lastSafezoneState then
            ESX.ShowNotification('Beléptél egy védett zónába!')     -- Entry notification
            SetEntityInvincible(ped, true)
            SetEntityCanBeDamaged(ped, false)
        elseif not isInSafezone and lastSafezoneState then
            ESX.ShowNotification('Elhagytad a védett zónát!')       -- Exit notification
            SetEntityInvincible(ped, false)
            SetEntityCanBeDamaged(ped, true)
        end

        lastSafezoneState = isInSafezone

        -- Akciók tiltása zónán belül
        if isInSafezone then
            -- Általános akciók
            DisableControlAction(0, 24, true)   -- Attack
            DisableControlAction(0, 25, true)   -- Aim
            DisableControlAction(0, 47, true)   -- Weapon usage
            DisableControlAction(0, 58, true)   -- Weapon alternative
            DisableControlAction(0, 69, true)   -- Vehicle weapon usage
            DisableControlAction(0, 70, true)   -- Vehicle aiming
            DisableControlAction(0, 92, true)   -- Vehicle shooting
            DisableControlAction(0, 140, true)  -- Melee alternative

            DisablePlayerFiring(ped, true) -- shooting
        end

        Citizen.Wait(0)
    end
end)

-- Blips
Citizen.CreateThread(function()
    for _, zone in ipairs(Config.Safezones) do
        -- circle
        local blip = AddBlipForRadius(zone.coords, zone.radius)
        SetBlipColour(blip, Config.BlipColor)
        SetBlipAlpha(blip, Config.BlipAlpha)
        SetBlipHighDetail(blip, true)
    end
end)
