--[[
--
-- Register biomes for mapgens other than v6
-- EXPERIMENTAL!
--

local function register_classic_superflat_biome()
	-- Classic Superflat: bedrock (not part of biome), 2 dirt, 1 grass block
	minetest.register_biome({
		name = "flat",
		node_top = "mcl_core:dirt_with_grass",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		node_stone = "mcl_core:dirt",
		y_min = -512,
		y_max = 512,
		heat_point = 50,
		humidity_point = 50,
	})
end

-- All mapgens except mgv6, flat and singlenode
local function register_biomes()

	minetest.register_biome({
		name = "ice_plains",
		node_dust = "mcl_core:snow",
		node_top = "mcl_core:dirt_with_grass_snow",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		node_riverbed = "mcl_core:dirt",
		depth_riverbed = 2,
		y_min = 1,
		y_max = 31000,
		heat_point = 5,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "ice_plains2",
		node_dust = "mcl_core:snowblock",
		node_top = "mcl_core:dirt_with_grass_snow",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		node_riverbed = "mcl_core:dirt",
		depth_riverbed = 2,
		y_min = 1,
		y_max = 31000,
		heat_point = 0,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "plains",
		node_top = "mcl_core:dirt_with_grass",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 1,
		y_max = 31000,
		heat_point = 40,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "beach",
		node_top = "mcl_core:sand",
		depth_top = 1,
		node_filler = "mcl_core:sand",
		depth_filler = 3,
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 1,
		y_max = 5,
		heat_point = 40,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "desert",
		node_top = "mcl_core:sand",
		depth_top = 1,
		node_filler = "mcl_core:sand",
		depth_filler = 3,
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		node_stone = "mcl_core:sandstone",
		y_min = 1,
		y_max = 31000,
		heat_point = 100,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "mesa",
		node_top = "mcl_core:redsand",
		depth_top = 1,
		node_filler = "mcl_colorblocks:hardened_clay_orange",
		depth_filler = 3,
		node_riverbed = "mcl_core:redsand",
		depth_riverbed = 2,
		node_stone = "mcl_colorblocks:hardened_clay_orange",
		y_min = 1,
		y_max = 5,
		heat_point = 100,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "mesa2",
		node_top = "mcl_colorblocks:hardened_clay",
		depth_top = 1,
		node_filler = "mcl_colorblocks:hardened_clay_orange",
		depth_filler = 1,
		node_riverbed = "mcl_core:redsand",
		depth_riverbed = 2,
		node_stone = "mcl_colorblocks:hardened_clay_orange",
		y_min = 1,
		y_max = 5,
		heat_point = 100,
		humidity_point = 50,
	})


	minetest.register_biome({
		name = "underground",
		y_min = -31000,
		y_max = -113,
		heat_point = 50,
		humidity_point = 50,
	})
end


-- All mapgens except mgv6

local function register_grass_decoration(offset, scale)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"plains"},
		y_min = 1,
		y_max = 31000,
		decoration = "mcl_flowers:tallgrass",
	})
end

local function register_decorations()

	-- Cactus

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:sand", "mcl_core:redsand"},
		sidelen = 16,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_min = 5,
		y_max = 31000,
		decoration = "mcl_core:cactus",
		height = 1,
		height_max = 3,
	})

	-- Papyrus

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt", "mcl_core:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"plains", "beach", "desert"},
		y_min = 0,
		y_max = 0,
		decoration = "mcl_core:reeds",
		height = 1,
		height_max = 3,
	})

	-- Grasses

	register_grass_decoration(-0.03,  0.09)
	register_grass_decoration(-0.015, 0.075)
	register_grass_decoration(0,      0.06)
	register_grass_decoration(0.015,  0.045)
	register_grass_decoration(0.03,   0.03)
	register_grass_decoration(0.01, 0.05)
	register_grass_decoration(0.03, 0.03)
	register_grass_decoration(0.05, 0.01)
	register_grass_decoration(0.07, -0.01)
	register_grass_decoration(0.09, -0.03)

	-- Dead bushes

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:sand", "mcl_core:redsand"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.02,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_min = 2,
		y_max = 31000,
		decoration = "mcl_core:deadbush",
		height = 1,
	})

end


--
-- Detect mapgen to select functions
--
local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name ~= "v6" and mg_name ~= "flat" then
	minetest.clear_registered_biomes()
	minetest.clear_registered_decorations()
	minetest.clear_registered_schematics()
	register_biomes()
	register_decorations()
elseif mg_name == "flat" then
	-- Implementation of Minecraft's Superflat mapgen, classic style
	minetest.clear_registered_biomes()
	minetest.clear_registered_decorations()
	minetest.clear_registered_schematics()
	register_classic_superflat_biome()
end
]]

--MAIKERUMINES TESTING BIOMES


--
-- Register ores
--

-- All mapgens except singlenode
-- Blob ore first to avoid other ores inside blobs

