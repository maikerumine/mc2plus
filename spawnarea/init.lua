RADIUS = 428
SPAWN = {x=50, y=2, z=50}

local function findspawn(player)
	for try=100000, 0, -1 do
		local pos = {x = SPAWN.x, y = SPAWN.y, z = SPAWN.z}
		pos.x = SPAWN.x + math.random(-RADIUS, RADIUS)
		pos.z = SPAWN.z + math.random(-RADIUS, RADIUS)
		if minetest.forceload_block(pos) then
			-- Find ground level (0...15)
			local ground_y = nil
			for y=16, 0, -1 do
				local nn = minetest.get_node({x=pos.x, y=y, z=pos.z}).name
				if nn ~= "air" and nn~= "ignore" then
					ground_y = y
					break
				end
			end
			if ground_y then
				pos.y = ground_y
				if minetest.registered_nodes[minetest.get_node(pos).name].walkable == true and
					minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" and
					minetest.get_node({x=pos.x, y=pos.y+2, z=pos.z}).name == "air" then
					local pos_spawn = {x=pos.x, y=pos.y+1, z=pos.z}
					return pos_spawn
				end
			end
			minetest.forceload_free_block(pos)
		end
	end
end

local function spawnarea(player)
	local pos = findspawn(player)
	if pos then
		player:setpos(pos)
	else
		player:setpos(SPAWN)
	end
end

minetest.register_on_newplayer(function(player)
	spawnarea(player)
end)

minetest.register_on_respawnplayer(function(player)
	spawnarea(player)
	return true
end)
