Config = {

	BlipSprite = 237,
	BlipColor = 26,
	BlipText = 'Bàn Chế Tạo',
	
	CraftingStopWithDistance = false, -- Chế tạo sẽ dừng lại khi không gần bàn làm việc
	
	ExperiancePerCraft = 5, -- Số lượng kinh nghiệm được thêm vào mỗi Craft (100 experiance là 1 cấp)
	
	HideWhenCantCraft = true, -- ko sửa
	
	Categories = {
	
		['item'] = {
			Label = 'Chế Tạo ITEM',
			Image = 'advancedlockpick',
			Jobs = {}
		},
		['weapons'] = {
			Label = 'Chế Tạo Vũ Khí',
			Image = 'WEAPON_PISTOL_MK2',
			Jobs = {}
		},
	},
	
	PermanentItems = {}, -- ko động
	
	Recipes = {
	
		--[[ ['weapon_pistol'] = {
			Level = 0, 
			Category = 'weapons', 
			isGun = false, 
			Jobs = {}, 
			JobGrades = {},
			Amount = 1, 
			SuccessRate = 100, 
			requireBlueprint = false, 
			Time = 10, 
			Ingredients = { 
				['iron'] = 10,
				['steel'] = 11,
			}
		}, 
		['lockpick'] = {
			Level = 0, 
			Category = 'item', 
			isGun = false, 
			Jobs = {}, 
			JobGrades = {},
			Amount = 1, 
			SuccessRate = 100, 
			requireBlueprint = false, 
			Time = 10, 
			Ingredients = { 
				['plastic'] = 10,
				['steel'] = 11,
			}
		}, 
		['bandage'] = {
			Level = 0, 
			Category = 'item', 
			isGun = false, 
			Jobs = {}, 
			JobGrades = {},
			Amount = 1, 
			SuccessRate = 100, 
			requireBlueprint = false, 
			Time = 10, 
			Ingredients = { 
				['plastic'] = 10,
				['steel'] = 11,
			}
		},  ]]
	},
	
	Workbenches = { 
		{
			coords = vector3(-34.71474,-1037.145,28.595392), 
			jobs = {}, 
			blip = false, 
			recipes = {
				'weapon_pistol',
				'lockpick',
				'bandage',
			}, 
			radius = 2.0 }
	},
}