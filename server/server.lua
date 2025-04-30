ESX = exports['es_extended']:getSharedObject()

lib.callback.register('g-maquinasexpendedoras:buyItem', function(source, itemValue, itemLabel, quantity, total)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    if xPlayer.getAccount(Config.Account).money < total then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = 'No tienes suficiente dinero'
        })
        return false
    end

    if Config.Inventory == 'ox_inventory' then
        if exports.ox_inventory:CanCarryItem(source, itemValue, quantity) then
            xPlayer.removeAccountMoney(Config.Account, total)
            exports.ox_inventory:AddItem(source, itemValue, quantity)
            
            TriggerClientEvent('ox_lib:notify', source, {
                type = 'success',
                description = ('Has comprado %sx %s por $%s'):format(quantity, itemLabel, total)
            })
            return true
        else
            TriggerClientEvent('ox_lib:notify', source, {
                type = 'error',
                description = 'No puedes cargar más items'
            })
            return false
        end
    else
        if xPlayer.canCarryItem(itemValue, quantity) then
            xPlayer.removeAccountMoney(Config.Account, total)
            xPlayer.addInventoryItem(itemValue, quantity)
            
            TriggerClientEvent('ox_lib:notify', source, {
                type = 'success',
                description = ('Has comprado %sx %s por $%s'):format(quantity, itemLabel, total)
            })
            return true
        else
            TriggerClientEvent('ox_lib:notify', source, {
                type = 'error',
                description = 'No puedes cargar más items'
            })
            return false
        end
    end
end)