function mcl_portals.register_ores()
--[[

--Maikerumine added for nicer looking deserts

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:redsandstone_with_coal",
		wherein        = "mcl_core:redsandstone",
		clust_scarcity = 6 * 6 * 6,
		clust_num_ores = 9,
		clust_size     = 6,
		y_min          = -80,
		y_max          = 200,
	})

	-- Iron
minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:redsandstone_with_iron",
		wherein        = "mcl_core:redsandstone",
		clust_scarcity = 6 * 6 * 7,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -80,
		y_max          = 200,
	})
]]

minetest.register_ore({
	ore_type       = "blob",
	ore            = "mcl_core:mossycobble",
	wherein        = "mcl_core:podzol",
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = 25,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
})


minetest.register_ore({
	ore_type       = "blob",
	ore            = "mcl_core:bone_block",
	wherein        = "mcl_core:sandstone",
		clust_scarcity  = 36 * 36 * 36,
		clust_size      = 5,
		y_min           = -50,
		y_max           = -19,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
})

--mcl_core STRATA
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_core:stone",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	clust_scarcity = 1,
	clust_num_ores = 3,
	clust_size     = 4,
	y_min     = 50,
	y_max     = 90,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_core:clay",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 8,
	y_min     = 24,
	y_max     = 50,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_core:sandstone",
	wherein        ={"mcl_colorblocks:hardened_clay_orange"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 10,
	y_min     = 10,
	y_max     = 30,
	noise_threshold = 0.2,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_core:dirt",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 4,
	y_min     = -12,
	y_max     = 7,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_core:gravel",
	wherein        = {"mcl_core:redsandstone"},
	clust_scarcity = 1,
	clust_num_ores = 8,
	clust_size     = 4,
	y_min     = 34,
	y_max     = 70,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_core:coalblock",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 4,
	y_min     = 60,
	y_max     = 96,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.80}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_core:redsand",
	wherein        = { "mcl_colorblocks:hardened_clay_orange"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 10,
	y_min     = 44,
	y_max     = 70,
	noise_threshold = 0.7,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})


--HARDENED CLAY FOR MESA :)
--maikerumine

--MESA STRATA
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_core:redsand",
	wherein        = {"mcl_core:redsandstone", "mcl_colorblocks:hardened_clay_orange"},
	clust_scarcity = 1,
	clust_num_ores = 8,
	clust_size     = 4,
	y_min     = 4,
	y_max     = 70,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})


minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_white",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 27,
	clust_size     = 1,
	y_min     = 5,
	y_max     = 14,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_black",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores =27,
	clust_size     = 1,
	y_min     = 15,
	y_max     = 17,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70}, 
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_brown",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 27,
	clust_size     = 6,
	y_min     = 20,
	y_max     = 29,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_red",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 8,
	clust_size     = 2,
	y_min     = 34,
	y_max     = 37,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_yellow",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	y_min     = 42,
	y_max     = 43,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_blue",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	y_min     = 43,
	y_max     = 44,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_yellow",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	y_min     = 44,
	y_max     = 45,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_yellow",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	y_min     = 45,
	y_max     = 47,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_light_blue",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	y_min     = 49,
	y_max     = 52,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_yellow",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 4,
	y_min     = 53,
	y_max     = 59,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_white",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 8,
	y_min     = 61,
	y_max     = 70,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_colorblocks:hardened_clay_purple",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 8,
	y_min     = 66,
	y_max     = 75,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_core:obsidian",
	wherein        = {"mcl_colorblocks:hardened_clay_orange"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 8,
	y_min     = 161,
	y_max     = 170,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

	
--NETHER GENERATION	
--nether defs

	
	minetest.register_ore({
	    ore_type       = "scatter",
	    ore            = "mcl_nether:quartz_ore",
	    --wherein        = "mcl_nether:rack",
	    wherein        = {"mcl_nether:netherrack","mcl_core:stone"},
	    clust_scarcity = 10*10*10,
	    clust_num_ores = 6,
	    clust_size     = 5,
	    y_min     = -3390,
	    y_max     = -3000,
	    --y_max     = NETHER_DEPTH,
	})

	-- Slow Sand

	minetest.register_ore({
		ore_type        = "sheet",
		ore             = "mcl_nether:soul_sand",
		wherein         = {"mcl_nether:netherrack", "mcl_core:lava_source",
			"mcl_core:redsandstone"},
		clust_scarcity  = 13 * 13 * 13,
		clust_size      = 5,
		y_min           = -3390,
		y_max           = -3000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.1,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
	})

	--magma
	
		minetest.register_ore({
		ore_type        = "sheet",
		ore             = "mcl_nether:magma",
		wherein         = {"mcl_nether:netherrack", "mcl_core:lava_source",
			"mcl_core:redsandstone"},
		clust_scarcity  = 13 * 13 * 13,
		clust_size      = 5,
		y_min           = -3390,
		y_max           = -3000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.1,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
	})
	
	
	-- Glowstone

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "mcl_nether:glowstone",
		wherein         = {"mcl_nether:netherrack"},
		clust_scarcity  = 26 * 26 * 26,
		clust_size      = 5,
		y_min           = -3390,
		y_max           = -3000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.1,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Gravel

	minetest.register_ore({
		ore_type        = "sheet",
		ore             = "mcl_core:gravel",
		wherein         = {"mcl_nether:netherrack"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -3390,
		y_max           = -3000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

	--Lava
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:lava_source",
		wherein        = "mcl_nether:netherrack",
		clust_scarcity =12 *12 * 12,
		clust_num_ores = 2,
		clust_size     = 2,
		y_min           = -3390,
		y_max           = -3000,
	})	
	
	
	--Fire
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_fire:eternal_fire",
		wherein        = "mcl_nether:netherrack",
		clust_scarcity =12 *22 * 12,
		clust_num_ores = 5,
		clust_size     = 5,
		y_min           = -3390,
		y_max           = -3000,
	})

