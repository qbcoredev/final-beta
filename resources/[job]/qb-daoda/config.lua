Config = {
    price = {
        -- ['item'] = {min, max} --
        steel = math.random(20, 25),
--[[         iron = math.random(19, 19),
        copper = math.random(18, 18), ]]
    },
    ChanceToGetItem = 20, -- if math.random(0, 100) <= ChanceToGetItem then give item
    Items = {'steel'}, --{'steel','steel','iron', 'iron', 'copper', 'plastic'},
    Sell = vector3(-97.12, -1013.8, 26.3),
    Objects = {
        ['pickaxe'] = 'prop_tool_pickaxe',
    },
    MiningPositions = {
        {coords = vector3(2992.77, 2750.64, 42.78), heading = 209.29},
        {coords = vector3(2983.03, 2750.9, 42.02), heading = 214.08},
        {coords = vector3(2976.74, 2740.94, 43.63), heading = 246.21},
        {coords = vector3(2934.265, 2742.695, 43.1), heading = 96.1},
        {coords = vector3(2907.25, 2788.27, 45.4), heading = 109.39}
    },
}

Strings = {
    ['press_mine'] = 'Bấm [E] Để Đào Quặng.',
    ['mining_info'] = 'Bấm [Chuột Trái] Để Đào , Bấm[BACKSPACE] Để Dừng ',
    ['you_sold'] = 'bạn đã bán %sx %s với %s',
    ['e_sell'] = 'Bấm [E] Để Bán Quặng',
    ['someone_close'] = 'Có một người chơi quá gần bạn!',
    ['mining'] = 'Đào Quặng',
    ['sell_mine'] = 'Bán Quặng'
}