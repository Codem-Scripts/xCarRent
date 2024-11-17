Core = nil
local currentVeh = false
local currentTime = false
local deposit = false
CreateThread(function()
    Core, Config.Framework = GetCore()
end)

function WaitCore()
    while not Core do
        Wait(0)
    end
end

function TriggerCallback(name, data)
    local incomingData = false
    local status = 'UNKOWN'
    local counter = 0
    WaitCore()
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.TriggerServerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    else
        Core.Functions.TriggerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    end
    CreateThread(function()
        while incomingData == 'UNKOWN' do
            Wait(1000)
            if counter == 4 then
                status = 'FAILED'
                incomingData = false
                break
            end
            counter = counter + 1
        end
    end)

    while status == 'UNKOWN' do
        Wait(0)
    end
    return incomingData
end

function OpenMenu()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        payload = {
            categories = Config.Categories,
            vehicles = Config.Vehicles,
            locales = locales,
        }
    })
end

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('rentCar', function(data, cb)
    local vehicle = data.vehicle
    local price = data.price
    local time = data.time
    local deposit = data.deposit
    local type = data.type

    SpawnVehicle(vehicle, price, time, deposit, type)

end)

function CurrentShop()
    local current = false
    local lastDist = -1
    local coords = GetEntityCoords(PlayerPedId())
    for _,v in pairs(Config.Rent) do
        local dist = #(coords - v.coords)
        if lastDist == -1 or dist < lastDist then
            current = v
            lastDist = dist
        end
    end
    return current
end


local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end
function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end


function GetVehiclesInArea (coords, area)
	local vehicles       = GetVehicles()
	local vehiclesInArea = {}

	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

		if distance <= area then
			table.insert(vehiclesInArea, vehicles[i])
		end
	end

	return vehiclesInArea
end

function GetVehicles()
	local vehicles = {}

	for vehicle in EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end

	return vehicles
end

function IsSpawnPointClear(coords, radius)
	local vehicles = GetVehiclesInArea(coords, radius)

	return #vehicles == 0
end
function GetAvaliableSpawnCoords(coords)
    for _,v in pairs(coords) do
        if IsSpawnPointClear(vector3(v.x, v.y, v.z), 3.0) then
            return v
        end
    end
end

function SpawnVehicle(model, price, time, depositt, type)
    local currentShop = CurrentShop()
    if currentShop then
        if currentVeh then
            Config.Notify(locales.notify_1)
            return
        end
        local model = GetHashKey(model)
        RequestModel(model) 
        while not HasModelLoaded(model) do
            Wait(0)
        end
        local coords = GetAvaliableSpawnCoords(currentShop.spawncoords)
        if coords then
            local success = TriggerCallback("xRent:PayRent", price+depositt, type)
            if success then
                vehicle = CreateVehicle(model, coords, true, true)
                SetVehicleEngineOn(vehicle, true, true)
                SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                SetVehRadioStation(vehicle, "OFF")
                SetEntityAsMissionEntity(vehicle, true, true)
                SetVehicleFuel(vehicle)
                SetVehicleDirtLevel(vehicle,0,0)
                SetVehicleUndriveable(vehicle, false)
                WashDecalsFromVehicle(vehicle, 1.0)
                SetVehicleFixed(vehicle)
                SetVehicleDeformationFixed(vehicle)
                TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                GiveVehicleKeys(plate, vehicle)
                currentVeh = vehicle
                currentTime = time * 60
                SendNUIMessage({
                    action = 'setRemainTime',
                    payload = currentTime
                })
                Timer()
                SendNUIMessage({
                    action = 'setCurrentTime',
                    payload = {
                        time = time,
                     
                    }
                })
                SendNUIMessage({
                    action = 'close'
                })
                TriggerServerEvent("xRent:SaveVehicle", NetworkGetNetworkIdFromEntity(vehicle))
                deposit = depositt
                ReturnVeh()
            else
                Config.Notify(locales.notify_2)            
            end 
        else
            Config.Notify(locales.notify_3)
        end
        SetModelAsNoLongerNeeded(model)

    end
end

RegisterNetEvent("xRent:DeleteVehicle")
AddEventHandler("xRent:DeleteVehicle", function(vehicle)
    local car = NetworkGetEntityFromNetworkId(vehicle)
    SetVehicleLights(car, 0)
    FreezeEntityPosition(car, true)
    SetVehicleBurnout(car, true)
    Wait(30000)
    DeleteEntity(car)
    currentVeh = false
    currentTime = false
    SendNUIMessage({
        action = 'destroyProgressbar',                 
    })
end)

function Counter()
    for i = 10,1,-1 do     
        if currentTime == i then
            Config.Notify(string.format(locales.notify_4, currentTime))  
        end
    end
end

function ReturnVeh()
    CreateThread(function()
        while currentVeh do
            local wait = 1000
            local shop = CurrentShop()
            local playerCoords = GetEntityCoords(PlayerPedId())
            local currentShop = shop.returnVehArea
            if currentShop then

                local dist = #( playerCoords - currentShop.coords) 
                if dist < currentShop.marker.size then
                    DrawMarker(currentShop.marker.type, currentShop.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, currentShop.marker.size, currentShop.marker.size, 2.0, currentShop.marker.color[1], currentShop.marker.color[2], currentShop.marker.color[3], 255, false, false, false,
                    true, false, false, false)
                    DrawText3D(currentShop.coords.x, currentShop.coords.y, currentShop.coords.z, locales.return_veh)
                    if IsControlJustPressed(0, 38) then
                        DeleteEntity(currentVeh)
                        currentVeh = false
                        currentTime = false
                        SendNUIMessage({
                            action = 'destroyProgressbar',                 
                        })
                        deposit = false
                        TriggerServerEvent("xRent:DepositMoney", deposit)
                    end
                    wait = 0
                end
            end
            Wait(wait)
        end
    end)
end

function Timer()
    CreateThread(function()
        while currentTime do
            if currentVeh then
                if tonumber(currentTime) then
                    currentTime = currentTime - 1
                    
                    SendNUIMessage({
                        action = 'setRemainTime',
                        payload = currentTime
                    })
                    Counter()
                    if currentTime == 0 then
                        currentTime = false
                        Config.Notify(locales.notify_5)
                        TriggerEvent("xRent:DeleteVehicle", NetworkGetNetworkIdFromEntity(currentVeh))
                        
                    end
            
                end
               
                if not DoesEntityExist(currentVeh) or IsEntityInWater(currentVeh) or not IsVehicleDriveable(currentVeh, true)  then
                    currentVeh = false
                    currentTime = false
                    Config.Notify(locales.notify_6)
                    SendNUIMessage({
                        action = 'destroyProgressbar',                 
                    })
                    if DoesEntityExist(currentVeh) then
                        DeleteEntity(currentVeh)                        
                    end
                end
            end
            Wait(1000)
        end
    end)
end

