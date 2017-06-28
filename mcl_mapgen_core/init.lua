--
-- Aliases for map generator outputs
--

minetest.register_alias("mapgen_air", "air")
minetest.register_alias("mapgen_stone", "mcl_core:stone")
minetest.register_alias("mapgen_tree", "mcl_core:tree")
minetest.register_alias("mapgen_leaves", "mcl_core:leaves")
minetest.register_alias("mapgen_jungletree", "mcl_core:jungletree")
minetest.register_alias("mapgen_jungleleaves", "mcl_core:jungleleaves")
minetest.register_alias("mapgen_pine_tree", "mcl_core:sprucetree")
minetest.register_alias("mapgen_pine_needles", "mcl_core:spruceleaves")

minetest.register_alias("mapgen_apple", "mcl_core:leaves")
minetest.register_alias("mapgen_water_source", "mcl_core:water_source")
minetest.register_alias("mapgen_dirt", "mcl_core:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "mcl_core:dirt_with_grass")
minetest.register_alias("mapgen_dirt_with_snow", "mcl_core:dirt_with_grass_snow")
minetest.register_alias("mapgen_sand", "mcl_core:sand")
minetest.register_alias("mapgen_gravel", "mcl_core:gravel")
minetest.register_alias("mapgen_clay", "mcl_core:clay")
minetest.register_alias("mapgen_lava_source", "air") -- Built-in lava generator is too unpredictable, we generate lava on our own
minetest.register_alias("mapgen_cobble", "mcl_core:cobble")
minetest.register_alias("mapgen_mossycobble", "mcl_core:mossycobble")
minetest.register_alias("mapgen_junglegrass", "mcl_flowers:fern")
minetest.register_alias("mapgen_stone_with_coal", "mcl_core:stone_with_coal")
minetest.register_alias("mapgen_stone_with_iron", "mcl_core:stone_with_iron")
minetest.register_alias("mapgen_desert_sand", "mcl_core:sand")
minetest.register_alias("mapgen_desert_stone", "mcl_core:sandstone")
minetest.register_alias("mapgen_sandstone", "mcl_core:sandstone")
minetest.register_alias("mapgen_river_water_source", "mcl_core:water_source")
minetest.register_alias("mapgen_snow", "mcl_core:snow")
minetest.register_alias("mapgen_snowblock", "mcl_core:snowblock")
minetest.register_alias("mapgen_ice", "mcl_core:ice")

minetest.register_alias("mapgen_stair_cobble", "mcl_stairs:stair_cobble")
minetest.register_alias("mapgen_sandstonebrick", "mcl_core:sandstonesmooth")
minetest.register_alias("mapgen_stair_sandstonebrick", "mcl_stairs:stair_sandstone")
minetest.register_alias("mapgen_stair_sandstone_block", "mcl_stairs:stair_sandstone")
minetest.register_alias("mapgen_stair_desert_stone", "mcl_stairs:stair_sandstone")

local mg_name = minetest.get_mapgen_setting("mg_name")

--
-- Ore generation
--

-- Diorite, andesite and granite
local specialstones = { "mcl_core:diorite", "mcl_core:andesite", "mcl_core:granite" }
for s=1, #specialstones do
	local node = specialstones[s]
	minetest.register_ore({
		ore_type       = "blob",
		ore            = node,
		wherein        = {"mcl_core:stone"},
		clust_scarcity = 15*15*15,
		clust_num_ores = 33,
		clust_size     = 5,
		y_min          = mcl_vars.mg_overworld_min,
		y_max          = mcl_vars.mg_overworld_max,
	})
	minetest.register_ore({
		ore_type       = "blob",
		ore            = node,
		wherein        = {"mcl_core:stone"},
		clust_scarcity = 10*10*10,
		clust_num_ores = 58,
		clust_size     = 7,
		y_min          = mcl_vars.mg_overworld_min,
		y_max          = mcl_vars.mg_overworld_max,
	})
end

local stonelike = {"mcl_core:stone", "mcl_core:diorite", "mcl_core:andesite", "mcl_core:granite"}

-- Dirt
minetest.register_ore({
	ore_type       = "blob",
	ore            = "mcl_core:dirt",
	wherein        = stonelike,
	clust_scarcity = 15*15*15,
	clust_num_ores = 33,
	clust_size     = 4,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_vars.mg_overworld_max,
})

-- Gravel
minetest.register_ore({
	ore_type       = "blob",
	ore            = "mcl_core:gravel",
	wherein        = stonelike,
	clust_scarcity = 14*14*14,
	clust_num_ores = 33,
	clust_size     = 5,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(111),
})

--
-- Coal
--

-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_coal",
	wherein        = stonelike,
	clust_scarcity = 525*3,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(50),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_coal",
	wherein        = stonelike,
	clust_scarcity = 510*3,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(50),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_coal",
	wherein        = stonelike,
	clust_scarcity = 500*3,
	clust_num_ores = 12,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(50),
})