--brick
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "mcl_nether:nether_brick",
		wherein         = {"mcl_nether:netherrack", "mcl_core:lava_source",
			"mcl_core:redsandstone"},
		clust_scarcity  = 13 * 13 * 13,
		clust_size      = 5,
		y_min           = -3390,
		y_max           = -3000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.1,
			spread = {x = 5, y = 5, z = 5},
			seed = 16,
			octaves = 1,
			persist = 0.0
		},
	})
	
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mcl_nether:nether_brick",
	wherein        ={"mcl_nether:netherrack"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 10,
	y_min     = -3390,
	y_max     = -3200,
	noise_threshold = 0.2,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "air",
	wherein        ={"mcl_nether:netherrack"},
	clust_scarcity = 1,
	clust_num_ores = 32,
	clust_size     = 10,
	y_min           = -3390,
	y_max           = -3000,
	noise_threshold = 0.2,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

--Realm1 generation
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_diamond",
		wherein        = "mcl_core:stone",
		clust_scarcity = 1000,
		clust_num_ores = 30,
		clust_size     = 9,
		y_min     = -31000,
		y_max     = -5000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:diamondblock",
		wherein        = "mcl_core:stone",
		clust_scarcity = 10000,
		clust_num_ores = 30,
		clust_size     = 9,
		y_min     = -31000,
		y_max     = -5000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_emerald",
		wherein        = "mcl_core:stone",
		clust_scarcity = 5000,
		clust_num_ores = 36,
		clust_size     = 9,
		y_min     = -31000,
		y_max     = -5000,
	})	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_iron",
		wherein        = "mcl_core:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
	y_min     = -31000,
	y_max     = -5000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:tree",
		wherein        = "mcl_core:water_source",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 2,
		clust_size     = 6,
	y_min     = -5500,
	y_max     = -5000,
	})	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_coal",
		wherein        = "mcl_core:stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
	y_min     = -5500,
	y_max     = -5000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_nether:glowstone",
		wherein        = "mcl_core:water_source",
		clust_scarcity = 38 * 38 * 38,
		clust_num_ores = 2,
		clust_size     = 1,
	y_min     = -5500,
	y_max     = -5000,
	})	

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:stone_with_emerald",
		wherein        = "mcl_core:water_source",
		clust_scarcity = 68 * 68 * 68,
		clust_num_ores = 2,
		clust_size     = 1,
	y_min     = -5530,
	y_max     = -5420,
	})
	

	-- endstone???  TODO make a mapgen

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "mcl_end:end_stone",
		wherein         = {"mcl_core:void", "mcl_core:end_stone","mcl_core:stone","air","ignore"},
		clust_scarcity  = 30 * 30 * 30,  	--was26
		clust_size      = 17,				--was5
		y_min           = -6470,
		y_max           = -6110,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.1,
			spread = {x = 5, y = 5, z = 5},
			seed = 16,
			octaves = 1,
			persist = 0.0
		},
	})	
end
--
-- Register biomes
--

-- All mapgens except mgv6 and singlenode


