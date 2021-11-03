Config = {}

Config.AttachedVehicle = nil

Config.AuthorizedIds = {
    "insertcitizenidhere",
}

Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
}

Config.ValuesLabels = {
    ["engine"] = "Động Cơ",
    ["body"] = "Thân Xe",
    ["radiator"] = "Điều Hòa",
    ["axle"] = "Trục Xe",
    ["brakes"] = "Phanh",
    ["clutch"] = "Bánh Xe",
    ["fuel"] = "Nguyên Liệu",
}

Config.RepairCost = {
    ["body"] = "plastic",
    ["radiator"] = "plastic",
    ["axle"] = "steel",
    ["brakes"] = "iron",
    ["clutch"] = "aluminum",
    ["fuel"] = "plastic",
}

Config.RepairCostAmount = {
    ["engine"] = {
        item = "metalscrap",
        costs = 2,
    },
    ["body"] = {
        item = "plastic",
        costs = 3,
    },
    ["radiator"] = {
        item = "steel",
        costs = 5,
    },
    ["axle"] = {
        item = "aluminum",
        costs = 7,
    },
    ["brakes"] = {
        item = "copper",
        costs = 5,
    },
    ["clutch"] = {
        item = "copper",
        costs = 6,
    },
    ["fuel"] = {
        item = "plastic",
        costs = 5,
    },
}

Config.Businesses = {
    "Auto Repair",
}

Config.Plates = {
    [1] = {
        coords = vector4(-327.01, -144.23, 38.59, 251.2),
        AttachedVehicle = nil,
    },
    [2] = {
        coords = vector4(-325.0, -139.07, 38.59, 250.86),
        AttachedVehicle = nil,
    },
    [3] = {
        coords = vector4(-323.56, -133.99, 38.59, 251.97),
        AttachedVehicle = nil,
    },
}

Config.Locations = {
    ["exit"] = vector3(-339.04, -135.53, 39),
    ["stash"] = vector3(-348.85, -169.83, 39.01),
    ["duty"] = vector3(-339.51, -155.54, 44.59),
    ["vehicle"] = vector4(-364.0, -93.76, 39.1, 171.95), 
}

Config.Vehicles = {
    ["flatbed"] = "Xe Nâng",
    ["towtruck"] = "Xe Kéo",
    ["lrescue"] = "Mechanic Car",
}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 8000,
        max = 12000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}

Config.Damages = {
    ["radiator"] = "Radiator",
    ["axle"] = "Drive Shaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Tank",
}
