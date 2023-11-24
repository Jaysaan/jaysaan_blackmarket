lib.locale()

RegisterServerEvent('Jaysaan:buyItem')
AddEventHandler('Jaysaan:buyItem', function (itemName, itemPrice)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local playerMoney = xPlayer.getMoney()

    if playerMoney >= itemPrice then 
        if xPlayer ~= nil then 
            xPlayer.removeMoney(itemPrice)
            xPlayer.addInventoryItem(itemName, 1)
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {type = 'error', description = locale('notify_desc')})
    end
end)