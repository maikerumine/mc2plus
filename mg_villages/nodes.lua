
minetest.register_node("mg_villages:road", {
	description = "village road",
	tiles = {"default_gravel.png", "default_dirt.png"},
        is_ground_content = false, -- will not be removed by the cave generator
	stack_max = 64,
        groups = {handy=1,shovely=1, building_block=1, material_sand=1},
	sounds = mcl_sounds.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.45},
	}),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 0.6,
	paramtype  = "light",
	paramtype2 = "facedir",
	drawtype   = "nodebox",
	node_box = {
		type = "fixed",
		fixed = { { -0.5, -0.5, -0.5, 0.5, 0.5-2/16, 0.5}, },
		},
})

mg_villages.road_node = minetest.get_content_id( 'mg_villages:road' );
-- do not drop snow on roads
if( moresnow ) then
	moresnow.snow_cover[ mg_villages.road_node ] = moresnow.c_air;
end


minetest.register_node("mg_villages:soil", {
	description = "Soil found on a field",
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png"},
	drop = "mcl_core:dirt",
	is_ground_content = true,
	stack_max = 64,
	groups = {handy=1,shovely=1, soil=1, soil_sugarcane=1, cultivatable=1, building_block=1},
	sounds = mcl_sounds.node_sound_dirt_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 0.5,
})

minetest.register_node("mg_villages:desert_sand_soil", {
	description = "Desert Sand",
	tiles = {"mcl_core_red_sand.png^farming_soil_wet.png", "mcl_core_red_sand.png"},
	is_ground_content = true,
	drop   = "mcl_core:desert_sand",
	stack_max = 64,
	groups = {handy=1,shovely=1,not_in_creative_inventory = 1, falling_node=1, sand=1, soil_sugarcane=1, building_block=1, material_sand=1},
	sounds = mcl_sounds.node_sound_sand_defaults(),
	_mcl_blast_resistance = 2.5,
	_mcl_hardness = 0.5,
})


if( mg_villages.USE_mcl_core_3D_TORCHES == false ) then
	-- This torch is not hot. It will not melt snow and cause no floodings in villages.
	minetest.register_node("mg_villages:torch", {
		description = "Torch",
		drawtype = "torchlike",
		--tiles = {"mcl_core_torch_on_floor.png", "mcl_core_torch_on_ceiling.png", "mcl_core_torch.png"},
		tiles = {
			{name="mcl_core_torch_on_floor_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
			{name="mcl_core_torch_on_ceiling_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
			{name="mcl_core_torch_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
		},
		inventory_image = "mcl_core_torch_on_floor.png",
		wield_image = "mcl_core_torch_on_floor.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		light_source = LIGHT_MAX-1,
		selection_box = {
			type = "wallmounted",
			wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
			wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
			wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
		},
		groups = {choppy=2,dig_immediate=3,flammable=1,attached_node=1},
		legacy_wallmounted = true,
		mcl_sounds.node_sound_wood_defaults(),
		drop   = "mcl_torches:torch",
	})
end


minetest.register_node("mg_villages:plotmarker", {
	description = "Plot marker",
	drawtype = "nodebox",
	tiles = {"default_stone_brick.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5+2/16, -0.5, -0.5+2/16,  0.5-2/16, -0.5+3/16, 0.5-2/16},
		},
	},
	stack_max = 64,
	groups = {pickaxey=1, redsandstone=1, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 4,
	_mcl_hardness = 0.8,

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


-- mcl_core to safe lava
if( not( mg_villages.use_normal_unsafe_lava )) then
	local lava = minetest.registered_nodes[ "mcl_core:lava_source"];
	if( lava ) then
		-- a deep copy for the table would be more helpful...but, well, ...
		local new_def = minetest.deserialize( minetest.serialize( lava ));
		-- this lava does not cause fire to spread
		new_def.name           = nil;
		new_def.groups.lava    = nil;
		new_def.groups.hot     = nil;
		new_def.groups.igniter = nil;
		new_def.groups.lava_tamed = 3;
		new_def.description = "Lava Source (tame)";
		new_def.liquid_alternative_flowing = "mg_villages:lava_flowing_tamed";
		new_def.liquid_alternative_source = "mg_villages:lava_source_tamed";
		-- we create a NEW type of lava for this
		minetest.register_node( "mg_villages:lava_source_tamed", new_def );
	end
	
	-- take care of the flowing variant as well
	lava = minetest.registered_nodes[ "mcl_core:lava_flowing"];
	if( lava ) then
		-- a deep copy for the table would be more helpful...but, well, ...
		local new_def = minetest.deserialize( minetest.serialize( lava ));
		-- this lava does not cause fire to spread
		new_def.name           = nil;
		new_def.groups.lava    = nil;
		new_def.groups.hot     = nil;
		new_def.groups.igniter = nil;
		new_def.groups.lava_tamed = 3;
		new_def.description = "Flowing Lava (tame)";
		new_def.liquid_alternative_flowing = "mg_villages:lava_flowing_tamed";
		new_def.liquid_alternative_source = "mg_villages:lava_source_tamed";
		-- and a NEW type of flowing lava...
		minetest.register_node( "mg_villages:lava_flowing_tamed", new_def );
	end
end
