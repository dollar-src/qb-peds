local QBCore = exports['qb-core']:GetCoreObject()


local function SetPlayerPed(pedmodel)
    local hash = GetHashKey(pedmodel)
    RequestModel(hash)
    while not HasModelLoaded(hash) or not IsModelInCdimage(hash) do
        RequestModel(hash)
        Citizen.Wait(4)
    end

    SetPlayerModel(PlayerId(), hash)
    SetPedDefaultComponentVariation(PlayerPedId())

    SetModelAsNoLongerNeeded(hash)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('checkpedif', function(cb)
        SetPlayerPed(cb)
    end)
end)

RegisterCommand('pedmenu', function(count)
    QBCore.Functions.TriggerCallback('getpedamount', function(cb)
    local pedname = exports['qb-input']:ShowInput({
        header = 'Available Peds : ' .." " .."" ..cb,
        submitText = 'Change Ped',
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'amount',
                text = 'Ped Name e.a: a_f_y_eastsa_03' 
         }
        }

    })

    if cb > 0 then
        
        TriggerServerEvent('changeped' , pedname.amount)
        TriggerServerEvent("deletecount")
        SetPlayerPed(pedname.amount)
    else
        
        QBCore.Functions.Notify("Not Enough ", "error")

    end
    
    end)
end)