function mcl_portals.register_biomes(upper_limit)

	-- Icesheet

	minetest.register_biome({
		name = "icesheet",
		node_dust = "mcl_core:snowblock",
		node_top = "mcl_core:snowblock",
		depth_top = 1,
		node_filler = "mcl_core:snowblock",
		depth_filler = 3,
		node_stone = "mcl_core:ice",
		node_water_top = "mcl_core:ice",
		depth_water_top = 10,
		--node_water = "",
		node_river_water = "mcl_core:ice",
		node_riverbed = "mcl_core:gravel",
		depth_riverbed = 2,
		y_min = -8,
		y_max = upper_limit,
		heat_point = 5,
		humidity_point = 88,  --was73
	})

	minetest.register_biome({
		name = "icesheet_ocean",
		node_dust = "mcl_core:snowblock",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		--node_stone = "",
		node_water_top = "mcl_core:ice",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		y_min = -112,
		y_max = -9,
		heat_point = 5,
		humidity_point = 74,  --was73
	})

	-- Tundra

	minetest.register_biome({
		name = "tundra",
		node_dust = "mcl_core:snowblock",
		--node_top = ,
		--depth_top = ,
		--node_filler = ,
		--depth_filler = ,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:gravel",
		depth_riverbed = 2,
		y_min = 2,
		y_max = upper_limit,
		heat_point = 10,
		humidity_point = 20,  --was 40
	})

	minetest.register_biome({
		name = "tundra_beach",
		--node_dust = "",
		node_top = "mcl_core:gravel",
		depth_top = 1,
		node_filler = "mcl_core:gravel",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:gravel",
		depth_riverbed = 2,
		y_min = -3,
		y_max = 1,
		heat_point = 10,
		humidity_point = 20,  --was40
	})

	minetest.register_biome({
		name = "tundra_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:gravel",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -4,
		heat_point = 10,
		humidity_point = 20,  --was 40
	})

	-- Taiga

	minetest.register_biome({
		name = "taiga",
		--node_dust = "mcl_core:snow",
		node_top = "mcl_core:podzol",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 15,
		y_max = upper_limit,
		heat_point = 15,
		humidity_point = 70,  --was 70
	})

	minetest.register_biome({
		name = "taiga_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 1,
		heat_point = 15,
		humidity_point = 70,  --was 70
	})

	-- Snowy grassland

	minetest.register_biome({
		name = "snowy_grassland",
		node_dust = "mcl_core:snow",
		node_top = "mcl_core:dirt_with_grass_snow",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 30,
		humidity_point = 45,  --was 35
	})

	minetest.register_biome({
		name = "snowy_grassland_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 30,
		humidity_point = 45,  --was 35
	})

	-- Grassland

	minetest.register_biome({
		name = "grassland",
		--node_dust = "",
		node_top = "mcl_core:dirt_with_grass",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 6,
		y_max = upper_limit,
		heat_point = 42,
		humidity_point = 30,  --was 35
	})

	minetest.register_biome({
		name = "grassland_dunes",
		--node_dust = "",
		node_top = "mcl_core:sand",
		depth_top = 1,
		node_filler = "mcl_core:sand",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 5,
		y_max = 1,
		heat_point = 42,
		humidity_point = 30,  --was 35
	})

	minetest.register_biome({
		name = "grassland_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 0,
		heat_point = 42,
		humidity_point = 30,  --was 35
	})

	-- Coniferous forest

	minetest.register_biome({
		name = "coniferous_forest",
		--node_dust = "",
		node_top = "mcl_core:dirt_with_grass",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 6,
		y_max = upper_limit,
		heat_point = 45,
		humidity_point = 70,  --was 70
	})

	minetest.register_biome({
		name = "coniferous_forest_dunes",
		--node_dust = "",
		node_top = "mcl_core:sand",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 1,
		y_max = 56,
		heat_point = 45,
		humidity_point = 70,  --was 70
	})

	minetest.register_biome({
		name = "coniferous_forest_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 0,
		heat_point = 45,
		humidity_point = 70,  --was 70
	})

	-- Deciduous forest

	minetest.register_biome({
		name = "deciduous_forest",
		--node_dust = "",
		node_top = "mcl_core:dirt_with_grass",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 1,
		y_max = upper_limit,
		heat_point = 50,
		humidity_point = 60,  --was 68
	})

	minetest.register_biome({
		name = "deciduous_forest_shore",
		--node_dust = "",
		node_top = "mcl_core:dirt",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 0,
		heat_point = 50,
		humidity_point = 60,  --was 68
	})

	minetest.register_biome({
		name = "deciduous_forest_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -2,
		heat_point = 50,
		humidity_point = 60,  --was 68
	})

	-- Desert

	minetest.register_biome({
		name = "desert",
		--node_dust = "",
		node_top = "mcl_core:redsand",
		depth_top = 1,
		node_filler = "mcl_core:redsand",
		depth_filler = 1,
		node_stone = "mcl_core:redsandstone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 1,
		y_max = upper_limit,
		heat_point = 88,
		humidity_point = 20,  --was 16
	})

	minetest.register_biome({
		name = "desert_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		node_stone = "mcl_core:stone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 0,
		heat_point = 88,
		humidity_point = 20,  --was 16
	})

	-- Sandstone desert

	minetest.register_biome({
		name = "sandstone_desert",
		--node_dust = "",
		node_top = "mcl_core:sand",
		depth_top = 1,
		node_filler = "mcl_core:sand",
		depth_filler = 1,
		node_stone = "mcl_core:sandstone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 0,
		y_max = upper_limit,
		heat_point = 60,
		humidity_point = 15,  --was 0
	})

	minetest.register_biome({
		name = "sandstone_desert_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		node_stone = "mcl_core:stone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 60,
		humidity_point = 15,  --was 0
	})

	-- Cold desert

	minetest.register_biome({
		name = "cold_desert",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 30,
		humidity_point = 3,  --was 0
	})

	minetest.register_biome({
		name = "cold_desert_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 30,
		humidity_point = 3,  --was 0
	})

		-- Hot
