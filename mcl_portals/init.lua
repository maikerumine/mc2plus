-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into game_api.txt

-- Definitions made by this mod that other mods can use too
mcl_portals = {}


minetest.register_alias("default:particle", "mcl_portals:particle")
minetest.register_alias("default:portal", "mcl_portals:portal")
minetest.register_alias("default:portal2", "mcl_portals:portal2")
minetest.register_alias("default:end_portal", "mcl_portals:end_portal")
		
			
-- Load files

dofile(minetest.get_modpath("mcl_portals").."/nodes.lua")

dofile(minetest.get_modpath("mcl_portals").."/craftitems.lua")

--dofile(minetest.get_modpath("mcl_portals").."/mapgen.lua")

dofile(minetest.get_modpath("mcl_portals").."/portal.lua")
dofile(minetest.get_modpath("mcl_portals").."/portal2.lua")
dofile(minetest.get_modpath("mcl_portals").."/portal3.lua")



