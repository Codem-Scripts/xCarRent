Config = {}
Config.Framework = 'autodetect' -- esx, oldesx, qb, oldqb or autodetect
Config.InteractionHandler = 'drawtext' -- drawtext, ox_target, qb_target, qb_textui, esx_textui, codem_textui 

Config.Rent = {
    {
        coords = vector3(214.73, -806.43, 30.79),
        returnVehArea = {
            marker = {
                color = {255, 0, 0},
                type = 1,
                size = 4.0
            },
            coords = vector3(213.85, -794.51, 30.0)
        },
        spawncoords = {
            vector4(217.60, -802.14, 29.79, 68.0),
            vector4(218.18, -799.63, 29.7, 68.0),
            vector4(207.12, -795.65, 29.6, 249.4),
            vector4(206.95, -798.5, 29.6, 255.1),
        }
    },
}
Config.Blip = {
    name = 'Car Rental',
    show = true, -- if you want to disable the blip, set this to false
    sprite = 89, 
    color  = 42,
    scale = 0.8,
}

Config.InsurancePrice = 1000

Config.Categories = {
    {
        name= 'sedan',
        label= 'SEDAN',
        icon= 'sedan.svg',
    },
    {
        name= 'muscle',
        label= 'MUSCLE',
        icon= 'muscle.svg',
    },
    {
        name= 'suv',
        label= 'SUV',
        icon= 'suv.svg',
    },
    {
        name= 'sport',
        label= 'SPORT',
        icon= 'sport.svg',
    },
    {
        name= 'classic',
        label= 'CLASSIC',
        icon= 'classic.svg',
    },
   
}
Config.Vehicles = {
    ["sedan"] =  {
        {
            name= 'revolter',
            label= 'Revolter',
            image= 'Revolter.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'asea',
            label= 'Asea',
            image= 'Asea.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'fugitive',
            label= 'Fugitive',
            image= 'Fugitive.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'intruder',
            label= 'Intruder',
            image= 'Intruder.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
    },
    ["muscle"]= {
        {
            name= 'chino',
            label= 'Chino',
            image= 'Chino.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'gauntlet',
            label= 'Gauntlet',
            image= 'Gauntlet.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'imperator',
            label= 'Imperator',
            image= 'Imperator.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
    },
    ["suv"]= {
        {
            name= 'baller2',
            label= 'Baller2',
            image= 'Baller2.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'seminole',
            label= 'Seminole',
            image= 'Seminole.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'gresley',
            label= 'Gresley',
            image= 'Gresley.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
    },
    ["sport"]= {
        {
            name= 'banshee',
            label= 'Banshee',
            image= 'Banshee.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'futo',
            label= 'Futo',
            image= 'Futo.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'coquette',
            label= 'Coquette',
            image= 'Coquette.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },

    },
    ["classic"]= {
        {
            name= 'dynasty',
            label= 'Dynasty',
            image= 'Dynasty.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'gt500',
            label= 'GT500',
            image= 'Gt500.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'nebula',
            label= 'Nebula',
            image= 'Nebula.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
    },
    ["motorcycle"]= {
        {
            name= 'esskey',
            label= 'Esskey',
            image= 'Esskey.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'double',
            label= 'Double',
            image= 'Double.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
        {
            name= 'avarus',
            label= 'Avarus',
            image= 'Avarus.png',
            speed= 5,
            handling= 3,
            acceleration= 4,
            deposit = 30,
            price= {
                ["10"]= {
                    label= '10m',
                    cash= 10,
                    bank= 20,
                    selected = true,
                },
                ["20"]= {
                    label= '20m',
                    cash= 30,
                    bank= 50,
                    selected = false,
                },
                ["30"]= {
                    label= '30m',
                    cash= 40,
                    bank= 60,
                    selected = false,
                },
                ["60"]= {
                    label= '60m',
                    cash= 70,
                    bank= 90,
                    selected = false,
                },
            }
        },
    },
}

Config.Notify = function(message)
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        TriggerEvent("esx:showNotification", message)
    else
        TriggerEvent('QBCore:Notify', message, "info", 1500)
    end
end
Config.Vehiclekey = false -- Do NOT Touch if you have any car lock system
Config.VehicleKeySystem = "qs-vehiclekeys" -- cd_garage / qs-vehiclekeys / wasabi-carlock / qb-vehiclekeys
Config.VehicleRemovekey = true -- Do NOT Touch if you have any car lock system
function GiveVehicleKeys(plate, vehicle) 
    if Config.Vehiclekey then
        if Config.VehicleKeySystem == 'cd_garage' then
            TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
        elseif Config.VehicleKeySystem == 'qs-vehiclekeys' then
            local vehicleName = GetDisplayNameFromVehicleModel(model)
            exports['qs-vehiclekeys']:GiveKeys(plate, vehicleName)
        elseif Config.VehicleKeySystem == 'wasabi-carlock' then
            exports.wasabi_carlock:GiveKey(plate)
        elseif Config.VehicleKeySystem == 'qb-vehiclekeys' then
            TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        end
    end
end

Config.EnableFuel = false -- Do NOT Touch if you have any fuel system
Config.FuelSystem = 'LegacyFuel' -- codem-fuel / LegacyFuel / ox-fuel / nd-fuel / frfuel / cdn-fuel / hyon_gas_stationConfig.DefaultSellPrice = 10000 -- default price for vehicles that are not in the database

function SetVehicleFuel(vehicle)
    if Config.EnableFuel then
        if Config.FuelSystem == 'LegacyFuel' then
            return exports["LegacyFuel"]:SetFuel(vehicle, 100.0)
        elseif Config.FuelSystem == 'ox-fuel' then
            return GetVehicleFuelLevel(vehicle, 100.0)
        elseif Config.FuelSystem == 'nd-fuel' then
            return exports["nd-fuel"]:SetFuel(vehicle, 100.0)
        elseif Config.FuelSystem == 'frfuel' then
            return exports.frfuel:setFuel(vehicle, 100.0)
        elseif Config.FuelSystem == 'cdn-fuel' then
            return exports['cdn-fuel']:SetFuel(vehicle, 100.0)
        elseif Config.FuelSystem == 'codem-fuel' then
            exports['x-fuel']:SetFuel(vehicle, 100.0)
        elseif Config.FuelSystem == 'hyon_gas_station' then
            return exports["hyon_gas_station"]:SetFuel(vehicle, 100.0)
        end
    else
        return SetVehicleFuelLevel(vehicle, 100 + 0.0)
    end
end