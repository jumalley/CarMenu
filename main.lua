--[[
██████╗░░█████╗░██████╗░██╗░█████╗░██╗░░░░░  ███╗░░░███╗███████╗███╗░░██╗██╗░░░██╗
██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗██║░░░░░  ████╗░████║██╔════╝████╗░██║██║░░░██║
██████╔╝███████║██║░░██║██║███████║██║░░░░░  ██╔████╔██║█████╗░░██╔██╗██║██║░░░██║
██╔══██╗██╔══██║██║░░██║██║██╔══██║██║░░░░░  ██║╚██╔╝██║██╔══╝░░██║╚████║██║░░░██║
██║░░██║██║░░██║██████╔╝██║██║░░██║███████╗  ██║░╚═╝░██║███████╗██║░╚███║╚██████╔╝
╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝╚═╝░░╚═╝╚══════╝  ╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░╚═════╝░
]]--

lib.locale()

local windows = { true, true, true, true }

--[[
█▀▀ ▄▀█ █▀█   █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█ █▀
█▄▄ █▀█ █▀▄   ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀ ▄█
]]--

lib.registerRadial({
    id = 'car_doors',
    items = {
        {
            label = "Arrière droite",
            icon = 'car-side',
            keepOpen = true,
            onSelect = function()
                doorToggle(3)
            end
        },
        {
            label = "Coffre",
            icon = 'car-rear',
            keepOpen = true,
            onSelect = function()
                doorToggle(5)
            end
        },
        {
            label = "Avant droite",
            icon = 'car-side',
            keepOpen = true,
            onSelect = function()
                doorToggle(1)
            end
        },
        {
            label = "Avant gauche",
            icon = 'car-side',
            keepOpen = true,
            onSelect = function()
                doorToggle(0)
            end
        },
        {
            label = "Capôt",
            icon = 'car',
            keepOpen = true,
            onSelect = function()
                doorToggle(4)
            end
        },
        {
            label = "Arrière gauche",
            icon = 'car-side',
            keepOpen = true,
            onSelect = function()
                doorToggle(2)
            end
        },
    }
})

--[[
█▀▀ ▄▀█ █▀█   █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█ █▀
█▄▄ █▀█ █▀▄   ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀ ▄█
]]--

lib.registerRadial({
    id = 'car_windows',
    items = {
        {
            label = "Arrière droite",
            icon = 'caret-right',
            keepOpen = true,
            onSelect = function()
                windowToggle(2, 3)
            end
        },
        {
            label = "Passager",
            icon = 'caret-up',
            keepOpen = true,
            onSelect = function()
                windowToggle(1, 1)
            end
        },
        {
            label = "Conducteur",
            icon = 'caret-up',
            keepOpen = true,
            onSelect = function()
                windowToggle(0, 0)
            end
        },
        {
            label = "Arrière gauche",
            icon = 'caret-left',
            keepOpen = true,
            onSelect = function()
                windowToggle(3, 2)
            end
        },
    }
})

--[[
█▀▀ ▄▀█ █▀█   █▀ █▀▀ ▄▀█ ▀█▀ █▀
█▄▄ █▀█ █▀▄   ▄█ ██▄ █▀█ ░█░ ▄█
]]--

lib.registerRadial({
    id = 'car_seats',
    items = {
        {
            label = "Arrière droite",
            icon = 'caret-right',
            onSelect = function()
                changeSeat(2)
            end
        },
        {
            label = "Passager",
            icon = 'caret-up',
            onSelect = function()
                changeSeat(0)
            end
        },
        {
            label = "Conducteur",
            icon = 'caret-up',
            onSelect = function()
                changeSeat(-1)
            end
        },
        {
            label = "Arrière gauche",
            icon = 'caret-left',
            onSelect = function()
                changeSeat(1)
            end
        },
    }
})

--[[
█░█ █▀▀ █░█ █ █▀▀ █░░ █▀▀   █▀▄▀█ █▀▀ █▄░█ █░█
▀▄▀ ██▄ █▀█ █ █▄▄ █▄▄ ██▄   █░▀░█ ██▄ █░▀█ █▄█
]]--