-- Medium-rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_coal",
	wherein        = stonelike,
	clust_scarcity = 550*3,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min          = mcl_util.layer_to_y(51),
	y_max          = mcl_util.layer_to_y(80),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_coal",
	wherein        = stonelike,
	clust_scarcity = 525*3,
	clust_num_ores = 6,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(51),
	y_max          = mcl_util.layer_to_y(80),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_coal",
	wherein        = stonelike,
	clust_scarcity = 500*3,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(51),
	y_max          = mcl_util.layer_to_y(80),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_coal",
	wherein         = stonelike,
	clust_scarcity = 600*3,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = mcl_util.layer_to_y(81),
	y_max          = mcl_util.layer_to_y(128),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_coal",
	wherein         = stonelike,
	clust_scarcity = 550*3,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(81),
	y_max          = mcl_util.layer_to_y(128),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_coal",
	wherein         = stonelike,
	clust_scarcity = 500*3,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(81),
	y_max          = mcl_util.layer_to_y(128),
})

--
-- Iron
--
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_iron",
	wherein         = stonelike,
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_iron",
	wherein         = stonelike,
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min          = mcl_util.layer_to_y(40),
	y_max          = mcl_util.layer_to_y(63),
})

--
-- Gold
--

-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_gold",
	wherein         = stonelike,
	clust_scarcity = 4775,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(30),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_gold",
	wherein         = stonelike,
	clust_scarcity = 6560,
	clust_num_ores = 7,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(30),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_gold",
	wherein         = stonelike,
	clust_scarcity = 13000,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min          = mcl_util.layer_to_y(31),
	y_max          = mcl_util.layer_to_y(33),
})




--
-- Diamond
--

-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_diamond",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(12),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_diamond",
	wherein         = stonelike,
	clust_scarcity = 5000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(12),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_diamond",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(12),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_diamond",
	wherein         = stonelike,
	clust_scarcity = 20000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_util.layer_to_y(13),
	y_max          = mcl_util.layer_to_y(15),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_diamond",
	wherein         = stonelike,
	clust_scarcity = 20000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_util.layer_to_y(13),
	y_max          = mcl_util.layer_to_y(15),
})

--
-- Redstone
--

-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_redstone",
	wherein         = stonelike,
	clust_scarcity = 500,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(13),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_redstone",
	wherein         = stonelike,
	clust_scarcity = 800,
	clust_num_ores = 7,
	clust_size     = 4,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(13),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_redstone",
	wherein         = stonelike,
	clust_scarcity = 1000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(13),
	y_max          = mcl_util.layer_to_y(15),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_redstone",
	wherein         = stonelike,
	clust_scarcity = 1600,
	clust_num_ores = 7,
	clust_size     = 4,
	y_min          = mcl_util.layer_to_y(13),
	y_max          = mcl_util.layer_to_y(15),
})

--
-- Emerald
--

-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_emerald",
	wherein         = stonelike,
	clust_scarcity = 14340,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_util.layer_to_y(29),
})
-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_emerald",
	wherein         = stonelike,
	clust_scarcity = 21510,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_util.layer_to_y(30),
	y_max          = mcl_util.layer_to_y(32),
})

--
-- Lapis Lazuli
--

