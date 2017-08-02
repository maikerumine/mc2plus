
minetest.register_node("mg_villages:road", {
	description = "village road",
	_doc_items_longdesc = "Used to be a village road, now a Grass path.  Grass paths are a decorational variant of grass blocks. Their top has a different color and they are a bit lower than grass blocks, making them useful to build footpaths. Grass paths can be created with a shovel. A grass path turns into dirt when it is below a solid block.",

	--tiles = {"default_gravel.png", "default_dirt.png"},
	tiles = {"mcl_core_grass_path_top.png", "default_dirt.png", "mcl_core_grass_path_side.png"},
        is_ground_content = false, -- will not be removed by the cave generator
	stack_max = 64,
	drop = 'mcl_core:dirt',
	groups = {handy=1,shovely=1, cultivatable=2, enderman_takable=1, building_block=1},
	sounds = mcl_sounds.node_sound_dirt_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 0.5,
})

mg_villages.road_node = minetest.get_content_id( 'mcl_core:grass_path' );


minetest.register_node("mg_villages:soil", {
	description = "Soil found on a field",
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png"},
	drop = 'mcl_core:dirt',
	sounds = mcl_sounds.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
	stack_max = 64,
	groups = {handy=1,shovely=1, soil=1, soil_sapling=2, soil_sugarcane=1, cultivatable=2, enderman_takable=1, building_block=1},
	sounds = mcl_sounds.node_sound_dirt_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 0.5,
})

minetest.register_node("mg_villages:desert_sand_soil", {
	description = "Desert Sand",
	tiles = {"default_sand.png^farming_soil_wet.png", "default_sand.png"},
	is_ground_content = true,
	drop   = "mcl_core:sand",
	stack_max = 64,
	groups = {handy=1,shovely=1, falling_node=1, sand=1, soil_sugarcane=1, enderman_takable=1, building_block=1, material_sand=1},
	sounds = mcl_sounds.node_sound_sand_defaults(),
})

--[[
-- This torch is not hot. It will not melt snow and cause no floodings in villages.
minetest.register_node("mg_villages:torch", {
	description = "Torch-village",
	drawtype = "torchlike",
	--tiles = {"default_torch_on_floor.png", "default_torch_on_ceiling.png", "default_torch.png"},
	tiles = {
		{name="default_torch_on_floor_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		--{name="default_torch_on_ceiling_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		--{name="default_torch_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		--{name="default_torch_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = 14,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {dig_immediate=3, torch=1, deco_block=1},
	legacy_wallmounted = true,
	mcl_sounds.node_sound_wood_defaults(),
	drop   = "mcl_torches:torch",
})
]]
--[[
minetest.register_node("mg_villages:plotmarker", {
	description = "Plot marker",
	drawtype = "nodebox",
	tiles = {"default_stone_brick.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5+2/16, -0.5, -0.5+2/16,  0.5-2/16, -0.5+2/16, 0.5-2/16},
		},
	},
	groups = {cracky=3,stone=2},

	on_rightclick = function( pos, node, clicker, itemstack, pointed_thing)
		return mg_villages.plotmarker_formspec( pos, nil, {}, clicker )
	end,

	on_receive_fields = function(pos, formname, fields, sender)
		return mg_villages.plotmarker_formspec( pos, formname, fields, sender );
	end,

	-- protect against digging
	can_dig = function( pos, player )
			local meta = minetest.get_meta( pos );
			if( meta and meta:get_string( 'village_id' )~='' and meta:get_int( 'plot_nr' ) and meta:get_int( 'plot_nr' )>0) then
				return false;
			end
			return true;
		end
})
]]