lib.registerRadial({
    id = 'vehicle_menu',
    items = {
        {
            label = 'Moteur',
            icon = 'power-off',
            onSelect = function()
                if cache.vehicle then
                    local engineRunning = GetIsVehicleEngineRunning(cache.vehicle)

                    if engineRunning then
                        SetVehicleEngineOn(cache.vehicle, false, true, true)
                    else
                        SetVehicleEngineOn(cache.vehicle, true, true, true)
                    end
                end
            end
        },
        {
            label = "Portes",
            icon = 'door-closed',
            menu = 'car_doors'
        },
        {
            label = "Fenêtres",
            icon = 'window-maximize',
            menu = 'car_windows'
        },
        {
            label = "Siège",
            icon = 'chair',
            menu = 'car_seats'
        },
        {
            label = "Ceinture",
            icon = "user-lock",
            onSelect = function()
            ExecuteCommand('/toggleseatbelt')
            end
        }
    }
})

--[[
█░█ █▀▀ █░█ █ █▀▀ █░░ █▀▀   █▀▀ █░█ █▀▀ █▀▀ █▄▀
▀▄▀ ██▄ █▀█ █ █▄▄ █▄▄ ██▄   █▄▄ █▀█ ██▄ █▄▄ █░█
]]--

lib.onCache('vehicle', function(value)
    if value then
        lib.addRadialItem({
            {
                id = 'vehicle',
                label = "Véhicule",
                icon = 'car',
                menu = 'vehicle_menu'
            }
        })
    else
        lib.removeRadialItem('vehicle')
    end
end)

--[[
█▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█   █▀▄ █▀█ █▀█ █▀█ ▀█▀ █▀█ █▀▀ █▀▀ █░░ █▀▀
█▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█   █▄▀ █▄█ █▄█ █▀▄ ░█░ █▄█ █▄█ █▄█ █▄▄ ██▄
]]--

function doorToggle(door)
    if GetVehicleDoorAngleRatio(cache.vehicle, door) > 0.0 then
        SetVehicleDoorShut(cache.vehicle, door, false, false)
    else
        SetVehicleDoorOpen(cache.vehicle, door, false, false)
    end
end

--[[
█▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█   █▀▀ █░█ ▄▀█ █▄░█ █▀▀ █▀▀ █▀ █▀▀ ▄▀█ ▀█▀
█▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█   █▄▄ █▀█ █▀█ █░▀█ █▄█ ██▄ ▄█ ██▄ █▀█ ░█░
]]--

function changeSeat(seat) -- Check seat is empty and move to it
    if (IsVehicleSeatFree(cache.vehicle, seat)) then
        SetPedIntoVehicle(cache.ped, cache.vehicle, seat)
    end
end

--[[
█▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█   █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█ ▀█▀ █▀█ █▀▀ █▀▀ █░░ █▀▀
█▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█   ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀ ░█░ █▄█ █▄█ █▄█ █▄▄ ██▄
]]--

function windowToggle(window, door) -- Check window is open/closed and do opposite
    if GetIsDoorValid(cache.vehicle, door) and windows[window + 1] then
        RollDownWindow(cache.vehicle, window)
        windows[window + 1] = false
    else
        RollUpWindow(cache.vehicle, window)
        windows[window + 1] = true
    end
end

--[[
░█████╗░░█████╗░███╗░░██╗████████╗███████╗██╗░░██╗████████╗  ███╗░░░███╗███████╗███╗░░██╗██╗░░░██╗
██╔══██╗██╔══██╗████╗░██║╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝  ████╗░████║██╔════╝████╗░██║██║░░░██║
██║░░╚═╝██║░░██║██╔██╗██║░░░██║░░░█████╗░░░╚███╔╝░░░░██║░░░  ██╔████╔██║█████╗░░██╔██╗██║██║░░░██║
██║░░██╗██║░░██║██║╚████║░░░██║░░░██╔══╝░░░██╔██╗░░░░██║░░░  ██║╚██╔╝██║██╔══╝░░██║╚████║██║░░░██║
╚█████╔╝╚█████╔╝██║░╚███║░░░██║░░░███████╗██╔╝╚██╗░░░██║░░░  ██║░╚═╝░██║███████╗██║░╚███║╚██████╔╝
░╚════╝░░╚════╝░╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░  ╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░╚═════╝░
]]--

