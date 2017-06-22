local origin = minetest.setting_get_pos("static_spawnpoint") or {x=0, y=-30, z=0}
local adminname = minetest.setting_get("name") or "singleplayer"

local spawnanywhere = minetest.setting_get("spawn_anywhere") or false

local playerspawns = {}
local spawnsfile = minetest.get_worldpath().."/dynamicspawns.lua.ser"

local bedspawn = minetest.setting_getbool("enable_bed_respawn")
if bedspawn ~= false then
	bedspawn = true
end

--minetest.register_privilege("spawn", "Can teleport to spawn position.")

--[[
minetest.register_chatcommand("spawn", {
	description = "Teleport to spawn position.",
	params = "",
	privs = "spawn",
	func = function(name)
		local target = playerspawns[name]
		if not target then
			playerspawns[name] = newspawn()
			target = playerspawns[name]
			spawnsave()
		end
		minetest.get_player_by_name(name):setpos(target)
	end
})
]]
local function newspawn(pos, radius)
	if not radius then
		radius = 32
	end
	if radius > 556 then
		minetest.log("error", "No valid spawnable location")
		return
	end

	--minetest.debug("Trying somewhere around "..minetest.pos_to_string(pos))

	local breadth = radius
	local altitude = radius/2

	if spawnanywhere then
		breadth = radius
		altitude = radius
	end

	local pos1 = {x=pos.x-breadth, y=pos.y-altitude/2, z=pos.z-breadth}
	local pos2 = {x=pos.x+breadth, y=pos.y+altitude, z=pos.z+breadth}

	--minetest.emerge_area(pos1, pos2)

	local airnodes = minetest.find_nodes_in_area(pos1, pos2, {"air"})
	local validnodes = {}

	--minetest.debug("Found "..tostring(#airnodes).." air nodes within "..tostring(radius))
	for _,anode in pairs(airnodes) do
		local under = minetest.get_node( {x=anode.x, y=anode.y-1, z=anode.z} ).name
		local over = minetest.get_node( {x=anode.x, y=anode.y+1, z=anode.z} ).name
		under = minetest.registered_nodes[under]
		over = minetest.registered_nodes[over]

		
		if under.walkable and not over.walkable and not minetest.is_protected(anode, adminname) then
			validnodes[#validnodes+1] = anode
		end
	end

	if #validnodes > 0 then
		minetest.log("info", "New spawn point found with radius "..tostring(radius))
		return validnodes[math.random(1,#validnodes)]
	end

	return newspawn(pos, radius+32)
end

local function genpos(name, args)
	local pos = origin
	local player = minetest.get_player_by_name(name)
	local curpos = player:getpos()

	if spawnanywhere then
		pos = {
			x = math.random(-500,500),
			y = math.random(0, 100),
			z = math.random(-500,500),
		}
	end
	if args == "here" then
		pos = curpos
	end

	player:setpos(pos)

	minetest.after(1,function()
		local newpos = newspawn(pos)

		if newpos then
			playerspawns[name] = newpos
			player:setpos(playerspawns[name])
			--spawnsave()
			minetest.chat_send_player(name, "Welcome to ANARCHY!!")
		else
			player:setpos(curpos)
		end
	end)

end
--[[
minetest.register_privilege("newspawn", "Can get a new randomized spawn position.")

minetest.register_chatcommand("newspawn", {
	description = "Randomly select a new spawn position.",
	params = "",
	privs = "newspawn",
	func = function(name, args)
		genpos(name, args)
	end
})

minetest.register_privilege("setspawn", "Can manually set a spawn point")

minetest.register_chatcommand("setspawn", {
	description = "Assign current position as spawn position.",
	params = "",
	privs = "setspawn",
	func = function(name)
		playerspawns[name] = minetest.get_player_by_name(name):getpos()
		spawnsave()
		minetest.chat_send_player(name, "New spawn set !")
	end
})
]]

--[[
function spawnsave()
	local serdata = minetest.serialize(playerspawns)
	if not serdata then
		minetest.log("error", "[spawn] Data serialization failed")
		return
	end
	local file, err = io.open(spawnsfile, "w")
	if err then
		return err
	end
	file:write(serdata)
	file:close()
end

function spawnload()
	local file, err = io.open(spawnsfile, "r")
	if err then
		minetest.log("error", "[spawn] Data read failed")
		return
	end
	playerspawns = minetest.deserialize(file:read("*a"))
	file:close()
end

spawnload()
]]
minetest.register_on_newplayer(function(player)
	local name = player:get_player_name()
	playerspawns[name] = player:getpos()
	--spawnsave()
	if spawnanywhere then
		genpos(player:get_player_name() )
	end
	return
end)
--[[
minetest.register_on_joinplayer(function(player)
	minetest.after(1.1, function()
		local name = player:get_player_name()
		if not playerspawns[name] then
			playerspawns[name] = newspawn()
			player:setpos(playerspawns[name])
			--spawnsave()
		end
	end)
end)
]]
--[[
minetest.register_on_respawnplayer(function(player)
	local name = player:get_player_name()
	if bedspawn == true then
		local pos = beds.spawn[name]
		if pos then
			player:setpos(pos)
			return true
		end
	end
	-- And if no bed, nor bed spwawning not active:
	player:setpos(playerspawns[name])
	return true
end)
]]
minetest.register_on_joinplayer(function(player)
minetest.after(1.1, function()
	local name = player:get_player_name()
	playerspawns[name] = player:getpos()
	--spawnsave()
	if spawnanywhere then
		genpos(player:get_player_name() )
	end
	return
	end)
end)
minetest.register_on_respawnplayer(function(player)
minetest.after(1.1, function()
	local name = player:get_player_name()
	playerspawns[name] = player:getpos()
	--spawnsave()
	if spawnanywhere then
		genpos(player:get_player_name() )
	end
	return
	end)
end)
