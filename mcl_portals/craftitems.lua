--mcl_portals = {}

--node override
--minetest.after(1, function()
minetest.override_item("mcl_core:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	is_ground_content = false,
	stack_max = 64,
	--groups = {handy=1,pickaxey=5, building_block=1, material_stone=1},
	--_mcl_blast_resistance = 6000,
	--_mcl_hardness = 50,
	
	on_destruct = function(pos)
		local meta = minetest.get_meta(pos)
		local p1 = minetest.string_to_pos(meta:get_string("p1"))
		local p2 = minetest.string_to_pos(meta:get_string("p2"))
		local target = minetest.string_to_pos(meta:get_string("target"))
		if not p1 or not p2 then
			return
		end

		for x = p1.x, p2.x do
		for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			local nn = minetest.get_node({x = x, y = y, z = z}).name
			if nn == "mcl_core:obsidian" or nn == "mcl_portals:portal" then
				if nn == "mcl_portals:portal" then
					minetest.remove_node({x = x, y = y, z = z})
				end
				local m = minetest.get_meta({x = x, y = y, z = z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target", "")
			end
		end
		end
		end

		meta = minetest.get_meta(target)
		if not meta then
			return
		end
		p1 = minetest.string_to_pos(meta:get_string("p1"))
		p2 = minetest.string_to_pos(meta:get_string("p2"))
		if not p1 or not p2 then
			return
		end

		for x = p1.x, p2.x do
		for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			local nn = minetest.get_node({x = x, y = y, z = z}).name
			if nn == "mcl_core:obsidian" or nn == "mcl_portals:portal" then
				if nn == "mcl_portals:portal" then
					minetest.remove_node({x = x, y = y, z = z})
				end
				local m = minetest.get_meta({x = x, y = y, z = z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target", "")
			end
		end
		end
		end
	end,
})
--end)

--minetest.after(1, function()
minetest.override_item("mcl_core:emeraldblock", {
	description = "Emerald Block",
	tiles = {"mcl_core_emerald_block.png"},
	is_ground_content = false,
	stack_max = 64,
	--groups = {pickaxey=4, building_block=1},
	--_mcl_blast_resistance = 30,
	--_mcl_hardness = 5,

	on_destruct = function(pos)
		local meta = minetest.get_meta(pos)
		local p1 = minetest.string_to_pos(meta:get_string("p1"))
		local p2 = minetest.string_to_pos(meta:get_string("p2"))
		local target2 = minetest.string_to_pos(meta:get_string("target2"))
		if not p1 or not p2 then
			return
		end

		for x = p1.x, p2.x do
		for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			local nn = minetest.get_node({x = x, y = y, z = z}).name
			if nn == "mcl_core:emeraldblock" or nn == "mcl_portals:portal2" then
				if nn == "mcl_portals:portal2" then
					minetest.remove_node({x = x, y = y, z = z})
				end
				local m = minetest.get_meta({x = x, y = y, z = z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target2", "")
			end
		end
		end
		end

		meta = minetest.get_meta(target2)
		if not meta then
			return
		end
		p1 = minetest.string_to_pos(meta:get_string("p1"))
		p2 = minetest.string_to_pos(meta:get_string("p2"))
		if not p1 or not p2 then
			return
		end

		for x = p1.x, p2.x do
		for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			local nn = minetest.get_node({x = x, y = y, z = z}).name
			if nn == "mcl_core:emeraldblock" or nn == "mcl_portals:portal2" then
				if nn == "mcl_portals:portal2" then
					minetest.remove_node({x = x, y = y, z = z})
				end
				local m = minetest.get_meta({x = x, y = y, z = z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target2", "")
			end
		end
		end
		end
	end,
})
--end)

--minetest.after(1, function()
minetest.override_item("mcl_end:purpur_block", {
	description = "Purpur Block",
	tiles = {"mcl_end_purpur_block.png"},
	is_ground_content = false,
	stack_max = 64,
	--groups = {pickaxey=5, building_block=1, material_stone=1},
	--_mcl_blast_resistance = 6000,
	--_mcl_hardness = 50,

	on_destruct = function(pos)
		local meta = minetest.get_meta(pos)
		local p1 = minetest.string_to_pos(meta:get_string("p1"))
		local p2 = minetest.string_to_pos(meta:get_string("p2"))
		local target3 = minetest.string_to_pos(meta:get_string("target3"))
		if not p1 or not p2 then
			return
		end

		for x = p1.x, p2.x do
		for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			local nn = minetest.get_node({x = x, y = y, z = z}).name
			if nn == "mcl_end:purpur_block" or nn == "mcl_portals:end_portal" then
				if nn == "mcl_portals:end_portal" then
					minetest.remove_node({x = x, y = y, z = z})
				end
				local m = minetest.get_meta({x = x, y = y, z = z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target3", "")
			end
		end
		end
		end

		meta = minetest.get_meta(target3)
		if not meta then
			return
		end
		p1 = minetest.string_to_pos(meta:get_string("p1"))
		p2 = minetest.string_to_pos(meta:get_string("p2"))
		if not p1 or not p2 then
			return
		end

		for x = p1.x, p2.x do
		for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			local nn = minetest.get_node({x = x, y = y, z = z}).name
			if nn == "mcl_end:purpur_block" or nn == "mcl_portals:end_portal" then
				if nn == "mcl_portals:end_portal" then
					minetest.remove_node({x = x, y = y, z = z})
				end
				local m = minetest.get_meta({x = x, y = y, z = z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target3", "")
			end
		end
		end
		end
	end,
})
--end)



	
-- Flint and steel
--minetest.after(1, function()
minetest.override_item("mcl_fire:flint_and_steel", {
	description = "Flint and Steel",
	_doc_items_longdesc = "Flint and steel is a tool to start fires and ignite blocks.",
	_doc_items_usagehelp = "Rightclick the surface of a block to attempt to light a fire in front of it. On netherrack it will start an eternal fire. Using it on TNT will ignite it.",
	inventory_image = "mcl_fire_flint_and_steel.png",
	liquids_pointable = false,
	stack_max = 1,
	groups = { tool = 1 },	
	on_place = function(itemstack, user, pointed_thing)
		local idef = itemstack:get_definition()
		minetest.sound_play(
			"fire_flint_and_steel",
			{pos = pointed_thing.above, gain = 0.5, max_hear_distance = 8}
		)
		local used = false
		
		if pointed_thing.under and minetest.get_node(pointed_thing.under).name == "mcl_core:obsidian" then
			done = make_portal(pointed_thing.under)
		else
			if pointed_thing.type == "node" then
				local nodedef = minetest.registered_nodes[minetest.get_node(pointed_thing.under).name]
				if nodedef._on_ignite then
					nodedef._on_ignite(pointed_thing.under, user)
				else
					mcl_fire.set_fire(pointed_thing)
				end
				used = true
			end
		end
		if itemstack:get_count() == 0 and idef.sound and idef.sound.breaks then
			minetest.sound_play(idef.sound.breaks, {pos=user:getpos(), gain=0.5})
		end
		if not minetest.setting_getbool("creative_mode") and used == true then
			itemstack:add_wear(65535/65) -- 65 uses
		end
		return itemstack
	end,
	sound = { breaks = "default_tool_breaks" },	
	
})
--end)


--REF
--[[
-- Nether and Realm Craftitems
minetest.override_item(":default:mese_crystal_fragment", {
	description = "Mese Crystal Fragment",
	inventory_image = "default_mese_crystal_fragment.png",
	on_place = function(stack, _, pt)
		if pt.under and minetest.get_node(pt.under).name == "default:obsidian" then
			local done = make_portal(pt.under)
			if done and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
			end
		end

		return stack
	end,
})
]]
--local node_under = minetest.get_node(pt.under).name

--Emerald Realm
--minetest.after(1, function()
minetest.override_item("mcl_core:emerald", {
	description = "Emerald",
	_doc_items_longdesc = "Emeralds are not very useful on their own, but many villagers have a love for emeralds and often use it as a currency in trading.",
	inventory_image = "mcl_core_emerald.png",
	groups = { tool = 1, craftitem=1 },
	stack_max = 64,
	on_place = function(itemstack, user, pointed_thing)
		--local node_under = minetest.get_node(pt.under).name  --old
		local nodedef = minetest.registered_nodes[minetest.get_node(pointed_thing.under).name]  --new

		minetest.sound_play(
			"fire_flint_and_steel",
			{pos = pointed_thing.above, gain = 0.5, max_hear_distance = 8}
		)
		if pointed_thing.under and minetest.get_node(pointed_thing.under).name == "mcl_core:emeraldblock" then
			done2 = make_portal2(pointed_thing.under)
		end

		if not minetest.setting_getbool("creative_mode") and used == true then
			itemstack:take_item()-- 1 uses
		end
		return itemstack
	end,
})
--end)


--The End [temp realm]
--minetest.after(1, function()
minetest.override_item("mcl_nether:quartz", {
	description = "Nether Quartz",
	_doc_items_longdesc = "Nether quartz is a versatile crafting ingredient.",
	inventory_image = "mcl_nether_quartz.png",
	groups = { tool = 1, craftitem=1 },
	stack_max = 64,
	--end
	
on_place = function(itemstack, user, pointed_thing)
		--local node_under = minetest.get_node(pt.under).name  --old
		local nodedef = minetest.registered_nodes[minetest.get_node(pointed_thing.under).name]  --new

		minetest.sound_play(
			"fire_flint_and_steel",
			{pos = pointed_thing.above, gain = 0.5, max_hear_distance = 8}
		)
		if pointed_thing.under and minetest.get_node(pointed_thing.under).name == "mcl_end:purpur_block" then
			done3 = make_end_portal(pointed_thing.under)
		end

		if not minetest.setting_getbool("creative_mode") and used == true then
			itemstack:take_item()-- 1 uses
		end
		return itemstack
	end,
	

})
--end)


