
local function get_formspec_by_size(size)
	local formspec = xdecor_inventory_formspecs[tostring(size)]
	return formspec or xdecor_inventory_formspecs
end

local xdecor_can_dig = function(pos)
	local inv = minetest.get_meta(pos):get_inventory()
	return inv:is_empty("main")
end

function xdecor.register(name, def)
	def.drawtype = def.drawtype or (def.node_box and "nodebox")
	def.paramtype = def.paramtype or "light"
	def.sounds = def.sounds or xdecor.node_sound_xdecors()

	if not (def.drawtype == "normal" or def.drawtype == "signlike" or
			def.drawtype == "plantlike" or def.drawtype == "glasslike_framed" or
			def.drawtype == "glasslike_framed_optional") then
		def.paramtype2 = def.paramtype2 or "facedir"
	end

	if def.drawtype == "plantlike" or def.drawtype == "torchlike" or
			def.drawtype == "signlike" or def.drawtype == "fencelike" then
		def.sunlight_propagates = true
	end

	local infotext = def.infotext
	local inventory = def.inventory
	def.inventory = nil

	if inventory then
		def.on_construct = def.on_construct or function(pos)
			local meta = minetest.get_meta(pos)
			if infotext then meta:set_string("infotext", infotext) end

			local size = inventory.size or xdecor_inventory_size
			local inv = meta:get_inventory()
			inv:set_size("main", size)
			meta:set_string("formspec", (inventory.formspec or get_formspec_by_size(size))..xbg)
		end
		def.can_dig = def.can_dig or xdecor_can_dig   --was default?
	elseif infotext and not def.on_construct then
		def.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", infotext)
		end
	end

	minetest.register_node("xdecor:"..name, def)
end
