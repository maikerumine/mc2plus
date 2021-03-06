mc_biomes = {}


minetest.register_alias("default:particle", "mc_biomes:particle")
minetest.register_alias("default:portal", "mc_biomes:portal")
minetest.register_alias("default:portal2", "mc_biomes:portal2")
minetest.register_alias("default:end_portal", "mc_biomes:end_portal")

minetest.register_alias("mcl_portals:void", "mc_biomes:void")
minetest.register_alias("mcl_portals:dummy", "mc_biomes:dummy")
minetest.register_alias("mcl_portals:nether_air", "mc_biomes:nether_air")
minetest.register_alias("mcl_portals:portal", "mc_biomes:portal")
minetest.register_alias("mcl_portals:portal2", "mc_biomes:portal2")
minetest.register_alias("mcl_portals:end_portal", "mc_biomes:end_portal")






-- ANTI GRIEF by rnd
-- Copyright 2016 rnd

----------------------------------------------------------------------------
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------


-- prevents placing of lava/liquid sources or buckets above 0


--water
--bucket:bucket_water

function prevent_place_above(name)

	local old_on_place=minetest.registered_craftitems[name];--.on_place;
	local old_after_place_node = minetest.registered_nodes[name];--.after_place_node;
	--after_place_node = func(pos, placer, itemstack, pointed_thing)
	
	if old_on_place and old_on_place.on_place then
		old_on_place=old_on_place.on_place;
		minetest.registered_craftitems[name].on_place=function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.above
			if pos.y< -2000 then
				minetest.log("action","ANTI GRIEF " .. placer:get_player_name() .. " tried to place " .. name .. " at " .. minetest.pos_to_string(pos));
				return itemstack
			else
				return old_on_place(itemstack, placer, pointed_thing)
			end
		end
	return;
	end

	if old_after_place_node then

		old_after_place_node=old_after_place_node.after_place_node
		
		local table = minetest.registered_nodes[name];
		local table2 = {}
		for i,v in pairs(table) do
			table2[i] = v
		end
		
		table2.after_place_node=function(pos, placer, itemstack, pointed_thing)
			--after_place_node = func(pos, placer, itemstack, pointed_thing)
			local pos = pointed_thing.above
			if pos.y< -2000 then
				minetest.log("action","ANTI GRIEF " .. placer:get_player_name() .. " tried to place " .. name .. " at " .. minetest.pos_to_string(pos));
				minetest.set_node(pos, {name = "air"});
				return itemstack
			end
		end
		
		
		minetest.register_node(":"..name, table2)
		return;
	end 
	
		
	return;
end
	

minetest.after(0,
function ()
prevent_place_above("bucket:bucket_water");
prevent_place_above("mcl_core:water_source");
prevent_place_above("bucket:bucket_lava");
prevent_place_above("mcl_core:lava_source");
end
)

-- added plzadam minitest code:
-- Global environment step function prevent building above 192
function on_step(dtime)
	-- print("on_step")
end
minetest.register_globalstep(on_step)

function on_placenode(pos, newnode, placer, oldnode, itemstack)
	if pos.y > 192 then
		minetest.env:set_node(pos, oldnode)
		return true
	end
end
minetest.register_on_placenode(on_placenode)


