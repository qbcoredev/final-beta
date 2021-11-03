Config = {}

Config.Jobs = {
    ["electrician"] = "Electrician",
}

Config.Locations = {
    jobs = {
        ["electrician"] = {
            [1] = {
                coords = vector4(1761.53, 2540.38, 45.56, 356.43),
            },
        },
    },
    ["freedom"] = {
        coords = vector4(1780.26, 2502.55, 45.85, 283.32),
    },
    ["outside"] = {
        coords = vector4(1848.13, 2586.05, 45.67, 269.5),
    },
    ["yard"] = {
        coords = vector4(1768.85, 2495.22, 45.85, 125.32),
    },
    ["middle"] = {
        coords = vector4(1693.33, 2569.51, 45.55, 123.5),
    },
    ["shop"] = {
        coords = vector4(1782.86, 2499.0, 45.85, 301.32),
    },
    spawns = {
        [1] = {
            animation = "lean",
            coords = vector4(1739.1, 2478.41, 45.85, 287.68),
        },
    }
}

Config.CanteenItems = {
    [1] = {
        name = "sandwich",
        price = 200,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "water_bottle",
        price = 200,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
}