-- Common spawn (in the center)
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 7,
	clust_size     = 4,
	y_min          = mcl_util.layer_to_y(14),
	y_max          = mcl_util.layer_to_y(16),
})

-- Rare spawn (below center)
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 12000,
	clust_num_ores = 6,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(10),
	y_max          = mcl_util.layer_to_y(13),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 14000,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(6),
	y_max          = mcl_util.layer_to_y(9),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 16000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(2),
	y_max          = mcl_util.layer_to_y(5),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 18000,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = mcl_util.layer_to_y(0),
	y_max          = mcl_util.layer_to_y(2),
})

-- Rare spawn (above center)
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 12000,
	clust_num_ores = 6,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(17),
	y_max          = mcl_util.layer_to_y(20),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 14000,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(21),
	y_max          = mcl_util.layer_to_y(24),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 16000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_util.layer_to_y(25),
	y_max          = mcl_util.layer_to_y(28),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 18000,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = mcl_util.layer_to_y(29),
	y_max          = mcl_util.layer_to_y(32),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 32000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_util.layer_to_y(31),
	y_max          = mcl_util.layer_to_y(32),
})

if mg_name ~= "flat" then

-- Water and lava springs (single blocks of lava/water source)
-- Water appears at nearly every height, but not near the bottom
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:water_source",
	wherein         = {"mcl_core:stone", "mcl_core:andesite", "mcl_core:diorite", "mcl_core:granite", "mcl_core:dirt"},
	clust_scarcity = 9000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_util.layer_to_y(5),
	y_max          = mcl_util.layer_to_y(128),
})

-- Lava springs are rather common at -31 and below
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:lava_source",
	wherein         = stonelike,
	clust_scarcity = 2000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_util.layer_to_y(1),
	y_max          = mcl_util.layer_to_y(10),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:lava_source",
	wherein         = stonelike,
	clust_scarcity = 9000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_util.layer_to_y(11),
	y_max          = mcl_util.layer_to_y(31),
})

-- Lava springs will become gradually rarer with increasing height
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:lava_source",
	wherein         = stonelike,
	clust_scarcity = 32000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_util.layer_to_y(32),
	y_max          = mcl_util.layer_to_y(47),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:lava_source",
	wherein         = stonelike,
	clust_scarcity = 72000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_util.layer_to_y(48),
	y_max          = mcl_util.layer_to_y(61),
})

-- Lava may even appear above surface, but this is very rare
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:lava_source",
	wherein         = stonelike,
	clust_scarcity = 96000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_util.layer_to_y(62),
	y_max          = mcl_util.layer_to_y(127),
})

end

