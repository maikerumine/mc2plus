
mcl_enchanting = {}
local modpath = minetest.get_modpath("mcl_enchanting")

--local enchanting = {}
enchanting = {}

--screwdriver = screwdriver or {}

-- Cost in Mese crystal(s) for enchanting.
local mese_cost = 1


-- GUI related stuff
mcl_enchanting.gui_bg = "bgcolor[#080808BB;true]"
mcl_enchanting.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
mcl_enchanting.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"

function mcl_enchanting.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

mcl_enchanting.gui_survival_form = "size[8,8.5]"..
			mcl_enchanting.gui_bg..
			mcl_enchanting.gui_bg_img..
			mcl_enchanting.gui_slots..
			"list[current_player;main;0,4.25;8,1;]"..
			"list[current_player;main;0,5.5;8,3;8]"..
			"list[current_player;craft;1.75,0.5;3,3;]"..
			"list[current_player;craftpreview;5.75,1.5;1,1;]"..
			"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			mcl_enchanting.get_hotbar_bg(0,4.25)

-- Load files
local mcl_enchanting_path = minetest.get_modpath("mcl_enchanting")



-- Force of the enchantments.
enchanting.uses     = 1.2  -- Durability
enchanting.times    = 0.1  -- Efficiency
enchanting.damages  = 1    -- Sharpness
enchanting.strength = 1.2  -- Armor strength (3d_armor only)
enchanting.speed    = 0.2  -- Player speed (3d_armor only)
enchanting.jump     = 0.2  -- Player jumping (3d_armor only)

