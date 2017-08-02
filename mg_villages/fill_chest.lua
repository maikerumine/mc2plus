-- adapted from the Mines mod

local chest_stuff = {
	{name="default:apple", max = 3},
	{name="farming:bread", max = 3},
	{name="default:steel_ingot", max = 2},
	{name="default:gold_ingot", max = 2},
	{name="default:axe_steel", max = 1},
	{name="mcl_core:emerald", max = 5},
	{name="default:pick_steel", max = 1},
	{name="default:shovel_steel", max = 1},
	{name="default:book", max = 3},
	{name="default:torch", max = 13},
	{name="default:stick", max = 7},
	{name="default:coal_lump", max = 4},
	{name="bucket:bucket_empty", max = 1},
	{name="default:ladder", max = 10},
	{name="3d_armor:helmet_iron", max = 1},
	{name="vessels:glass_bottle", max = 1},
	{name="mcl_wool:white", max = 11},
	{name="mcl_wool:white_carpet", max = 11},
	{name="mcl_nether:quartz", max = 5},
	{name="mobs:shears", max = 1},
	{name="mcl_farming:melon_seeds", max = 18},
	{name="mobs:saddle", max = 3},
}

-- get some random content for a chest
mg_villages.fill_chest_random = function( pos, pr, building_nr, building_typ )
	local meta = minetest.get_meta( pos )
	local inv  = meta:get_inventory()
	inv:set_size("main", 8*4)
	for i=0,pr:next(1,6),1 do
		local stuff = chest_stuff[pr:next(1,#chest_stuff)]
		local stack = {name=stuff.name, count = pr:next(1,stuff.max)}
		if not inv:contains_item("main", stack) then
			inv:set_stack("main", pr:next(1,32), stack)
		end
	end
end

