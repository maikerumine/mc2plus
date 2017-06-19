

minetest.register_craft({
	output = "xdecor:enchantment_table",
	recipe = {
		{"mesecons_torch:redstoneblock","mcl_books:book","mesecons_torch:redstoneblock"},
		{"mcl_core:emeraldblock","mcl_heads:steve","mcl_core:emeraldblock"},
		{"mcl_core:obsidian","mcl_core:diamondblock","mcl_core:obsidian"},
	}
})


--[[
minetest.register_craft({
	output = "xdecor:hammer",
	recipe = {
		{"default:steel_ingot", "group:stick", "default:steel_ingot"},
		{"", "group:stick", ""}
	}
})

minetest.register_craft({
	output = "xdecor:workbench",
	recipe = {
		{"default:junglewood", "default:acacia_wood", "default:aspen_wood"},
		{"default:emerald_crystal", "default:lava_source", "default:axe_gold"},
		{"default:diamondblock", "default:bookshelf", "default:diamondblock"}
	}
})
]]