local player = PlayerPedId()
local vehicle = GetVehiclePedIsIn(player, false)

--[[
█▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█   █▀█ █▀█ █▀▀ █▄░█ █▀▀ ▄▀█ █▀█ █▀▄▀█ █▀▀ █▄░█ █░█
█▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█   █▄█ █▀▀ ██▄ █░▀█ █▄▄ █▀█ █▀▄ █░▀░█ ██▄ █░▀█ █▄█
]]--

function OpenCarMenu()
        lib.registerContext({
            id = 'carmenu_open',
            title = 'Contrôle de voiture',
            onExit = function()
            end,
            options = {
                {
                    title = 'Allumer/éteindre le moteur',
                    description = 'Allumer/éteindre le moteur',
                    event = 'carmenu:turnengineoff'
                },
                {
                    title = 'Portes',
                    description = 'Ouvrir / fermer les portes',
                    event = "carmenu:opendoorsmenu"
                },
                {
                    title = 'Fenêtres',
                    description = 'Ouvrir / fermer les fenêtres',
                    event = "carmenu:openwindowsmenu"
                },

            }
        })
    lib.showContext('carmenu_open')
end

--[[
█▀▀ █▀█ █▀▄▀█ █▀▄▀█ ▄▀█ █▄░█ █▀▄
█▄▄ █▄█ █░▀░█ █░▀░█ █▀█ █░▀█ █▄▀
]]--

RegisterCommand("carmenu", function()
    local user = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(user,false)
    if IsPedInAnyVehicle(user) then
        OpenCarMenu()
    else
    end
end)

--[[
█▀▀ █▄░█ █▀▀ █ █▄░█ █▀▀
██▄ █░▀█ █▄█ █ █░▀█ ██▄
]]--

local engineoff = true
RegisterNetEvent("carmenu:turnengineoff", function()
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, false)
    local engineoff = GetIsVehicleEngineRunning(vehicle)
    if vehicle == 0 or GetPedInVehicleSeat(vehicle, -1) ~= player then return end
    if GetIsVehicleEngineRunning(vehicle) then
        lib.notify({
            title = 'Véhicule',
            description = 'Vous avez éteint votre véhicule.',
            type = 'success'
        })
    else
        lib.notify({
            title = 'Véhicule',
            description = 'Vous allumez votre moteur !',
            type = 'success'
        })
    end
    while (enigneoff == false) do
        SetVehicleUndriveable(vehicle,true)
        Wait(0)
    end
    SetVehicleEngineOn(vehicle, not GetIsVehicleEngineRunning(vehicle), false, true)
end)

--[[
█▀▄ █▀█ █▀█ █▀█ █▀
█▄▀ █▄█ █▄█ █▀▄ ▄█
]]--

RegisterNetEvent('carmenu:opendoorsmenu', function(data)
    lib.registerContext({
        id = 'carmenu_doors',
        title = 'Portes',
        options = {
            {
                title = 'Ouvrir/Fermer porte',
                description = 'Avant gauche',
                onSelect = function()
                    doorToggle(0)
                end
            },
            {
                title = 'Ouvrir/Fermer porte',
                description = 'Avant droite',
                onSelect = function()
                    doorToggle(1)
                end
            },
            {
                title = 'Ouvrir/Fermer porte',
                description = 'Arrière gauche',
                onSelect = function()
                    doorToggle(2)
                end
            },
            {
                title = 'Ouvrir/Fermer porte',
                description = 'Arrière droite',
                onSelect = function()
                    doorToggle(3)
                end
            },
            {
                title = 'Ouvrir/Fermer capôt',
                description = 'Capôt du véhicule',
                onSelect = function()
                doorToggle(4)
                end
            },
            {
                title = 'Ouvrir/Fermer coffre',
                description = 'Coffre du véhicule',
                onSelect = function()
                    doorToggle(5)
                end
            },
            {
                title = 'Ouvrir toutes les portes',
                description = 'Ouvrir toutes les portes',
                event = 'carmenu:openalldoors'
            },
            {
                title = 'Fermer toutes les portes',
                description = 'Fermer toutes les portes',
                event = 'carmenu:closealldoors'
            },
        }
    })
    lib.showContext('carmenu_doors')
end)