--maikerumine added :)
		minetest.register_biome({
		name = "mesa",
		--node_dust = "",
		node_top = "mcl_colorblocks:hardened_clay_orange",
		depth_top = 1,
		node_filler = "mcl_colorblocks:hardened_clay_orange",
		depth_filler = 1,
		node_stone = "mcl_colorblocks:hardened_clay_orange",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -35,
		y_max = 31000,
		heat_point = 100,
		humidity_point = 1,  --was 40
	})
	-- Savanna

	minetest.register_biome({
		name = "savanna",
		--node_dust = "",
		node_top = "mcl_core:coarse_dirt",
		depth_top = 1,
		node_filler = "mcl_core:coarse_dirt",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 1,
		y_max = upper_limit,
		heat_point = 79,
		humidity_point = 35,  --was 42
	})

	minetest.register_biome({
		name = "savanna_shore",
		--node_dust = "",
		node_top = "mcl_core:dirt",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 0,
		heat_point = 79,
		humidity_point = 42,  --was 42
	})

	minetest.register_biome({
		name = "savanna_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:stone",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -2,
		heat_point = 59,
		humidity_point = 40,  --was 42
	})

	-- Rainforest

	minetest.register_biome({
		name = "rainforest",
		--node_dust = "",
		node_top = "mcl_core:podzol",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = 1,
		y_max = upper_limit,
		heat_point = 86,
		humidity_point = 70,  --was 65
	})

	minetest.register_biome({
		name = "rainforest_swamp",
		--node_dust = "",
		node_top = "mcl_core:dirt",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 0,
		heat_point = 86,
		humidity_point = 80,  --was 65
	})

	
--mooshroom
		minetest.register_biome({
		name = "mooshroom",
		--node_dust = "",
		node_top = "mcl_core:mycelium",
		depth_top = 1,
		node_filler = "mcl_core:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 50,
		heat_point = 43,
		humidity_point = 50,  --was 55
	})

		minetest.register_biome({
		name = "mooshroom_cold",
		--node_dust = "",
		node_top = "mcl_core:mycelium_snow",
		depth_top = 1,
		node_filler = "mcl_core:coarse_dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 2,
		y_min = 56,
		y_max = 900,
		heat_point = 43,
		humidity_point =  50,  --was 55
	})

	
	
	minetest.register_biome({
		name = "rainforest_ocean",
		--node_dust = "",
		node_top = "mcl_core:sand",
		depth_top = 1,
		node_filler = "mcl_core:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -2,
		heat_point = 86,
		humidity_point =  50,  --was 65
	})
	
	-- Underground
	--MAPGEN REALMS
	minetest.register_biome({
		name = "dropzone",
		--node_dust = "",
		--node_top = "",
		--depth_top = 1,
		--node_filler = "mcl_core:dummy",
		--depth_filler = 3,
		node_stone =  "mcl_portals:dummy",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -2974,
		y_max = -82,
		heat_point = 50,
		humidity_point = 50,
	})
	
		minetest.register_biome({
		name = "airworld",
		--node_dust = "",
		--node_top = "",
		--depth_top = 1,
		--node_filler = "air",
		--depth_filler = 3,
		node_stone =  "air",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -2979,
		y_max = -2975,
		heat_point = 50,
		humidity_point = 50,
	})
	
	minetest.register_biome({
		name = "void",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "mcl_core:bedrock",
		--depth_filler = ,
		node_stone =  "mcl_core:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3000,
		y_max = -2980,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "underground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		node_filler = "mcl_nether:netherrack",
		--depth_filler = ,
		node_stone =  "mcl_nether:netherrack",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3330,
		y_max = -3001,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "lava",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		node_filler = "mcl_core:lava_source",
		--depth_filler = ,
		node_stone =  "mcl_core:lava_source",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3399,
		y_max = -3331,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "lavabottom",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		node_filler = "mcl_core:bedrock",
		--depth_filler = ,
		node_stone =  "mcl_core:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -4000,
		y_max = -3400,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "airworldlow",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		node_filler = "mcl_portals:dummy",
		--depth_filler = ,
		node_stone =  "air",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5000,
		y_max = -4001,
		heat_point = 50,
		humidity_point = 50,
	})	
	
	
	--realm 2
		minetest.register_biome({
		name = "realm2",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "mcl_core:dummy",
		--depth_filler = ,
		node_stone =  "mcl_core:water_source",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5500,
		y_max = -5001,
		heat_point = 50,
		humidity_point = 50,
	})	
	
		minetest.register_biome({
		name = "realm2b",
		--node_dust = "",
		node_top = "mcl_core:dirt",
		depth_top = 12,
		node_filler = "mcl_core:sand",
		depth_filler = 1,
		node_stone =  "mcl_core:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5600,
		y_max = -5551,
		heat_point = 50,
		humidity_point = 50,
	})		
	
	--realm 3  "end"
		minetest.register_biome({
		name = "realm3",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		node_filler = "mcl_end:end_stone",
		--depth_filler = ,
		node_stone =  "mcl_portals:void",
		--node_stone =  "air",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -6470,
		y_max = -6000,
		heat_point = 50,
		humidity_point = 50,
	})	
	
		minetest.register_biome({
		name = "realm3b",
		node_dust = "ignore",
		node_top = "ignore",
		depth_top = 12,
		node_filler = "ignore",
		depth_filler = 1,
		node_stone =  "ignore",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -6550,
		y_max = -6099,
		heat_point = 50,
		humidity_point = 50,
	})		
	
	
	

