xdecor = {}

-- GUI related stuff
xdecor.gui_bg = "bgcolor[#080808BB;true]"
xdecor.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
xdecor.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"

function xdecor.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

xdecor.gui_survival_form = "size[8,8.5]"..
			xdecor.gui_bg..
			xdecor.gui_bg_img..
			xdecor.gui_slots..
			"list[current_player;main;0,4.25;8,1;]"..
			"list[current_player;main;0,5.5;8,3;8]"..
			"list[current_player;craft;1.75,0.5;3,3;]"..
			"list[current_player;craftpreview;5.75,1.5;1,1;]"..
			"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			xdecor.get_hotbar_bg(0,4.25)

-- Load files
local xdecor_path = minetest.get_modpath("xdecor")

local function get_formspec_by_size(size)
	local formspec = xdecor_inventory_formspecs[tostring(size)]
	return formspec or xdecor_inventory_formspecs
end

local default_can_dig = function(pos)
	local inv = minetest.get_meta(pos):get_inventory()
	return inv:is_empty("main")
end	
--[[
local default_can_dig = function(pos)
	local inv = minetest.get_meta(pos):get_inventory()
	return inv:is_empty("main")
end
]]
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
		--def.can_dig = def.can_dig or default_can_dig   --was default?
		def.can_dig = def.can_dig or default_can_dig   --was default?
	elseif infotext and not def.on_construct then
		def.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", infotext)
		end
	end

	minetest.register_node("xdecor:"..name, def)
end
