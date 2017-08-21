mc_biomes = {}

minetest.register_node("mc_biomes:nether_air", {
	description = "Void (you hacker you!)",
	inventory_image = "mcl_core_void.png",
	wield_image = "mcl_core_void.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	air_equivalent = true,
	floodable = true,
	drop = "",
	groups = {not_in_creative_inventory=1, air=1},
	light_source = 7 --test only
})

minetest.register_node("mc_biomes:void", {
	description = "Void (you hacker you!)",
	inventory_image = "mcl_core_void.png",
	wield_image = "mcl_core_void.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	air_equivalent = true,
	floodable = false,
	drop = "",
	groups = {not_in_creative_inventory=1, air=1},
	light_source = 14 --test only
})

minetest.register_node("mc_biomes:dummy", {
	description = "Air (you hacker you!)",
	inventory_image = "unknown_node.png",
	wield_image = "unknown_node.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	air_equivalent = true,
	floodable = true,
	drop = "",
	groups = {not_in_creative_inventory=1, air=1},
})