end




--
-- Register decorations
--



-- All mapgens except mgv6 and singlenode



function mcl_portals.register_decorations()
	minetest.clear_registered_decorations()

	-- Apple tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0036,
			scale = 0.0022,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/apple_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.00018,
			scale = 0.00011,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "mcl_core:tree", param2 = 12, prob = 191},
				{name = "mcl_core:tree", param2 = 12},
				{name = "mcl_core:tree", param2 = 12, prob = 127},
				{name = "air", prob = 0},
				{name = "mcl_mushrooms:mushroom_brown", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Jungle tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt_with_grass", "mcl_core:dirt", "mcl_core:podzol"},
		sidelen = 80,
		fill_ratio = 0.09,
		biomes = {"rainforest", "rainforest_swamp"},
		y_min = 0,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/jungle_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt_with_grass", "mcl_core:dirt", "mcl_core:podzol"},
		sidelen = 80,
		fill_ratio = 0.01,
		biomes = {"rainforest", "rainforest_swamp"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "mcl_core:jungletree", param2 = 12, prob = 191},
				{name = "mcl_core:jungletree", param2 = 12},
				{name = "mcl_core:jungletree", param2 = 12, prob = 127},
				{name = "air", prob = 0},
				{name = "mcl_mushrooms:mushroom_brown", prob = 127},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Taiga and temperate coniferous forest pine tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt_with_grass_snow", "mcl_core:dirt_with_grass", "mcl_core:podzol"},
		sidelen = 16,
		noise_params = {
			offset = 0.0096,
			scale = 0.0022,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest","coniferous_forest_dunes"},
		y_min = 2,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt_with_grass_snow", "mcl_core:dirt_with_grass", "mcl_core:podzol"},
		sidelen = 80,
		noise_params = {
			offset = 0.00018,
			scale = 0.00011,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest","coniferous_forest_dunes"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "mcl_core:sprucetree", param2 = 12, prob = 191},
				{name = "mcl_core:sprucetree", param2 = 12},
				{name = "mcl_core:sprucetree", param2 = 12, prob = 127},
				{name = "air", prob = 0},
				{name = "mcl_mushrooms:mushroom_red", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Acacia tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt_with_grass", "mcl_core:coarse_dirt"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/acacia_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:coarse_dirt"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = {x = 3, y = 2, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "mcl_core:acaciatree", param2 = 12, prob = 191},
				{name = "mcl_core:acaciatree", param2 = 12},
				{name = "mcl_core:acaciatree", param2 = 12, prob = 127},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	
minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:sand"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_min = 7,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/acacia_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
	
	-- Aspen tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.0015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/aspen_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.00008,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "mcl_core:birchtree", param2 = 12},
				{name = "mcl_core:birchtree", param2 = 12},
				{name = "mcl_core:birchtree", param2 = 12, prob = 127},
				{name = "mcl_mushrooms:mushroom_red", prob = 63},
				{name = "mcl_mushrooms:mushroom_brown", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})
	
	
--Big dark oak  W.I.P.

--TODO  MAKE SCHEMATICS	
	
	
	
	-- Large cactus removed

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:redsand", "mcl_core:sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_min = 5,
		y_max = 31000,
		decoration = "mcl_core:cactus",
		flags = "place_center_x",
		rotation = "random",
	})

	-- Cactus

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:redsand", "mcl_core:sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_min = 5,
		y_max = 31000,
		decoration = "mcl_core:cactus",
		height = 2,
		y_max = 5,
	})

	-- Papyrus

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"savanna_swamp"},
		y_min = 0,
		y_max = 0,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/papyrus.mts",
	})

