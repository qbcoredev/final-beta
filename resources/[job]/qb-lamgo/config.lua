Config = {}

Config = {
    ChanceToGetItem = 100, -- if math.random(0, 100) <= ChanceToGetItem then give item
    Items = {'wood_cut'},
    Process = vector3(-584.66, 5285.63, 70.26),
    Sell = vector3(1086.08, -1974.46, 31.02),
    Prices = 35,
    Objects = {
        ['pickaxe'] = 'w_me_hatchet',
    },
    WoodPosition = {
        {coords = vector3(-493.0, 5395.37, 77.18-0.97), heading = 282.49},
        {coords = vector3(-503.69, 5392.12, 75.98-0.97), heading = 113.62},
        {coords = vector3(-456.85, 5397.37, 79.49-0.97), heading = 29.92},
        {coords = vector3(-457.42, 5409.05, 78.78-0.97), heading = 209.65}
    },
    
   
}

Config.textDel = 'Bấm (~g~[E]~w~) Cắt gỗ. nhấn (~g~[Backspace]~w~) để dừng. '

Strings = {
   
    ['someone_close'] = 'Có một người chơi quá gần bạn!',
    ['wood'] = 'Khu Rừng',
    ['process'] = 'Cắt Gỗ',
    ['sell_wood'] = 'Bán Ván Gỗ',
    ['e_sell'] = 'Bấm [E] Để Bán Gỗ',
}