local function register_mgv6_decorations()

	-- Sugar canes

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 100, y = 100, z = 100},
			seed = 2,
			octaves = 3,
			persist = 0.7
		},
		y_min = 1,
		y_max = 1,
		decoration = "mcl_core:reeds",
		height = 2,
		height_max = 4,
		spawn_by = "mcl_core:water_source",
		num_spawn_by = 1,
	})

	-- Cacti

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"group:sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.012,
			scale = 0.024,
			spread = {x = 100, y = 100, z = 100},
			seed = 257,
			octaves = 3,
			persist = 0.6
		},
		y_min = 4,
		y_max = 30,
		decoration = "mcl_core:cactus",
		height = 1,
	        height_max = 3,
	})

	-- Doubletall grass
	minetest.register_decoration({
		deco_type = "schematic",
		schematic = {
			size = { x=1, y=3, z=1 },
			data = {
				{ name = "air", prob = 0 },
				{ name = "mcl_flowers:double_grass", param1=255, },
				{ name = "mcl_flowers:double_grass_top", param1=255, },
			},
		},
		replacements = {
			["mcl_flowers:tallgrass"] = "mcl_flowers:double_grass"
		},
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 8,
		noise_params = {
			offset = -0.01,
			scale = 0.03,
			spread = {x = 500, y = 500, z = 500},
			seed = 420,
			octaves = 2,
			persist = 0.6,
		},
		y_min = 1,
		y_max = 40,
		flags = "",
	})

	-- Large ferns
	minetest.register_decoration({
		deco_type = "schematic",
		schematic = {
			size = { x=1, y=3, z=1 },
			data = {
				{ name = "air", prob = 0 },
				{ name = "mcl_flowers:double_fern", param1=255, },
				{ name = "mcl_flowers:double_fern_top", param1=255, },
			},
		},
		replacements = {
			["mcl_flowers:fern"] = "mcl_flowers:double_fern"
		},
		-- This makes sure large ferns only appear in jungles
		spawn_by = { "mcl_core:jungletree", "mcl_flowers:fern" },
		num_spawn_by = 1,
		place_on = {"mcl_core:dirt_with_grass"},

		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.01,
			spread = {x = 250, y = 250, z = 250},
			seed = 333,
			octaves = 2,
			persist = 0.66,
		},
		y_min = 1,
		y_max = 30,
		flags = "",
	})

	-- Large flowers
	local register_large_flower = function(name, seed, offset)
		minetest.register_decoration({
			deco_type = "schematic",
			schematic = {
				size = { x=1, y=3, z=1 },
				data = {
					{ name = "air", prob = 0 },
					{ name = "mcl_flowers:"..name, param1=255, },
					{ name = "mcl_flowers:"..name.."_top", param1=255, },
				},
			},
			place_on = {"mcl_core:dirt_with_grass"},

			sidelen = 16,
			noise_params = {
				offset = offset,
				scale = 0.01,
				spread = {x = 300, y = 300, z = 300},
				seed = seed,
				octaves = 5,
				persist = 0.62,
			},
			y_min = 1,
			y_max = 30,
			flags = "",
		})
	end

	register_large_flower("rose_bush", 9350, -0.008)
	register_large_flower("peony", 10450, -0.008)
	register_large_flower("lilac", 10600, -0.007)
	register_large_flower("sunflower", 2940, -0.005)

	-- Tall grass
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 8,
		noise_params = {
			offset = 0.01,
			scale = 0.3,
			spread = {x = 500, y = 500, z = 500},
			seed = 420,
			octaves = 2,
			persist = 0.6
		},
		y_min = 1,
		y_max = 50,
		decoration = "mcl_flowers:tallgrass",
	})

	-- Add a small amount of tall grass everywhere to avoid areas completely empty devoid of tall grass
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 8,
		fill_ratio = 0.001,
		y_min = 1,
		y_max = 50,
		decoration = "mcl_flowers:tallgrass",
	})

	local mushrooms = {"mcl_mushrooms:mushroom_red", "mcl_mushrooms:mushroom_brown"}
	local mseeds = { 7133, 8244 }
	for m=1, #mushrooms do
		-- Mushrooms next to trees
		minetest.register_decoration({
			deco_type = "simple",
			place_on = {"mcl_core:dirt_with_grass", "mcl_core:dirt", "mcl_core:podzol", "mcl_core:mycelium", "mcl_core:stone", "mcl_core:andesite", "mcl_core:diorite", "mcl_core:granite"},
			sidelen = 16,
			noise_params = {
				offset = 0,
				scale = 0.04,
				spread = {x = 100, y = 100, z = 100},
				seed = mseeds[m],
				octaves = 3,
				persist = 0.6
			},
			y_min = 1,
			y_max = 128,
			decoration = mushrooms[m],
			spawn_by = { "mcl_core:tree", "mcl_core:sprucetree", "mcl_core:darktree", "mcl_core:birchtree", "mcl_core:jungletree", "mcl_core:acaciatree" },
			num_spawn_by = 1,
		})
	end

	-- Dead bushes

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"group:sand", "mcl_core:podzol", "mcl_core:coarse_dirt", "mcl_colorblocks:hardened_clay"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.035,
			spread = {x = 100, y = 100, z = 100},
			seed = 1972,
			octaves = 3,
			persist = 0.6
		},
		y_min = 4,
		y_max = 50,
		decoration = "mcl_core:deadbush",
	})

	local function register_mgv6_flower(name, seed, offset)
		if offset == nil then
			offset = 0
		end
		minetest.register_decoration({
			deco_type = "simple",
			place_on = {"mcl_core:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = offset,
				scale = 0.006,
				spread = {x = 100, y = 100, z = 100},
				seed = seed,
				octaves = 3,
				persist = 0.6
			},
			y_min = 1,
			y_max = 30,
			decoration = "mcl_flowers:"..name,
		})
	end

	register_mgv6_flower("tulip_red",  436)
	register_mgv6_flower("tulip_orange", 536)
	register_mgv6_flower("tulip_pink", 636)
	register_mgv6_flower("tulip_white", 736)
	register_mgv6_flower("azure_bluet", 800)
	register_mgv6_flower("dandelion", 8)
	--[[ Allium and blue orchid are made slightly rarer in v6
	to compensate for missing biomes. In Minecraft, those flowers only appear in special biomes. ]]
	register_mgv6_flower("allium", 0, -0.001)
	register_mgv6_flower("blue_orchid", 64500, -0.001)
	register_mgv6_flower("oxeye_daisy", 3490)
	register_mgv6_flower("poppy", 9439)

	-- Pumpkin
	minetest.register_decoration({
		deco_type = "schematic",
		schematic = {
			size = { x=1, y=2, z=1 },
			data = {
				{ name = "air", prob = 0 },
				{ name = "mcl_farming:pumpkin_face", param1=255, },
			},
		},
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.008,
			scale = 0.00666,
			spread = {x = 250, y = 250, z = 250},
			seed = 666,
			octaves = 6,
			persist = 0.666
		},
		y_min = 3,
		y_max = 29,
		rotation = "random",
	})

	-- Melon
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.003,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 333,
			octaves = 3,
			persist = 0.6
		},
		-- Small trick to make sure melon spawn in jungles
		spawn_by = { "mcl_core:jungletree", "mcl_flowers:fern" },
		num_spawn_by = 1,
		y_min = 1,
		y_max = 40,
		decoration = "mcl_farming:melon",
	})