--mooshroom deco
	--Red Mushroom
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:mycelium"},
		sidelen = 80,
		fill_ratio = 0.004,
		biomes = {"mooshroom"},
		y_min = -6000,
		y_max = 31000,
		decoration = "mcl_mushrooms:mushroom_red",
	})
	--Brown Mushroom
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:mycelium"},
		sidelen = 80,
		fill_ratio = 0.003,
		biomes = {"mooshroom"},
		y_min = -6000,
		y_max = 31000,
		decoration = "mcl_mushrooms:mushroom_brown",
	})

	--Large Mushroom
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:mycelium", "mcl_core:mycelium_snow"},
		sidelen = 80,
		fill_ratio = 0.0004,
		biomes = {"mooshroom", "mooshroom_cold"},
		y_min = -6000,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/mushroom_large.mts",
		flags = "place_center_x",
		rotation = "random",
	})
	
	--Small Mushroom
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:mycelium", "mcl_core:mycelium_snow"},
		sidelen = 80,
		fill_ratio = 0.0002,
		biomes = {"mooshroom", "mooshroom_cold"},
		y_min = -6000,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/mushroom_small.mts",
		flags = "place_center_x",
		rotation = "random",
	})	
	
	--Brown Mushroom
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"mcl_core:mycelium", "mcl_core:mycelium_snow"},
		sidelen = 80,
		fill_ratio = 0.002,
		biomes = {"mooshroom", "mooshroom_cold"},
		y_min = -6000,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/mushroom_brown.mts",
		flags = "place_center_x",
		rotation = "random",
	})

		--Brown Mushroom
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = { "mcl_core:dirt_with_grass"},
		sidelen = 50,
		fill_ratio = 0.0002,
		biomes = { "deciduous_forest"},
		y_min = -6000,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_portals").."/schematics/mushroom_brown.mts",
		flags = "place_center_x",
		rotation = "random",
	})
	
	


	-- Dry shrub

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:redsand", "mcl_core:dirt_with_grass_snow","color:hardened_clay_brown", "mcl_core:coarse_dirt"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.02,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert", "tundra","mesa", "savanna"},
		y_min = 2,
		y_max = 31000,
		decoration = "mcl_core:deadbush",
	})



	
	
--stones
	
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:podzol"},
		sidelen = 80,
		fill_ratio = 0.004,
		biomes = {"tiaga"},
		y_min = 10,
		y_max = 31000,
		decoration = "mcl_core:mossycobble",
	})	

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_core:dirt_with_grass"},
		sidelen = 80,
		fill_ratio = 0.0002,
		--biomes = {"tiaga"},
		y_min = 20,
		y_max = 31000,
		decoration = "mcl_core:cobble",
	})	
	
	--Nether Decorations
	--Red Mushroom
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_nether:netherrack"},
		sidelen = 80,
		fill_ratio = 0.4,
		biomes = {"underground"},
		y_min = -6000,
		y_max = 31000,
		decoration = "mcl_mushrooms:mushroom_red",
	})
	--Brown Mushroom
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_nether:netherrack"},
		sidelen = 80,
		fill_ratio = 0.3,
		biomes = {"underground"},
		y_min = -6000,
		y_max = 31000,
		decoration = "mcl_mushrooms:mushroom_brown",
	})
	--Fire
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_nether:netherrack"},
		sidelen = 8,
		fill_ratio = 0.9,
		biomes = {"underground"},
		y_min = -6000,
		y_max = 31000,
		decoration = "fire:eternal_flame",
	})
	--Wart
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_nether:soul_sand"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"underground"},
		y_min = -6000,
		y_max = 31000,
		decoration = "mcl_nether:nether_wart",
	})
	

--mc2 flowers

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
		place_on = {"mcl_core:dirt_with_grass", "mcl_core:podzol"},
		sidelen = 8,
		noise_params = {
			offset = -0.01,
			scale = 0.03,
			spread = {x = 50, y = 50, z = 50},
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
		--spawn_by = { "mcl_core:jungletree", "mcl_core:pine_tree", "mcl_flowers:fern" },
		--num_spawn_by = 1,
		place_on = { "mcl_core:podzol", "mcl_core:dirt_with_rainforest_litter"},

		sidelen = 16,
		noise_params = {
			offset = -0.01,
			scale = 0.03,
			spread = {x = 60, y = 60, z = 60},
			seed = 333,
			octaves = 2,
			persist = 0.66,
		},
		y_min = 1,
		y_max = 75,
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
		place_on = {"mcl_core:dirt_with_grass", "mcl_core:podzol", "mcl_core:coarse_dirt"},
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
		place_on = {"mcl_core:dirt_with_grass", "mcl_core:podzol", "mcl_core:coarse_dirt"},
		sidelen = 8,
		fill_ratio = 0.01,
		y_min = 1,
		y_max = 50,
		decoration = "mcl_flowers:tallgrass",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"mcl_end:end_stone"},
		sidelen = 8,
		fill_ratio = 0.01,
		y_min = -7000,
		y_max = -6000,
		decoration = "mcl_core:chorus_flower",
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
				spread = {x = 400, y = 400, z = 400},
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



	
end

--
-- Detect mapgen to select functions
--

-- Mods using singlenode mapgen can call these functions to enable
-- the use of minetest.generate_ores or minetest.generate_decorations

