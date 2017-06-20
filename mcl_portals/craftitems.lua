
-- Nether and Realm Craftitems
minetest.register_craftitem(":mcl_core:emerald", {
	description = "Emerald",
	inventory_image = "mcl_core_emerald.png",
	on_place = function(stack, _, pt)
		if pt.under and minetest.get_node(pt.under).name == ":mcl_core:emeraldblock" then
			local done2 = make_portal2(pt.under)
			if done2 and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
			end
		end

		return stack
	end,
})

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
		if pt.under and minetest.get_node(pt.under).name == "mcl_core:obsidian" then
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
	on_place = function(stack,_, pt)
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



