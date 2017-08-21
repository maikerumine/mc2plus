mc_biomes = {}
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

-- Rarely replace stone with stone monster eggs
local monster_egg_scarcity
if mg_name == "v6" then
	monster_egg_scarcity = 28 * 28 * 28
else
	monster_egg_scarcity = 22 * 22 * 22
end
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_monster_eggs:monster_egg_stone",
	wherein        = "mcl_core:stone",
	clust_scarcity = monster_egg_scarcity,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = 31000,
	-- TODO: Limit by biome
})



--
-- Register ores
--

-- All mapgens except singlenode
-- Blob ore first to avoid other ores inside blobs

function mc_biomes.register_ores()
--move to deco?
--[[
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

--Move to add deco?

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
]]
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
	ore            = "mcl_colorblocks:hardened_clay_black",
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
		wherein         = {"mcl_nether:netherrack", "mc_biomes:nether_air"},
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
		wherein         = {"mcl_core:void", "mcl_core:end_stone","mcl_core:stone","air","ignore", "mc_biomes:void"},
		clust_scarcity  = 30 * 30 * 30,  	--was26
		clust_size      = 17,				--was5
		y_min           = -5750,
		y_max           = -5701,
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
		ore_type        = "scatter",
		ore             = "mcl_end:end_stone",
		wherein         = {"mcl_core:void", "mcl_core:end_stone","mcl_core:stone","air","ignore", "mc_biomes:void"},
		clust_scarcity  = 30 * 30 * 30,  	--was26
		clust_size      = 34,				--was5
		y_min           = -5780,
		y_max           = -5711,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.1,
			spread = {x = 70, y = 15, z = 70},
			seed = 16,
			octaves = 1,
			persist = 0.0
		},
	})


	
end