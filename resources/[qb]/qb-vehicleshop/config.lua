QB = {}
QBCustom = {}

QB.VehicleShops = {
    [1] = {
        -- Vehicle Shop options
        ["ShopName"] = "pdm", -- Name to get in the shared.lua
        ["ShopLabel"] = "Shop Xe Thường", -- Blip name
        ["Categories"] = {
            ["sports"]  = "Sports",
            ["sportsclassics"] = "Sports Classics",
            ["super"]   = "Super",
            ["sedans"]  = "Sedans",
            ["coupes"]  = "Coupes",
            ["suvs"]    = "SUVs",
            ["offroad"] = "Offroad",
            ["muscle"] = "Muscle",
            ["compacts"] = "Compacts",
            ["motorcycles"] = "Motorcycles",
            ["vans"] = "Vans",
        },
        ["TestDriveTimeLimit"] = 3, -- Time in minutes until the vehicle gets deleted
        ["Location"] = vector3(-56.71, -1096.6, 25.44), -- Blip Location
        ["ReturnLocation"] = vector3(-768.15, -233.1, 37.07), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ["VehicleSpawn"] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location when vehicle is bought
        ["OwnedJob"] = false, -- false or a job inside a string like "cardealer"
        ["ShowroomVehicles"] = {
            [1] = {
                coords = vector4(-45.65, -1093.66, 25.44, 69.5),
                defaultVehicle = 'vectre', -- The vehicle that needs to be there on restart
                chosenVehicle = 'vectre', -- Keep this the same as defaultvehicle
                inUse = false, -- When changing vehicle this gets set to true, don't change
                buying = false, -- When buying a vehicle from an owned job this gets set to true, don't change
            },
            [2] = {
                coords = vector4(-48.27, -1101.86, 25.44, 294.5),
                defaultVehicle = 'dubsta3',
                chosenVehicle = 'dubsta3',
                inUse = false,
                buying = false,
            },
            [3] = {
                coords = vector4(-39.6, -1096.01, 25.44, 66.5),
                defaultVehicle = 'tailgater2',
                chosenVehicle = 'tailgater2',
                inUse = false,
                buying = false,
            },
            [4] = {
                coords = vector4(-51.21, -1096.77, 25.44, 254.5),
                defaultVehicle = 'dominator',
                chosenVehicle = 'dominator',
                inUse = false,
                buying = false,
            },
            [5] = {
                coords = vector4(-40.18, -1104.13, 25.44, 338.5),
                defaultVehicle = 'ztype',
                chosenVehicle = 'ztype',
                inUse = false,
                buying = false,
            },
            [6] = {
                coords = vector4(-43.31, -1099.02, 25.44, 52.5),
                defaultVehicle = 'faggio',
                chosenVehicle = 'faggio',
                inUse = false,
                buying = false,
            },
            [7] = {
                coords = vector4(-50.66, -1093.05, 25.44, 222.5),
                defaultVehicle = 'manchez2',
                chosenVehicle = 'manchez2',
                inUse = false,
                buying = false,
            },
            [8] = {
                coords = vector4(-44.28, -1102.47, 25.44, 298.5),
                defaultVehicle = 'bati2',
                chosenVehicle = 'bati2',
                inUse = false,
                buying = false,
            },
        },
        -- Non-changeable options (Don't touch these)
        ["opened"] = false,
        ["currentmenu"] = "main",
        ["lastmenu"] = nil,
        ["currentpos"] = nil,
        ["selectedbutton"] = 0,
        ["marker"] = { r = 0, g = 155, b = 255, a = 250, type = 1 },
        ["menu"] = {
            ["x"] = 0.14,
            ["y"] = 0.15,
            ["width"] = 0.12,
            ["height"] = 0.03,
            ["buttons"] = 10,
            ["from"] = 1,
            ["to"] = 10,
            ["scale"] = 0.29,
            ["font"] = 0,
            ["main"] = {
                ["title"] = "CATEGORIES",
                ["Name"] = "main",
                ["buttons"] = {
                    {name = "Categories", description = ""},
                }
            },
            ["vehicles"] = {
                ["title"] = "VEHICLES",
                ["name"] = "vehicles",
                ["buttons"] = {}
            },
        },

    },
    [2] = {
        -- Vehicle Shop options
        ["ShopName"] = "luxury", -- Name to get in the shared.lua
        ["ShopLabel"] = "Shop Xe 2", -- Blip name
        ["Categories"] = {
            ["sports"]  = "Sports",
            ["sportsclassics"] = "Sports Classics",
            ["super"]   = "Super",
            ["sedans"]  = "Sedans",
            ["coupes"]  = "Coupes",
            ["suvs"]    = "SUVs",
            ["offroad"] = "Offroad",
            ["muscle"] = "Muscle",
            ["compacts"] = "Compacts",
            ["motorcycles"] = "Motorcycles",
            ["vans"] = "Vans",
        },
        ["TestDriveTimeLimit"] = 3, -- Time in minutes until the vehicle gets deleted
        ["Location"] = vector3(-63.59, 68.25, 73.06), -- Blip Location
        ["ReturnLocation"] = vector3(-768.15, -233.1, 37.07), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ["VehicleSpawn"] = vector4(-67.33, 82.17, 71.13, 64.51), -- Spawn location when vehicle is bought
        ["OwnedJob"] = false, -- false or a job inside a string like "cardealer"
        ["ShowroomVehicles"] = {
            [1] = {
                coords = vector4(-75.96, 74.78, 71.07, 221.69),
                defaultVehicle = 'italirsx', -- The vehicle that needs to be there on restart
                chosenVehicle = 'italirsx', -- Keep this the same as defaultvehicle
                inUse = false, -- When changing vehicle this gets set to true, don't change
                buying = false, -- When buying a vehicle from an owned job this gets set to true, don't change
            }, 
            [2] = {
                coords = vector4(-66.52, 74.33, 70.80, 188.03),
                defaultVehicle = 'nm_corvette',
                chosenVehicle = 'nm_corvette',
                inUse = false,
                buying = false,
            }, 
            [3] = {
                coords = vector4(-71.83, 68.60, 70.92, 276.57),
                defaultVehicle = 'c150',
                chosenVehicle = 'c150',
                inUse = false,
                buying = false,
            }, 
            [4] = {
                coords = vector4(-59.95, 68.61, 71.04, 181.44),
                defaultVehicle = 'hcbr17',
                chosenVehicle = 'hcbr17',
                inUse = false,
                buying = false,
            },
        },
        -- Non-changeable options (Don't touch these)
        ["opened"] = false,
        ["currentmenu"] = "main",
        ["lastmenu"] = nil,
        ["currentpos"] = nil,
        ["selectedbutton"] = 0,
        ["marker"] = { r = 0, g = 155, b = 255, a = 250, type = 1 },
        ["menu"] = {
            ["x"] = 0.14,
            ["y"] = 0.15,
            ["width"] = 0.12,
            ["height"] = 0.03,
            ["buttons"] = 10,
            ["from"] = 1,
            ["to"] = 10,
            ["scale"] = 0.29,
            ["font"] = 0,
            ["main"] = {
                ["title"] = "CATEGORIES",
                ["Name"] = "main",
                ["buttons"] = {
                    {name = "Categories", description = ""},
                }
            },
            ["vehicles"] = {
                ["title"] = "VEHICLES",
                ["name"] = "vehicles",
                ["buttons"] = {}
            },
        },
    }, -- Add your next table under this command
    [3] = {
        -- Vehicle Shop options
        ["ShopName"] = "luxury3", -- Name to get in the shared.lua
        ["ShopLabel"] = "Shop Xe 3", -- Blip name
        ["Categories"] = {
            ["sports"]  = "Sports",
            ["sportsclassics"] = "Sports Classics",
            ["super"]   = "Super",
            ["sedans"]  = "Sedans",
            ["coupes"]  = "Coupes",
            ["suvs"]    = "SUVs",
            ["offroad"] = "Offroad",
            ["muscle"] = "Muscle",
            ["compacts"] = "Compacts",
            ["motorcycles"] = "Motorcycles",
            ["vans"] = "Vans",
        },
        ["TestDriveTimeLimit"] = 3, -- Time in minutes until the vehicle gets deleted
        ["Location"] = vector3(-790.72, -224.31, 37.15), -- Blip Location
        ["ReturnLocation"] = vector3(-775.98, -232.17, 37.15), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ["VehicleSpawn"] = vector4(-775.98, -232.17, 36.72, 215.45), -- Spawn location when vehicle is bought
        ["OwnedJob"] = false, -- false or a job inside a string like "cardealer"
        ["ShowroomVehicles"] = {
            [1] = {
                coords = vector4(-803.88, -214.97, 36.33, 209.31),
                defaultVehicle = 'c63coupe', -- The vehicle that needs to be there on restart
                chosenVehicle = 'c63coupe', -- Keep this the same as defaultvehicle
                inUse = false, -- When changing vehicle this gets set to true, don't change
                buying = false, -- When buying a vehicle from an owned job this gets set to true, don't change
            }, 
            [2] = {
                coords = vector4(-787.06, -244.19, 36.34, 334.89),
                defaultVehicle = 'r8v10abt',
                chosenVehicle = 'r8v10abt',
                inUse = false,
                buying = false,
            }, 
            [3] = {
                coords = vector4(-789.77, -240.16, 36.34, 336.11),
                defaultVehicle = '211le',
                chosenVehicle = '211le',
                inUse = false,
                buying = false,
            }, 
            [4] = {
                coords = vector4(-791.73, -236.39, 36.34, 340.44),
                defaultVehicle = 'q8prior',
                chosenVehicle = 'q8prior',
                inUse = false,
                buying = false,
            },
            [5] = {
                coords = vector4(-795.15, -230.47, 36.33, 337.06),
                defaultVehicle = 's63amg18',
                chosenVehicle = 's63amg18',
                inUse = false,
                buying = false,
            },
        },
        -- Non-changeable options (Don't touch these)
        ["opened"] = false,
        ["currentmenu"] = "main",
        ["lastmenu"] = nil,
        ["currentpos"] = nil,
        ["selectedbutton"] = 0,
        ["marker"] = { r = 0, g = 155, b = 255, a = 250, type = 1 },
        ["menu"] = {
            ["x"] = 0.14,
            ["y"] = 0.15,
            ["width"] = 0.12,
            ["height"] = 0.03,
            ["buttons"] = 10,
            ["from"] = 1,
            ["to"] = 10,
            ["scale"] = 0.29,
            ["font"] = 0,
            ["main"] = {
                ["title"] = "CATEGORIES",
                ["Name"] = "main",
                ["buttons"] = {
                    {name = "Categories", description = ""},
                }
            },
            ["vehicles"] = {
                ["title"] = "VEHICLES",
                ["name"] = "vehicles",
                ["buttons"] = {}
            },
        },
    }, -- Add your next table under this command

}

QB.GarageLabel = {
    ['motelgarage'] = 'Motel Garage',
    ['sapcounsel']  = 'San Andreas Parking Counsel',
}

QB.Classes = {
    [0] = 'compacts',  
    [1] = 'sedans',  
    [2] = 'suvs',  
    [3] = 'coupes',  
    [4] = 'muscle',  
    [5] = 'sportsclassics ', 
    [6] = 'sports',  
    [7] = 'super',  
    [8] = 'motorcycles',  
    [9] = 'offroad', 
    [10] = 'industrial',  
    [11] = 'utility',  
    [12] = 'vans',  
    [13] = 'cycles',  
    [14] = 'boats',  
    [15] = 'helicopters',  
    [16] = 'planes',  
    [17] = 'service',  
    [18] = 'emergency',  
    [19] = 'military',  
    [20] = 'commercial',  
    [21] = 'trains',  
}