local mg_params = minetest.get_mapgen_params()
if mg_params.mgname == "v6" then
	mcl_portals.register_ores()
	--mcl_portals.register_mgv6_decorations()
elseif mg_params.mgname ~= "singlenode" then
	mcl_portals.register_biomes()
	mcl_portals.register_ores()
	mcl_portals.register_decorations()
end


--
-- Detect mapgen to select functions  newest
--

local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name == "v6" then
	mcl_portals.register_ores()
	--mcl_portals.register_mgv6_decorations()
else
	mcl_portals.register_biomes()
	mcl_portals.register_ores()
	mcl_portals.register_decorations()
end



--bedrock code

local function replace(old, new, min, max)
	for i=1,8 do
		minetest.register_ore({
			ore_type       = "scatter",
			ore            = new,
			wherein        = old,
			clust_scarcity = 1,
			clust_num_ores = 1,
			clust_size     = 1,
			y_min     = min,
			y_max     = max,
		})
	end
end




--the -64 bedrock
replace("air", "mcl_core:bedrock", -80, -64)
replace("air", "mcl_core:lava_source", -64, -58)
replace("mcl_core:stone", "mcl_core:bedrock", -80, -64)
replace("mcl_core:gravel", "mcl_core:bedrock", -80, -64)
replace("mcl_core:dirt", "mcl_core:bedrock", -80, -64)
replace("mcl_core:sand", "mcl_core:bedrock", -80, -64)
replace("mcl_core:cobble", "mcl_core:bedrock", -80, -64)
replace("mcl_core:desert_cobble", "mcl_core:bedrock", -80, -64)
replace("mcl_core:mossycobble", "mcl_core:bedrock", -80, -64)
replace("stairs:stair_cobble", "mcl_core:bedrock", -80, -64)
replace("mcl_core:lava_source", "mcl_core:bedrock", -80, -64)
replace("mcl_core:lava_flowing", "mcl_core:bedrock", -80, -64)
replace("mcl_core:water_source", "mcl_core:bedrock", -80, -64)
replace("mcl_core:water_flowing", "mcl_core:bedrock", -80, -64)
replace("mcl_core:sandstone", "mcl_core:bedrock", -80, -64)
replace("mcl_core:redsandstone", "mcl_core:bedrock", -80, -64)
replace("mcl_core:redsand", "mcl_core:bedrock", -80, -64)
replace("mcl_core:stone_with_gold", "mcl_core:bedrock", -80, -64)
replace("mcl_core:stone_with_diamond", "mcl_core:bedrock", -80, -64)
replace("mcl_core:stone_with_iron", "mcl_core:bedrock",  -80, -64)
replace("mcl_core:stone_with_mese", "mcl_core:bedrock",  -80, -64)
replace("mcl_core:stone_with_coal", "mcl_core:bedrock", -80, -64)
replace("default:granite", "mcl_core:bedrock", -80, -64)
replace("mcl_colorblocks:hardened_clay_orange", "mcl_core:bedrock", -80, -64)

--lava delete
replace("mapgen_lava_source_lava_flowing", "mcl_end:end_stone", -6900, -5400)
replace("mcl_core:lava_flowing", "mcl_end:end_stone", -6900, -5400)
replace("mapgen_air", "mcl_end:end_stone", -6900, -5400)
replace("mapgen_lava_source_lava_source", "mcl_end:end_stone", -6900, -5400)
replace("mcl_core:lava_source", "mcl_end:end_stone", -6900, -5400)

--dungeon swap
replace("mcl_core:cobblestone", "mcl_nether:nether_brick", -3900, -2400)
replace("mcl_core:mossycobble", "mcl_nether:nether_brick", -3900, -2400)
replace("stairs:stair_cobble", "stairs:stair_nether_brick", -3900, -2400)
replace("stairs:stair_mossycobble", "stairs:stair_nether_brick", -3900, -2400)

replace("mcl_core:cobblestone", "mcl_end:purpur_block", -6900, -4400)
replace("mcl_core:mossycobble", "mcl_end:purpur_block", -6900, -4400)
replace("stairs:stair_cobble", "stairs:stair_purpur_block", -6900, -4400)
replace("stairs:stair_mossycobble", "stairs:stair_purpur_block", -6900, -4400)


local function bedrock(old)
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mcl_core:bedrock",
		wherein        = old,
		clust_scarcity = 5,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min     = -64,
		y_max     = -60,
	})
end
bedrock("air")
bedrock("mcl_core:stone")
bedrock("mcl_core:redsandstone")
bedrock("mcl_core:gravel")
bedrock("mcl_core:dirt")
bedrock("mcl_core:sand")
bedrock("mcl_core:redsand")
bedrock("mcl_core:cobble")
bedrock("mcl_core:mossycobble")
bedrock("stairs:stair_cobble")
bedrock("mcl_core:lava_source")
bedrock("mcl_core:lava_flowing")
bedrock("mcl_core:water_source")
bedrock("mcl_core:water_flowing")

