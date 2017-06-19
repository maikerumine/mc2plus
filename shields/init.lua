local use_moreores = minetest.get_modpath("moreores")

-- Regisiter Shields

minetest.register_tool("shields:shield_wood", {
	description = "Wooden Shield",
	inventory_image = "shields_inv_shield_wood.png",
	groups = {armor_shield=5, armor_heal=0, armor_use=2000},
	wear = 0,
})

minetest.register_tool("shields:shield_steel", {
	description = "Steel Shield",
	inventory_image = "shields_inv_shield_steel.png",
	groups = {armor_shield=10, armor_heal=0, armor_use=500},
	wear = 0,
})
--[[
minetest.register_tool("shields:shield_bronze", {
	description = "Bronze Shield",
	inventory_image = "shields_inv_shield_bronze.png",
	groups = {armor_shield=10, armor_heal=6, armor_use=250},
	wear = 0,
})
]]
minetest.register_tool("shields:shield_diamond", {
	description = "Diamond Shield",
	inventory_image = "shields_inv_shield_diamond.png",
	groups = {armor_shield=15, armor_heal=12, armor_use=100},
	wear = 0,
})

minetest.register_tool("shields:shield_gold", {
	description = "Gold Shield",
	inventory_image = "shields_inv_shield_gold.png",
	groups = {armor_shield=10, armor_heal=6, armor_use=250},
	wear = 0,
})

if use_moreores then
	minetest.register_tool("shields:shield_mithril", {
		description = "Mithril Shield",
		inventory_image = "shields_inv_shield_mithril.png",
		groups = {armor_shield=15, armor_heal=12, armor_use=50},
		wear = 0,
	})
end

local craft_ingreds = {
	wood = "mcl_core:wood",
	steel = "mcl_core:steel_ingot",
	--bronze = "mcl_core:bronze_ingot",
	diamond = "mcl_core:diamond",
	gold = "mcl_core:gold_ingot",
}


minetest.register_tool("shields:shield_veteran", {
	description = "Veteran Shield",
	inventory_image = "shields_inv_shield_veteran.png",
	groups = {armor_shield=15, armor_heal=12, armor_use=100},
	wear = 0,
})

minetest.register_tool("shields:shield_rusher", {
	description = "Rusher Shield",
	inventory_image = "shields_inv_shield_rusher.png",
	groups = {armor_shield=15, armor_heal=12, armor_use=100},
	wear = 0,
})

minetest.register_tool("shields:shield_nomad", {
	description = "Nomad Shield",
	inventory_image = "shields_inv_shield_nomad.png",
	groups = {armor_shield=15, armor_heal=12, armor_use=100},
	wear = 0,
})


if use_moreores then
	craft_ingreds.mithril = "moreores:mithril_ingot"
end

for k, v in pairs(craft_ingreds) do
	minetest.register_craft({
		output = "shields:shield_"..k,
		recipe = {
			{v, v, v},
			{v, v, v},
			{"", v, ""},
		},
	})
end

minetest.register_craft({
	output = 'shields:shield_nomad',
	recipe = {
		{'mcl_core:steel_ingot', 'mcl_dye:blue', 'mcl_core:steel_ingot'},
		{'mcl_core:steel_ingot', 'shields:shield_diamond', 'mcl_core:steel_ingot'},
		{'mcl_core:steel_ingot', 'mcl_flowers:oxeye_daisy', 'mcl_core:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'shields:shield_rusher',
	recipe = {
		{'mcl_core:steel_ingot', 'mcl_dye:white', 'mcl_core:steel_ingot'},
		{'mcl_core:steel_ingot', 'shields:shield_diamond', 'mcl_core:steel_ingot'},
		{'mcl_core:steel_ingot', 'mcl_flowers:oxeye_daisy', 'mcl_core:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'shields:shield_veteran',
	recipe = {
		{'mcl_core:steel_ingot', 'mcl_dye:black', 'mcl_core:steel_ingot'},
		{'mcl_core:steel_ingot', 'shields:shield_diamond', 'mcl_core:steel_ingot'},
		{'mcl_core:steel_ingot', 'mcl_flowers:oxeye_daisy', 'mcl_core:steel_ingot'},
	}
})



minetest.after(0, function()
	table.insert(armor.elements, "shield")
end)


