if not IsDuplicityVersion() then
    HUD = false

    local NuiReady = false
    RegisterNUICallback('nuiReady', function(_, cb)
        NuiReady = true
        cb({})
    end)

    ---Easier NUI Messages
    ---@param action string
    ---@param message any
    function SendMessage(action, message)
        SendNUIMessage({
            action = action,
            message = message
        })
    end

    ---Initialize HUD
    function InitializeHUD()
        DisplayRadar(false)
        repeat Wait(100) until PlayerLoaded and NuiReady

        if GetConvar('hud:circleMap', 'true') == 'true' then
            RequestStreamedTextureDict('circlemap', false)
            repeat Wait(100) until HasStreamedTextureDictLoaded('circlemap')
            AddReplaceTexture('platform:/textures/graphics', 'radarmasksm', 'circlemap', 'radarmasksm')

            SetMinimapClipType(1)
            SetMinimapComponentPosition('minimap', 'L', 'B', -0.017, -0.02, 0.207, 0.32)
            SetMinimapComponentPosition('minimap_mask', 'L', 'B', 0.06, 0.00, 0.132, 0.260)
            SetMinimapComponentPosition('minimap_blur', 'L', 'B', 0.005, -0.05, 0.166, 0.257)
        else
            SetMinimapComponentPosition('minimap', 'L', 'B', 0.0, -0.035, 0.18, 0.21)
            SetMinimapComponentPosition('minimap_mask', 'L', 'B', 0.0, -0.05, 0.132, 0.19)
            SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.025, -0.015, 0.3, 0.25)
        end


        SetRadarBigmapEnabled(true, false)
        SetRadarBigmapEnabled(false, false)
        Wait(500)

        if IsPedSwimming(cache.ped) then
            lib.notify({
                id = 'xhud:swimming',
                title = 'HUD',
                description = 'Looks like you are swimming, please don\'t go underwater while the HUD is loading.',
                type = 'inform',
                duration = 5000
            })
            local timer = 5000
            while not maxUnderwaterTime do
                Wait(1000)
                timer -= 1000
                if not IsPedSwimmingUnderWater(cache.ped) then
                    maxUnderwaterTime = timer == 0 and GetPlayerUnderwaterTimeRemaining(cache.playerId) or nil
                else
                    timer = 5000
                    lib.notify({
                        id = 'xhud:initializing',
                        title = 'HUD',
                        description = 'Please stay on the surface for at least 5 seconds!',
                        type = 'inform',
                        duration = 5000
                    })
                end
            end
        else
            maxUnderwaterTime = GetPlayerUnderwaterTimeRemaining(cache.playerId)
        end

        SendMessage('setPlayerId', cache.serverId)

        if GetConvar('hud:logo', 'true') == 'true' then
            SendMessage('setLogo')
        end

        local position = GetConvar('hud:position', 'bottom')
        local hPosition = GetConvar('hud:hposition', 'center')
        SendMessage('setPosition', { v = position, h = hPosition })

        HUD = true
        SendMessage('toggleHud', HUD)
    end

    AddEventHandler('onResourceStart', function(resourceName)
        if cache.resource ~= resourceName then return end
        InitializeHUD()
    end)

    -- Commands
    RegisterCommand('togglehud', function()
        HUD = not HUD
        SendMessage('toggleHud', HUD)
        lib.notify({
            id = 'xhud:toggle',
            title = 'HUD',
            description = HUD and 'HUD enabled' or 'HUD disabled',
            type = 'inform',
            duration = 2000
        })
    end, false)

    RegisterCommand('reloadhud', function()
        InitializeHUD()
        DisplayRadar(true)
        lib.notify({
            id = 'xhud:reload',
            title = 'HUD',
            description = 'HUD reloaded successfully',
            type = 'inform',
            duration = 2000
        })
    end, false)

    RegisterCommand('sethudposition', function(_, args)
        if not args[1] then
            lib.notify({
                id = 'xhud:position:error',
                title = 'HUD',
                description = 'Usage: /sethudposition [top|middle|bottom] [left|center|right]',
                type = 'error',
                duration = 3000
            })
            return
        end
        local position = args[1]:lower()
        local hPosition = args[2] and args[2]:lower() or 'center'
        if position ~= 'top' and position ~= 'middle' and position ~= 'bottom' then
            lib.notify({
                id = 'xhud:position:error',
                title = 'HUD',
                description = 'Invalid position. Use: top, middle, or bottom',
                type = 'error',
                duration = 3000
            })
            return
        end
        if hPosition ~= 'left' and hPosition ~= 'center' and hPosition ~= 'right' then
            lib.notify({
                id = 'xhud:position:error',
                title = 'HUD',
                description = 'Invalid horizontal position. Use: left, center, or right',
                type = 'error',
                duration = 3000
            })
            return
        end
        ExecuteCommand('set hud:position ' .. position)
        ExecuteCommand('set hud:hposition ' .. hPosition)
        SendMessage('setPosition', { v = position, h = hPosition })
        lib.notify({
            id = 'xhud:position',
            title = 'HUD',
            description = 'HUD position set to: ' .. position .. ' ' .. hPosition,
            type = 'success',
            duration = 2000
        })
    end, false)
else
    if GetConvar('hud:versioncheck', 'true') == 'true' then
        lib.versionCheck('michatec/xhud')
    end
end
