mcl_portals = {}



-- Nether and Realm Craftitems
minetest.register_craftitem(":mcl_core:emerald", {
	description = "Emerald",
	inventory_image = "mcl_core_emerald.png",
	on_rightclick = function(stack, _, pt)
		if pt.under and minetest.get_node(pt.under).name == ":mcl_core:emeraldblock" then
			local done2 = make_portal2(pt.under)
			if done2 and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
			end
		end

		return stack
	end,
})


--from mineclone:

--[[
-- Flint and Steel
minetest.register_tool("mcl_fire:flint_and_steel", {
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
		if pointed_thing.type == "node" then
			local nodedef = minetest.registered_nodes[minetest.get_node(pointed_thing.under).name]
			if nodedef._on_ignite then
				nodedef._on_ignite(pointed_thing.under, user)
			else
				mcl_fire.set_fire(pointed_thing)
			end
			used = true
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
]]

-- Flint and steel
minetest.register_tool(":mcl_fire:flint_and_steel", {
	description = "Flint and Steel",
	inventory_image = "mcl_fire_flint_and_steel.png",
	on_use = function(itemstack, user, pointed_thing)
		itemstack:add_wear(1000)
		local pt = pointed_thing
		if pt.type == "node" then
			local node_under = minetest.get_node(pt.under).name
			local is_coalblock = node_under == "mcl_core:coalblock"
			local is_rack = node_under == "mcl_nether:rack"
			local is_tnt = node_under == "mcl_tnt:tnt"
			local is_gunpowder = node_under == "mcl_mobitems:gunpowder"
			if minetest.get_item_group(node_under, "flammable") >= 1 or
					is_coalblock or is_rack or is_tnt or is_gunpowder then
				local flame_pos = pt.above
				if is_coalblock then
					flame_pos = {x = pt.under.x, y = pt.under.y + 1, z = pt.under.z}
				elseif is_tnt or is_gunpowder then
					flame_pos = pt.under
				end
				if minetest.get_node(flame_pos).name == "air" or
						is_tnt or is_gunpowder then
					local player_name = user:get_player_name()
					if not minetest.is_protected(flame_pos, player_name) then
						if is_coalblock then
							minetest.set_node(flame_pos,
								{name = "mcl_fire:eternal_fire"})
						elseif is_rack then
							minetest.set_node(flame_pos,
								{name = "mcl_fire:eternal_fire"})
						elseif is_tnt then
							minetest.set_node(flame_pos,
								{name = "mcl_tnt:tnt_burning"})
						elseif is_gunpowder then
							minetest.set_node(flame_pos,
								{name = "mcl_tnt:gunpowder_burning"})
						else
							minetest.set_node(flame_pos,
								{name = "mcl_fire:fire"})
						end
					else
						minetest.chat_send_player(player_name, "This area is protected")
					end
				end
			end
		end
		if not minetest.setting_getbool("creative_mode") then
			return itemstack
		end
	end,
	--nether
	on_place = function(stack,_, pt)
		if pt.under and minetest.get_node(pt.under).name == ":mcl_core:obsidian" then
			done = make_portal(pt.under)  --broken please fix for y
			if done and not minetest.setting_getbool("creative_mode") then
				--stack:take_item()
				stack:add_wear(1000)
			end
		end
		return stack
	end,
	on_rightclick = function(stack,_, pt)
		if pt.under and minetest.get_node(pt.under).name == ":mcl_core:obsidian" then
			done = make_portal(pt.under)  --broken please fix for y
			if done and not minetest.setting_getbool("creative_mode") then
				--stack:take_item()
				stack:add_wear(1000)
			end
		end
		return stack
	end,
	
	
})



--Quartz Crystal
minetest.register_craftitem(":mcl_nether:quartz", {
	description = "Quartz Crystal",
	inventory_image = "mcl_nether_quartz.png",
	stack_max = 64,
	--end
	on_rightclick = function(stack,_, pt)
		if pt.under and minetest.get_node(pt.under).name == ":mcl_end:purpur_block" then
			done3 = make_end_portal(pt.under)  --broken please fix for y
			if done3 and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
				--stack:add_wear(1000)
			end
		end
		return stack
	end,
})



