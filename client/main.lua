CreateThread(function()
    while true do
        local s = 1000
        local player, playerCoords = cache.ped, GetEntityCoords(cache.ped)
        
        for _, model in pairs(Config.MaquinasExpendedoras) do
            local prop = GetClosestObjectOfType(playerCoords, 1.5, model, false, false, false)
            
            if prop ~= 0 then
                local propCoords = GetEntityCoords(prop)
                
                if #(playerCoords - propCoords) < 2 then
                    s = 0
                    
                    if not IsPedInAnyVehicle(player) and not IsPedRagdoll(player) and not IsPedFalling(player) then
                        if IsControlJustPressed(0, 38) then
                            local options = {}
                            
                            for _, item in pairs(Config.Items) do
                                table.insert(options, {
                                    title = item.label,
                                    description = ("Precio: $%s"):format(item.price),
                                    icon = 'shopping-cart',
                                    onSelect = function()
                                        local input = lib.inputDialog('Cantidad a comprar', {
                                            {
                                                type = 'number',
                                                label = 'Cantidad',
                                                description = '¿Cuántos quieres comprar?',
                                                min = 1,
                                                required = true
                                            }
                                        })
                                        
                                        if not input then return end
                                        local quantity = tonumber(input[1])
                                        if not quantity or quantity <= 0 then
                                            lib.notify({type = 'error', description = 'Cantidad inválida'})
                                            return
                                        end
                                        
                                        local total = quantity * tonumber(item.price)
                                        lib.callback('g-maquinasexpendedoras:buyItem', false, function() end, item.value, item.label, quantity, total)
                                    end
                                })
                            end
                            
                            lib.registerContext({
                                id = 'vending_machine_menu',
                                title = 'Máquina expendedora',
                                options = options
                            })
                            
                            lib.showContext('vending_machine_menu')
                        end
                        
                        DrawText3D(propCoords + vec3(0,0,1.2), 'Máquina expendedora\n~p~E~s~ - Para Interactuar', 0.6, 2)
                    end
                end
            end
        end
        Wait(s)
    end
end)

function DrawText3D(coords, text, size, font)

    local coords = vector3(coords.x, coords.y, coords.z)



    local camCoords = GetGameplayCamCoords()

    local distance = #(coords - camCoords)



    if not size then size = 1 end

    if not font then font = 0 end



    local scale = (size / distance) * 2

    local fov = (1 / GetGameplayCamFov()) * 100

    scale = scale * fov



    SetTextScale(0.0 * scale, 0.55 * scale)

    SetTextFont(font)

    SetTextColour(255, 255, 255, 215)

    SetTextDropshadow(0, 0, 0, 0, 255)

    SetTextEdge(2, 0, 0, 0, 150)

    SetTextDropShadow()

    SetTextOutline()

    SetTextEntry("STRING")

    SetTextCentre(true)



    SetDrawOrigin(coords, 0)

    BeginTextCommandDisplayText('STRING')

    AddTextComponentSubstringPlayerName(text)

    EndTextCommandDisplayText(0.0, 0.0)

    ClearDrawOrigin()

end