function enchanting.formspec(pos, num)
	local meta = minetest.get_meta(pos)
	local formspec = [[ size[9,9;]
			bgcolor[#080808BB;true]
			background[0,0;9,9;ench_ui.png]
			list[context;tool;0.9,2.9;1,1;]
			list[context;mese;2,2.9;1,1;]
			list[current_player;main;0.5,4.5;8,4;]
			image[2,2.9;1,1;mese_layout.png]
			tooltip[sharp;Your weapon inflicts more damages]
			tooltip[durable;Your tool last longer]
			tooltip[fast;Your tool digs faster]
			tooltip[strong;Your armor is more resistant]
			tooltip[speed;Your speed is increased] ]]
			..mcl_enchanting.gui_slots..mcl_enchanting.get_hotbar_bg(0.5,4.5)

	local enchant_buttons = {
		[[ image_button[3.9,0.85;4,0.92;bg_btn.png;fast;Efficiency]
		image_button[3.9,1.77;4,1.12;bg_btn.png;durable;Durability] ]],
		"image_button[3.9,0.85;4,0.92;bg_btn.png;strong;Strength]",
		"image_button[3.9,2.9;4,0.92;bg_btn.png;sharp;Sharpness]",
		[[ image_button[3.9,0.85;4,0.92;bg_btn.png;strong;Strength]
		image_button[3.9,1.77;4,1.12;bg_btn.png;speed;Speed] ]]
	}

	formspec = formspec..(enchant_buttons[num] or "")
	meta:set_string("formspec", formspec)
end

--==============
--==============
--==============
--==============

--register

local function get_formspec_by_size(size)
	local formspec = mcl_enchanting_inventory_formspecs[tostring(size)]
	return formspec or mcl_enchanting_inventory_formspecs
end



function mcl_enchanting.register(name, def)
	def.drawtype = def.drawtype or (def.node_box and "nodebox")
	def.paramtype = def.paramtype or "light"
	def.sounds = def.sounds or mcl_sounds.node_sound_stone_defaults()

	if not (def.drawtype == "normal" or def.drawtype == "signlike" or
			def.drawtype == "plantlike" or def.drawtype == "glasslike_framed" or
			def.drawtype == "glasslike_framed_optional") then
		def.paramtype2 = def.paramtype2 or "facedir"
	end

	local infotext = def.infotext
	local inventory = def.inventory
	def.inventory = nil

	if inventory then
		def.on_construct = def.on_construct or function(pos)
			local meta = minetest.get_meta(pos)
			if infotext then meta:set_string("infotext", infotext) end

			local size = inventory.size or mcl_enchanting_inventory_size
			local inv = meta:get_inventory()
			inv:set_size("main", size)
			meta:set_string("formspec", (inventory.formspec or get_formspec_by_size(size))..xbg)
		end
		def.can_dig = def.can_dig or default_can_dig   --was default?
	elseif infotext and not def.on_construct then
		def.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", infotext)
		end
	end

	minetest.register_node("mcl_enchanting:"..name, def)
end



--==============
--==============

function enchanting.on_put(pos, listname, _, stack)
	if listname == "tool" then
		local stackname = stack:get_name()
		local tool_groups = {
			"axe, pick, shovel",
			"chestplate, leggings, helmet",
			"sword", "boots"
		}

		for idx, tools in pairs(tool_groups) do
			if tools:find(stackname:match(":(%w+)")) then
				enchanting.formspec(pos, idx)
			end
		end
	end
end

function enchanting.fields(pos, _, fields, sender)
	if fields.quit then return end
	local inv = minetest.get_meta(pos):get_inventory()
	local tool = inv:get_stack("tool", 1)
	local mese = inv:get_stack("mese", 1)
	local orig_wear = tool:get_wear()
	local mod, name = tool:get_name():match("(.*):(.*)")
	local enchanted_tool = (mod or "")..":enchanted_"..(name or "").."_"..next(fields)

	if mese:get_count() >= mese_cost and minetest.registered_tools[enchanted_tool] then
		minetest.sound_play("mcl_enchanting_enchanting", {to_player=sender:get_player_name(), gain=0.8})
		tool:replace(enchanted_tool)
		tool:add_wear(orig_wear)
		mese:take_item(mese_cost)
		inv:set_stack("mese", 1, mese)
		inv:set_stack("tool", 1, tool)
	end
end

--=================
--=================
--=================

function enchanting.dig(pos)--broken?
	local inv = minetest.get_meta(pos):get_inventory()
	return inv:is_empty("tool") and inv:is_empty("mese")
end

--=================
--=================
--=================

local function allowed(tool)
	for item in pairs(minetest.registered_tools) do
		if item:find("enchanted_"..tool) then return true end
	end
	return false
end

function enchanting.put(_, listname, _, stack)
	local item = stack:get_name():match("[^:]+$")
	--if listname == "mese" and item == "mese_crystal" then
	if listname == "mese" and item == "blue" then
		return stack:get_count()
	elseif listname == "tool" and allowed(item) then
		return 1 
	end
	return 0
end

function enchanting.on_take(pos, listname)
	if listname == "tool" then enchanting.formspec(pos, nil) end
end

function enchanting.construct(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("infotext", "Enchantment Table -Broken--Use Water to Dig Block-")
	enchanting.formspec(pos, nil)

	local inv = meta:get_inventory()
	inv:set_size("tool", 1)
	inv:set_size("mese", 1)

	minetest.add_entity({x=pos.x, y=pos.y+0.85, z=pos.z}, "mcl_enchanting:book_open")
	local timer = minetest.get_node_timer(pos)
	timer:start(5.0)
end

function enchanting.destruct(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "mcl_enchanting:book_open" then
			obj:remove() break
		end
	end
end

function enchanting.timer(pos)
	local node = minetest.get_node(pos)
	local num = #minetest.get_objects_inside_radius(pos, 0.9)

	if num == 0 then
		minetest.add_entity({x=pos.x, y=pos.y+0.85, z=pos.z}, "mcl_enchanting:book_open")
	end

	local minp = {x=pos.x-2, y=pos.y, z=pos.z-2}
	local maxp = {x=pos.x+2, y=pos.y+1, z=pos.z+2}
	local bookshelves = minetest.find_nodes_in_area(minp, maxp, "mcl_books:bookshelf")
	if #bookshelves == 0 then return true end

	local bookshelf_pos = bookshelves[math.random(1, #bookshelves)]
	local x = pos.x - bookshelf_pos.x
	local y = bookshelf_pos.y - pos.y
	local z = pos.z - bookshelf_pos.z

	if tostring(x..z):find(2) then
		minetest.add_particle({
			pos = bookshelf_pos,
			velocity = {x=x, y=2-y, z=z},
			acceleration = {x=0, y=-2.2, z=0},
			expirationtime = 1,
			size = 2,
			texture = "xdecor_glyph"..math.random(1,18)..".png"
		})
	end
	return true
end

--nodes

--testnode
minetest.register_node("mcl_enchanting:stone", {
	description = "mcl_enchanting Stone",
	tiles = {"default_stone.png^xdecor_book_open.png"},
		groups = {cracky = 3, stone = 1},
	drop = 'mcl_core:cobble',
	legacy_mineral = true,
})
--[[
mcl_enchanting.register("stone2", {
	description = "-XDECOR WAY mcl_enchanting Stone",
	infotext = "-XDECOR WAY mcl_enchanting Stone",
	inventory = nil,
	tiles = {"default_stone.png^xdecor_book_open.png"},
	groups = {cracky = 3, stone = 1},

})
]]


mcl_enchanting.register("enchantment_table", {
--minetest.register_node("mcl_enchanting:enchantment_table", {
	_doc_items_longdesc = "Use to enchant your tools or armour.  Place tool in tool slot, place Lapis in other slot, then choose enchant.  One enchant per item.",
	_doc_items_hidden = false,
	description = "Enchantment Table -Use Water to Dig Block-",
	tiles = {"xdecor_enchantment_top.png",  "xdecor_enchantment_bottom.png",
		 "xdecor_enchantment_side.png", "xdecor_enchantment_side.png",
		 "xdecor_enchantment_side.png", "xdecor_enchantment_side.png"},
	groups = {pickaxey=3, handy=2, building_block=1, material_stone=1, dig_by_water=1, creative_breakable=1},
	stack_max = 1,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 17.5,
	_mcl_hardness = 3.5,

	--can_dig = enchanting.dig,  --was default?
	can_dig = enchanting.dig,  --was default?
	on_timer = enchanting.timer,
	on_construct = enchanting.construct,
	on_destruct = enchanting.destruct,
	on_receive_fields = enchanting.fields,
	on_metadata_inventory_put = enchanting.on_put,
	on_metadata_inventory_take = enchanting.on_take,
	allow_metadata_inventory_put = enchanting.put,
	allow_metadata_inventory_move = function() return 0 end
})

minetest.register_entity("mcl_enchanting:book_open", {
	visual = "sprite",
	visual_size = {x=0.75, y=0.75},
	collisionbox = {0},
	physical = false,
	textures = {"xdecor_book_open.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-1, z=pos.z}

		if minetest.get_node(pos_under).name ~= "mcl_enchanting:enchantment_table" then
			self.object:remove()
		end
	end
})

--======
--TOOL ENCHANTS
local function cap(S) return S:gsub("^%l", string.upper) end

function enchanting:register_tools(mod, def)
	for tool in pairs(def.tools) do
	for material in def.materials:gmatch("[%w_]+") do
	for enchant in def.tools[tool].enchants:gmatch("[%w_]+") do
		local original_tool = minetest.registered_tools[mod..":"..tool.."_"..material]
		if not original_tool then break end

		if original_tool.tool_capabilities then
			local original_damage_groups = original_tool.tool_capabilities.damage_groups
			local original_groupcaps = original_tool.tool_capabilities.groupcaps
			local groupcaps = table.copy(original_groupcaps)
			local fleshy = original_damage_groups.fleshy
			local full_punch_interval = original_tool.tool_capabilities.full_punch_interval
			local max_drop_level = original_tool.tool_capabilities.max_drop_level
			local group = next(original_groupcaps)

			if enchant == "durable" then
				groupcaps[group].uses = math.ceil(original_groupcaps[group].uses * enchanting.uses)
			elseif enchant == "fast" then
				for i, time in pairs(original_groupcaps[group].times) do
					groupcaps[group].times[i] = time - enchanting.times
				end
			elseif enchant == "sharp" then
				fleshy = fleshy + enchanting.damages
			end

			minetest.register_tool(":"..mod..":enchanted_"..tool.."_"..material.."_"..enchant, {
				description = "Enchanted "..cap(material).." "..cap(tool).." ("..cap(enchant)..")",
				inventory_image = original_tool.inventory_image.."^[colorize:violet:50",
				wield_image = original_tool.wield_image,
				groups = {not_in_creative_inventory=1},
				tool_capabilities = {
					groupcaps = groupcaps, damage_groups = {fleshy = fleshy},
					full_punch_interval = full_punch_interval, max_drop_level = max_drop_level
				}
			})
		end

		if mod == "3d_armor" then
			local original_armor_groups = original_tool.groups
			local armorcaps = {}
			armorcaps.not_in_creative_inventory = 1

			for armor_group, value in pairs(original_armor_groups) do
				if enchant == "strong" then
					armorcaps[armor_group] = math.ceil(value * enchanting.strength)
				elseif enchant == "speed" then
					armorcaps[armor_group] = value
					armorcaps.physics_speed = enchanting.speed
					armorcaps.physics_jump = enchanting.jump
				end
			end

			minetest.register_tool(":"..mod..":enchanted_"..tool.."_"..material.."_"..enchant, {
				description = "Enchanted "..cap(material).." "..cap(tool).." ("..cap(enchant)..")",
				inventory_image = original_tool.inventory_image,
				texture = "3d_armor_"..tool.."_"..material,
				wield_image = original_tool.wield_image,
				groups = armorcaps,
				wear = 0
			})
		end
	end
	end
	end
end

enchanting:register_tools("mcl_tools", {
	materials = "iron, gold, stone, diamond",
	tools = {
		axe    = {enchants = "durable, fast"},
		pick   = {enchants = "durable, fast"}, 
		shovel = {enchants = "durable, fast"},
		sword  = {enchants = "sharp"}
	}
})


enchanting:register_tools("3d_armor", {
	materials = "steel, gold, diamond",
	tools = {
		boots      = {enchants = "strong, speed"},
		chestplate = {enchants = "strong"},
		helmet     = {enchants = "strong"},
		leggings   = {enchants = "strong"}
	}
})


minetest.register_craft({
	output = "mcl_enchanting:enchantment_table",
	recipe = {
		{"","mcl_books:book",""},
		{"mcl_core:diamond","mcl_core:obsidian","mcl_core:diamond"},
		{"mcl_core:obsidian","mcl_core:obsidian","mcl_core:obsidian"},
	}
})