end

-- Apply mapgen-specific mapgen code
if mg_name == "v6" then
	register_mgv6_decorations()
end
if mg_name == "flat" then
	minetest.set_mapgen_setting("mg_flags", "nocaves,nodungeons,nodecorations,light", true)
else
	minetest.set_mapgen_setting("mg_flags", "caves,nodungeons,decorations,light", true)
end

-- Perlin noise objects
local perlin_structures
local perlin_vines, perlin_vines_fine, perlin_vines_upwards, perlin_vines_length, perlin_vines_density

-- Generate clay and structures
-- TODO: Try to use more efficient structure generating code
minetest.register_on_generated(function(minp, maxp, seed)
	local chunk_has_desert_well = false
	local chunk_has_desert_temple = false
	local chunk_has_igloo = false
	if maxp.y >= 2 and minp.y <= 0 then
		-- Generate clay
		-- Assume X and Z lengths are equal
		local divlen = 4
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx=0+1,divs-1-1 do
		for divz=0+1,divs-1-1 do
			local cx = minp.x + math.floor((divx+0.5)*divlen)
			local cz = minp.z + math.floor((divz+0.5)*divlen)
			if minetest.get_node({x=cx,y=1,z=cz}).name == "mcl_core:water_source" and
					minetest.get_node({x=cx,y=0,z=cz}).name == "mcl_core:sand" then
				local is_shallow = true
				local num_water_around = 0
				if minetest.get_node({x=cx-divlen*2,y=1,z=cz+0}).name == "mcl_core:water_source" then
					num_water_around = num_water_around + 1 end
				if minetest.get_node({x=cx+divlen*2,y=1,z=cz+0}).name == "mcl_core:water_source" then
					num_water_around = num_water_around + 1 end
				if minetest.get_node({x=cx+0,y=1,z=cz-divlen*2}).name == "mcl_core:water_source" then
					num_water_around = num_water_around + 1 end
				if minetest.get_node({x=cx+0,y=1,z=cz+divlen*2}).name == "mcl_core:water_source" then
					num_water_around = num_water_around + 1 end
				if num_water_around >= 2 then
					is_shallow = false
				end	
				if is_shallow then
					for x1=-divlen,divlen do
					for z1=-divlen,divlen do
						if minetest.get_node({x=cx+x1,y=0,z=cz+z1}).name == "mcl_core:sand" or minetest.get_node({x=cx+x1,y=0,z=cz+z1}).name == "mcl_core:sandstone" then
							minetest.set_node({x=cx+x1,y=0,z=cz+z1}, {name="mcl_core:clay"})
						end
					end
					end
				end
			end
		end
		end
	end
	if maxp.y >= 3 and minp.y <= 64 then
		-- Generate desert temples
		perlin_structures = perlin_structures or minetest.get_perlin(329, 3, 0.6, 100)
		-- Assume X and Z lengths are equal
		local divlen = 5
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx=0,divs-1 do
		for divz=0,divs-1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			-- Determine amount from perlin noise
			local amount = math.floor(perlin_structures:get2d({x=x0, y=z0}) * 9)
			-- Find random positions based on this random
			local pr = PseudoRandom(seed+1)
			for i=0, amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				-- Find ground level
				local ground_y = nil
				for y=64,3,-1 do
					if minetest.get_node({x=x,y=y,z=z}).name ~= "air" then
						ground_y = y
						break
					end
				end
				
				if ground_y then
					local p = {x=x,y=ground_y+1,z=z}
					local nn = minetest.get_node(p).name
					-- Check if the node can be replaced
					if minetest.registered_nodes[nn] and
						minetest.registered_nodes[nn].buildable_to then
						nn = minetest.get_node({x=x,y=ground_y,z=z}).name
						local struct = false
						-- Desert temples and desert wells
						if nn == "mcl_core:sand" or (nn == "mcl_core:sandstone") then
							if not chunk_has_desert_temple and not chunk_has_desert_well then
								-- Spawn desert temple
								-- TODO: Check surface
								if math.random(1,12000) == 1 then
									mcl_structures.call_struct(p, "desert_temple")
									chunk_has_desert_temple = true
								end
							end
							if not chunk_has_desert_temple and not chunk_has_desert_well then
								-- Minecraft probability: 1/1000 per Minecraft chunk (16×16).
								-- We adjust the probability to Minetest's MapBlock size.
								local desert_well_prob = 1000 * (((maxp.x-minp.x+1)*(maxp.z-minp.z+1)) / 256)
								-- Spawn desert well
								if math.random(1, desert_well_prob) == 1 then
									-- Check surface
									local surface = minetest.find_nodes_in_area({x=p.x,y=p.y-1,z=p.z}, {x=p.x+5, y=p.y-1, z=p.z+5}, "mcl_core:sand")
									if #surface >= 25 then
										mcl_structures.call_struct(p, "desert_well")
										chunk_has_desert_well = true
									end
								end
							end
						elseif not chunk_has_igloo and (nn == "mcl_core:snowblock" or nn == "mcl_core:snow" or nn == "mcl_core:dirt_with_grass_snow") then
							if math.random(1, 4400) == 1 then
								-- Check surface
								local floor = {x=p.x+9, y=p.y-1, z=p.z+9}
								local surface = minetest.find_nodes_in_area({x=p.x,y=p.y-1,z=p.z}, floor, "mcl_core:snowblock")
								local surface2 = minetest.find_nodes_in_area({x=p.x,y=p.y-1,z=p.z}, floor, "mcl_core:dirt_with_grass_snow")
								if #surface + #surface2 >= 63 then
									mcl_structures.call_struct(p, "igloo")
									chunk_has_igloo = true
								end
							end
						end
					end
				end
				
			end
		end
		end
	end
end)


