

RegisterNetEvent("xRent:Open")
AddEventHandler("xRent:Open", function()
    OpenMenu()
end)

local targetCache = {}
function InitInteraction()
    WaitCore()
    if Config.InteractionHandler == 'ox_target'  then
        if targetCache['xRent'] then return end
        
        targetCache['xRent'] = true
        for _,v in pairs(Config.Rent) do
            exports.ox_target:addBoxZone({
                name = 'xRent'.._,
                coords = v.coords,
                size = vec3(3.6, 3.6, 3.6),
                drawSprite = true,
                options =  {
                    {
                        name = 'xRent'.._,
                        event = 'xRent:Open',
                        icon = 'fas fa-gears',
                        label = locales.open_menu_target,
                    }
                }
            })

        end
    end
    if Config.InteractionHandler == 'qb_target'  then
        if targetCache['xRent'] then return end
        targetCache['xRent'] = true
        for _,v in pairs(Config.Rent) do
        
            exports['qb-target']:AddBoxZone('xRent', v.coords, 1.5, 1.6,
                {
                    name = 'xRent'.._,
                    heading = 12.0,
                    debugPoly = false,
                    minZ = v.coords.z - 1,
                    maxZ = v.coords.z + 1,
                }, 
                {
                options = {
                    {
                        num = 1,
                        type = "client",
                        icon = 'fas fa-gears',
                        label = locales.open_menu_target,
                        targeticon = 'fas fa-gears',
                        action = function()
                            TriggerEvent("xRent:Open")
                        end
                    }
                },
                distance = 2.5,
            })
        end
    end
    if Config.InteractionHandler == 'qb_textui' then
        
        if targetCache['xRent'] then return end
        targetCache['xRent'] = true
        CreateThread(function()
            while true do
                local show = false
                local cd = 1500
                local plyCoords = GetEntityCoords(PlayerPedId())
                for _,v in pairs(Config.Rent) do
                    local vec =  v.coords
                    local dist = #(vec - plyCoords)
                    if dist < 2.0  then
                        cd = 0
                        if not show then
                            TriggerEvent('qb-core:client:DrawText', locales.open_menu_text, 'left')

                            show = true
                        end
                        if IsControlJustPressed(0, 38) then
                            TriggerEvent("xRent:Open")                         
                        end
                    else
                        if show then
                            show = false
                            TriggerEvent('qb-core:client:HideText')
                        end
                    end
                end
                
                Wait(cd)
            end
        end)
    end 
    if Config.InteractionHandler == 'esx_textui' then
        
        if targetCache['xRent'] then return end
        targetCache['xRent'] = true

        CreateThread(function()
            local show = false
            while true do
                
                local cd = 1500
                local plyCoords = GetEntityCoords(PlayerPedId())
                for _,v in pairs(Config.Rent) do
            
                    local vec = v.coords
                    local dist = #(vec - plyCoords)
                    if dist < 2.0 then
                        cd = 0
                        if not show then
                            Core.TextUI(locales.open_menu_text)
                            show = true
                        end
                        if IsControlJustPressed(0, 38) then
                            TriggerEvent("xRent:Open")
    
                        end
                    else
                        if show then
                            show = false
                            Core.HideUI()
                        end
                    end
                end
              
                Wait(cd)
            end
        end)
    end 
    if Config.InteractionHandler == 'codem_textui' then
        
        if targetCache['xRent'] then return end
        targetCache['xRent'] = true

        CreateThread(function()
            local show = false
            while true do
                
                local cd = 1500
                local plyCoords = GetEntityCoords(PlayerPedId())
                for _,v in pairs(Config.Rent) do
            
                    local vec = v.coords
                    local dist = #(vec - plyCoords)
                    if dist < 2.0 then
                        cd = 0
                        if not show then
                            Core.TextUI(locales.open_menu_text)
                            TriggerEvent("codem-textui:ShowTextUI", locales.open_menu_text, "xcar-rent", "thema-1")
                            show = true
                        end
                        if IsControlJustPressed(0, 38) then
                            TriggerEvent("xRent:Open")
    
                        end
                    else
                        if show then
                            show = false
                            TriggerEvent("codem-textui:CloseTextUI")
                        end
                    end
                end
              
                Wait(cd)
            end
        end)
    end 
    if Config.InteractionHandler == 'drawtext' then
        if targetCache['xRent'] then return end
        targetCache['xRent'] = true
        CreateThread(function()
            while true do
                local cd = 1500
                local plyCoords = GetEntityCoords(PlayerPedId())
                for _,v in pairs(Config.Rent) do                
                    local vec = v.coords
                    local dist = #(vec - plyCoords)
                    if dist < 2.0 then
                        cd = 0
                        DrawMarker(2, vec, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, false,
                            true, false, false, false)
                        DrawText3D(vec.x, vec.y, vec.z, locales.open_menu_text)
                        if IsControlJustPressed(0, 38) then
                            TriggerEvent("xRent:Open")
    
                        end
                    end
                end
                Wait(cd)
            end
        end)
    end
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function CreateBlip()
    local blipConfig = Config.Blip
    if blipConfig.show then
        for _,v in pairs(Config.Rent ) do
            local blip = AddBlipForCoord(v.coords)
        
            SetBlipSprite(blip, blipConfig.sprite)
            SetBlipColour(blip, blipConfig.color)
            SetBlipScale(blip, blipConfig.scale)
            SetBlipAsShortRange(blip, true)
        
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(blipConfig.name)
            EndTextCommandSetBlipName(blip)
        end
    end
end

CreateThread(function()
    InitInteraction()
    CreateBlip()

end)


