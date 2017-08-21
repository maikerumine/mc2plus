--mc_biomes = {}

--MAIKERUMINES TESTING BIOMES



--
-- Register biomes
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

-- All mapgens except mgv6 and singlenode

--function mc_biomes.register_biomes(upper_limit)
-- All mapgens except mgv6, flat and singlenode
local function register_biomes()
	-- Icesheet

	minetest.register_biome({
		name = "icesheet",
		node_dust = "mcl_core:snowblock",
		node_top = "mcl_core:snowblock",
		depth_top = 1,
		node_filler = "mcl_core:snowblock",
		depth_filler = 3,
		node_stone = "mcl_core:packed_ice",
		node_water_top = "mcl_core:ice",
		depth_water_top = 10,
		--node_water = "",
		node_river_water = "mcl_core:ice",
		node_riverbed = "mcl_core:gravel",
		depth_riverbed = 2,
		y_min = -8,
		y_max = upper_limit,
		heat_point = 0,
		humidity_point = 73,  --was73
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
		heat_point = 0,
		humidity_point = 73,  --was73
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
		heat_point = 0,
		humidity_point = 40,  --was 40
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
		heat_point = 0,
		humidity_point = 40,  --was40
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
		heat_point = 0,
		humidity_point = 40,  --was 40
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
		heat_point = 26,
		humidity_point = 72,  --was 70
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
		heat_point = 26,
		humidity_point = 72,  --was 70
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
		heat_point = 13,
		humidity_point = 79,  --was 35
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
		heat_point = 13,
		humidity_point = 79,  --was 35
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
		heat_point = 26,
		humidity_point = 45,  --was 35
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
		heat_point = 26,
		humidity_point = 45,  --was 35
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
		heat_point = 26,
		humidity_point = 45,  --was 35
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
		heat_point = 47,
		humidity_point = 73,  --was 70
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
		heat_point = 47,
		humidity_point = 73,  --was 70
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
		heat_point = 47,
		humidity_point = 73,  --was 70
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
		heat_point = 33,
		humidity_point = 44,  --was 68
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
		heat_point = 33,
		humidity_point = 44,  --was 68
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
		heat_point = 33,
		humidity_point = 44,  --was 68
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
		heat_point = 64,
		humidity_point = 37,  --was 16
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
		heat_point = 64,
		humidity_point = 37,  --was 16
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
		heat_point = 57,
		humidity_point = 0,  --was 0
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
		heat_point = 57,
		humidity_point = 0,  --was 0
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
		heat_point = 26,
		humidity_point = 0,  --was 0
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
		heat_point = 26,
		humidity_point = 0,  --was 0
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
		heat_point = 88,
		humidity_point = 20,  --was 40
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
		heat_point = 50,
		humidity_point = 46,  --was 42
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
		heat_point = 50,
		humidity_point = 46,  --was 42
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
		heat_point = 50,
		humidity_point = 46,  --was 42
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
		heat_point = 90,
		humidity_point = 91,  --was 65
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
		heat_point = 90,
		humidity_point = 91,  --was 65
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
		heat_point = 90,
		humidity_point =  91,  --was 65
	})
	