-- Generate bedrock layer or layers
local BEDROCK_MIN = mcl_vars.mg_bedrock_overworld_min
local BEDROCK_MAX = mcl_vars.mg_bedrock_overworld_max
local GEN_MAX = mcl_vars.mg_lava_overworld_max or BEDROCK_MAX

-- Buffer for LuaVoxelManip
local lvm_buffer = {}

-- Below the bedrock, generate air/void
minetest.register_on_generated(function(minp, maxp)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local data = vm:get_data(lvm_buffer)
	local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
	local lvm_used = false

	-- Generate bedrock and lava layers
	if minp.y <= GEN_MAX then
		local c_bedrock = minetest.get_content_id("mcl_core:bedrock")
		--local c_void = minetest.get_content_id("mcl_core:void")
		local c_lava = minetest.get_content_id("mcl_core:lava_source")
		local c_air = minetest.get_content_id("air")

		local max_y = math.min(maxp.y, GEN_MAX)

		for y = minp.y, max_y do
			for x = minp.x, maxp.x do
				for z = minp.z, maxp.z do
					local p_pos = area:index(x, y, z)
					local setdata = nil
					if mcl_vars.mg_bedrock_is_rough then
						-- Bedrock layers with increasing levels of roughness, until a perfecly flat bedrock later at the bottom layer
						-- This code assumes a bedrock height of 5 layers.
						if y == BEDROCK_MAX then
							-- 50% bedrock chance
							if math.random(1,2) == 1 then setdata = c_bedrock end
						elseif y == BEDROCK_MAX -1 then
							-- 66.666...%
							if math.random(1,3) <= 2 then setdata = c_bedrock end
						elseif y == BEDROCK_MAX -2 then
							-- 75%
							if math.random(1,4) <= 3 then setdata = c_bedrock end
						elseif y == BEDROCK_MAX -3 then
							-- 90%
							if math.random(1,10) <= 9 then setdata = c_bedrock end
						elseif y == BEDROCK_MAX -4 then
							-- 100%
							setdata = c_bedrock
						elseif y < BEDROCK_MIN then
							setdata = c_void
						end
					else
						-- Perfectly flat bedrock layer(s)
						if y >= BEDROCK_MIN and y <= BEDROCK_MAX then
							setdata = c_bedrock
						elseif y < BEDROCK_MIN then
							setdata = c_void
						end
					end

					if setdata then
						data[p_pos] = setdata
						lvm_used = true
					elseif mcl_vars.mg_lava and y <= mcl_vars.mg_lava_overworld_max then
						if data[p_pos] == c_air then
							data[p_pos] = c_lava
						end
						lvm_used = true
					end
				end
			end
		end
	end

	-- Put top snow on grassy snow blocks created by the v6 mapgen
	-- This is because the snowy grass block must only be used when it is below snow or top snow
	--if mg_name == "v6" then
	if mg_name == "v7" then
		local c_top_snow = minetest.get_content_id("mcl_core:snow")
		local snowdirt = minetest.find_nodes_in_area_under_air(minp, maxp, "mcl_core:dirt_with_grass_snow")
		for n = 1, #snowdirt do
			-- CHECKME: What happens at chunk borders?
			local p_pos = area:index(snowdirt[n].x, snowdirt[n].y + 1, snowdirt[n].z)
			if p_pos then
				data[p_pos] = c_top_snow
			end
		end
		if #snowdirt > 1 then
			lvm_used = true
		end
	end

	if lvm_used then
		vm:set_data(data)
		vm:calc_lighting()
		vm:update_liquids()
		vm:write_to_map()
	end

	-- Generate rare underground mushrooms
	-- TODO: Make them appear in groups, use Perlin noise
	if minp.y > 0 or maxp.y < -32 then
		return
	end

	local bpos
	local stone = minetest.find_nodes_in_area_under_air(minp, maxp, {"mcl_core:stone", "mcl_core:dirt", "mcl_core:mycelium", "mcl_core:podzol", "mcl_core:andesite", "mcl_core:diorite", "mcl_core:granite", "mcl_core:stone_with_coal", "mcl_core:stone_with_iron", "mcl_core:stone_with_gold"})

	for n = 1, #stone do
		bpos = {x = stone[n].x, y = stone[n].y + 1, z = stone[n].z }

		if math.random(1,1000) < 4 and minetest.get_node_light(bpos, 0.5) <= 12 then
			if math.random(1,2) == 1 then
				minetest.set_node(bpos, {name = "mcl_mushrooms:mushroom_brown"})
			else
				minetest.set_node(bpos, {name = "mcl_mushrooms:mushroom_red"})
			end
		end
	end

	-- Generate cocoas and vines at jungle trees (v6 only)
	--if minetest.get_mapgen_setting("mg_name") == "v6" then
	if minetest.get_mapgen_setting("mg_name") == "v7" then

		if maxp.y < 0 then
			return
		end

		local pos, treepos, dir
		local jungletree = minetest.find_nodes_in_area(minp, maxp, "mcl_core:jungletree")
		local jungleleaves = minetest.find_nodes_in_area(minp, maxp, "mcl_core:jungleleaves")

		-- Pass 1: Generate cocoas
		for n = 1, #jungletree do

			pos = jungletree[n]
			treepos = table.copy(pos)

			if minetest.find_node_near(pos, 1, {"mcl_core:jungleleaves"}) then

				dir = math.random(1, 40)

				if dir == 1 then
					pos.z = pos.z + 1
				elseif dir == 2 then
					pos.z = pos.z - 1
				elseif dir == 3 then
					pos.x = pos.x + 1
				elseif dir == 4 then
					pos.x = pos.x -1
				end

				local nn = minetest.get_node(pos).name

				if dir < 5
				and nn == "air"
				and minetest.get_node_light(pos) > 12 then
					minetest.swap_node(pos, {
						name = "mcl_cocoas:cocoa_" .. tostring(math.random(1, 3)),
						param2 = minetest.dir_to_facedir(vector.subtract(treepos, pos))
					})
				end

			end
		end

		-- Pass 2: Generate vines at jungle wood and jungle leaves
		perlin_vines = perlin_vines or minetest.get_perlin(555, 4, 0.6, 500)
		perlin_vines_fine = perlin_vines_fine or minetest.get_perlin(43000, 3, 0.6, 1)
		perlin_vines_length = perlin_vines_length or minetest.get_perlin(435, 4, 0.6, 75)
		perlin_vines_upwards = perlin_vines_upwards or minetest.get_perlin(436, 3, 0.6, 10)
		perlin_vines_density = perlin_vines_density or minetest.get_perlin(436, 3, 0.6, 500)
		local junglething
		for i=1, 2 do
			if i==1 then junglething = jungletree
			else junglething = jungleleaves end

			for n = 1, #junglething do
				pos = junglething[n]

				treepos = table.copy(pos)

				local dirs = {
					{x=1,y=0,z=0},
					{x=-1,y=0,z=0},
					{x=0,y=0,z=1},
					{x=0,y=0,z=-1},
				}

				for d = 1, #dirs do
				local pos = vector.add(pos, dirs[d])

				local nn = minetest.get_node(pos).name

				if perlin_vines:get2d(pos) > 0.1 and perlin_vines_fine:get3d(pos) > math.max(0.3333, perlin_vines_density:get2d(pos)) and nn == "air" then

					local newnode = {
						name = "mcl_core:vine",
						param2 = minetest.dir_to_wallmounted(vector.subtract(treepos, pos))
					}

					-- Determine growth direction
					local grow_upwards = false
					-- Only possible on the wood, not on the leaves
					if i == 1 then
						grow_upwards = perlin_vines_upwards:get3d(pos) > 0.8
					end
					if grow_upwards then
						-- Grow vines up 1-4 nodes, even through jungleleaves.
						-- This may give climbing access all the way to the top of the tree :-)
						-- But this will be fairly rare.
						local length = math.ceil(math.abs(perlin_vines_length:get3d(pos)) * 4)
						for l=0, length-1 do
							local tnn = minetest.get_node(treepos).name
							local nn = minetest.get_node(pos).name
							if (nn == "air" or nn == "mcl_core:jungleleaves") and mcl_core.supports_vines(tnn) then
								minetest.set_node(pos, newnode)
							else
								break
							end
							pos.y = pos.y + 1
							treepos.y = treepos.y + 1
						end
					else
						-- Grow vines down 1-7 nodes
						local length = math.ceil(math.abs(perlin_vines_length:get3d(pos)) * 7)
						for l=0, length-1 do
							if minetest.get_node(pos).name == "air" then
								minetest.set_node(pos, newnode)
							else
								break
							end
							pos.y = pos.y - 1
						end
					end
				end
				end
			end
		end
	end

end)