--[[
█▀█ █▀█ █▀▀ █▄░█   ▄▀█ █░░ █░░   █▀▄ █▀█ █▀█ █▀█ █▀
█▄█ █▀▀ ██▄ █░▀█   █▀█ █▄▄ █▄▄   █▄▀ █▄█ █▄█ █▀▄ ▄█
]]--

RegisterNetEvent("carmenu:openalldoors", function()
    local player = PlayerPedId()
	  local vehicle = GetVehiclePedIsIn(player,false)
    for i = 0, 5 do
        SetVehicleDoorOpen(vehicle, i, false)
    end
end)

--[[
█▀▀ █░░ █▀█ █▀ █▀▀   ▄▀█ █░░ █░░   █▀▄ █▀█ █▀█ █▀█ █▀
█▄▄ █▄▄ █▄█ ▄█ ██▄   █▀█ █▄▄ █▄▄   █▄▀ █▄█ █▄█ █▀▄ ▄█
]]--

RegisterNetEvent("carmenu:closealldoors", function()
    local player = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(player,false)

    for i = 0, 5 do
        SetVehicleDoorShut(vehicle, i, false)
    end
end)

--[[
█░█░█ █ █▄░█ █▀▄ █▀█ █░█░█ █▀
▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀ ▄█
]]--

RegisterNetEvent('carmenu:openwindowsmenu', function(data)
    lib.registerContext({
        id = 'carmenu_windows',
        title = 'Fenêtres',
        onExit = function()
        end,
        options = {
            {
                title = 'Baisser/Remonter fenêtre',
                description = 'Avant gauche',
                onSelect = function()
                    windowToggle(0, 0)
                end
            },
            {
                title = 'Baisser/Remonter fenêtre',
                description = 'Avant droite',
                onSelect = function()
                    windowToggle(1, 1)
                end
            },
            {
                title = 'Baisser/Remonter fenêtre',
                description = 'Arrière gauche',
                onSelect = function()
                    windowToggle(3, 2)
                end
            },
            {
                title = 'Baisser/Remonter fenêtre',
                description = 'Arrière droite',
                onSelect = function()
                    windowToggle(2, 3)
                end
            },
            {
                title = 'Baisser fenêtres',
                description = 'Baisser toutes les fenêtres',
                event = 'carmenu:openallwindows'
            },
            {
              title = 'Remonter fenêtres',
              description = 'Remonter toutes les fenêtres',
                event = 'carmenu:closeallwindows'
            },
        }
    })
    lib.showContext('carmenu_windows')
end)

--[[
█▀█ █▀█ █▀▀ █▄░█   ▄▀█ █░░ █░░   █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█ █▀
█▄█ █▀▀ ██▄ █░▀█   █▀█ █▄▄ █▄▄   ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀ ▄█
]]--

RegisterNetEvent("carmenu:openallwindows", function()
    local player = PlayerPedId()
	  local vehicle = GetVehiclePedIsIn(player,false)
    for i = 0, 5 do
        RollUpWindow(vehicle, i, false)
    end
end)

--[[
█▀▀ █░░ █▀█ █▀ █▀▀   ▄▀█ █░░ █░░   █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█ █▀
█▄▄ █▄▄ █▄█ ▄█ ██▄   █▀█ █▄▄ █▄▄   ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀ ▄█
]]--

RegisterNetEvent("carmenu:closeallwindows", function()
    local player = PlayerPedId()
	  local vehicle = GetVehiclePedIsIn(player,false)
    RollDownWindows(vehicle)
end)