--mooshroom
--hot
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
		y_min = 1,
		y_max = 20,
		heat_point = 99,
		humidity_point = 99,  --was 55
	})

	minetest.register_biome({
		name = "mooshroom_plateu",
		--node_dust = "",
		--node_top = "air",
		--depth_top = 1,
		--node_filler = "mcl_core:gravel",
		--depth_filler = 3,
		node_stone = "air",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:coarse_dirt",
		depth_riverbed = 2,
		y_min = 21,
		y_max = 31000,
		heat_point = 99,
		humidity_point = 99,  --was 55
	})

	minetest.register_biome({
		name = "mooshroom_ocean",
		--node_dust = "",
		node_top = "mcl_core:stone",
		depth_top = 1,
		node_filler = "mcl_core:gravel",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "mcl_core:coarse_dirt",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 0,
		heat_point = 99,
		humidity_point = 99,  --was 55
	})

	
	--cold
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
		heat_point = -13,
		humidity_point =  30,  --was 55
	})

	


	-- Underground

	minetest.register_biome({
		name = "underground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "",
		--depth_filler = ,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -31000,
		y_max = -10000,
		heat_point = 50,
		humidity_point = 50,
	})

	
	-- Underground
	--MAPGEN REALMS
	minetest.register_biome({
		name = "void_1",
		--node_dust = "",
		--node_top = "",
		--depth_top = 1,
		--node_filler = "mcl_core:dummy",
		--depth_filler = 3,
		node_stone =  "mcl_core:void",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -2989,
		y_max = -82,
		heat_point = 50,
		humidity_point = 50,
	})
	


	minetest.register_biome({
		name = "nether_roof",
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
		y_max = -2990,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "nether",
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
		y_min = -3369,
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
		y_max = -3370,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
	name = "nether_floor",
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
		y_min = -3430,
		y_max = -3400,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "void_2",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "mc_biomes:dummy",
		--depth_filler = ,
		node_stone =  "mcl_core:void",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -4900,
		y_max = -3431,
		heat_point = 50,
		humidity_point = 50,
	})	
	
	--====================
	--====================
	--====================
	--====================
	--realm 2
	minetest.register_biome({
		name = "water_worldsky",
		--node_dust = "",
		node_top = "mcl_end:purpur_block",
		depth_top =1 ,
		node_filler = "mc_biomes:void",
		depth_filler = 22 ,
		node_stone =  "mc_biomes:void",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5000,
		y_max = -4901,
		heat_point = 50,
		humidity_point = 50,
	})
	
	minetest.register_biome({
		name = "water_world",
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
		y_min = -5470,
		y_max = -5001,
		heat_point = 50,
		humidity_point = 50,
	})	
	
	minetest.register_biome({
		name = "water_worldseafloor",
		--node_dust = "",
		node_top = "mcl_core:dirt",
		depth_top = 12,
		node_filler = "mcl_core:sand",
		depth_filler = 1,
		node_stone =  "mcl_core:stone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5550,
		y_max = -5471,
		heat_point = 50,
		humidity_point = 50,
	})	

	minetest.register_biome({
		name = "water_worldfloor",
		node_dust = "mcl_core:dirt",
		node_top = "mcl_core:stone",
		depth_top = 5,
		node_filler = "mcl_core:bedrock",
		depth_filler = 3,
		node_stone =  "mcl_core:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5610,
		y_max = -5551,
		heat_point = 50,
		humidity_point = 50,
	})
	
	--================
	--================
	--================
	--================
	--realm 3  "end"
	minetest.register_biome({
		name = "end_sky",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		node_filler = "mc_biomes:void",
		--depth_filler = ,
		node_stone =  "mc_biomes:void",
		--node_water_top = "",
		--depth_water_top = ,
		node_water = "mcl_end:purpur_block",
		--node_river_water = "",
		y_min = -5999,
		y_max = -5611,
		heat_point = 50,
		humidity_point = 50,
	})
	
	minetest.register_biome({
		name = "end",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		node_filler = "mcl_end:end_stone",
		--depth_filler = ,
		node_stone =  "mc_biomes:void",
		--node_stone =  "air",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -6200,
		y_max = -6000,
		heat_point = 50,
		humidity_point = 50,
	})	

	minetest.register_biome({
		name = "void_3",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "mc_biomes:dummy",
		--depth_filler = ,
		node_stone =  "mcl_core:void",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -6700,
		y_max = -6201,
		heat_point = 50,
		humidity_point = 50,
	})	
	
	minetest.register_biome({
		name = "end_barrier",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		node_filler = "mcl_core:barrier",
		--depth_filler = ,
		node_stone =  "mcl_core:barrier",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -6800,
		y_max = -6701,
		heat_point = 50,
		humidity_point = 50,
	})

end

	
--
-- Detect mapgen to select functions
--
local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name ~= "v6" and mg_name ~= "flat" then
	minetest.clear_registered_biomes()
	--minetest.clear_registered_decorations()
	--minetest.clear_registered_schematics()
	register_biomes()
	--register_decorations()
elseif mg_name == "flat" then
	-- Implementation of Minecraft's Superflat mapgen, classic style
	minetest.clear_registered_biomes()
	--minetest.clear_registered_decorations()
	--minetest.clear_registered_schematics()
	register_classic_superflat_biome()
end



