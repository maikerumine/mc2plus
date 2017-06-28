--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### HORSE
--###################



-- Horse
local horse = {
	type = "animal",
	visual = "mesh",
	mesh = "mobs_mc_horse.b3d",
	visual_size = {x=3.0, y=3.0},
	rotate = -180,
	collisionbox = {-0.69825, -0.01, -0.69825, 0.69825, 1.59, 0.69825},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	textures = {
		{"mobs_mc_horse_brown.png"},
		{"mobs_mc_horse_darkbrown.png"},
		{"mobs_mc_horse_white.png"},
		{"mobs_mc_horse_gray.png"},
		{"mobs_mc_horse_black.png"},
		{"mobs_mc_horse_chestnut.png"},
	},
	fear_height = 4,
	fly = false,
	walk_chance = 60,
	view_range = 16,
	follow = mobs_mc.follow.horse,
	passive = true,
	hp_min = 15,
	hp_max = 30,
	floats = 1,
	lava_damage = 4,
	water_damage = 1,
	makes_footstep_sound = true,
	drops = {
		{name = mobs_mc.items.leather,
		chance = 1,
		min = 0,
		max = 2,},
	},

	do_custom = function(self, dtime)

		-- set needed values if not already present
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 2  --swap due to -180 model
			self.max_speed_reverse = 7  --swap due to -180 model
			self.accel = 6
			self.terrain_type = 3
			self.driver_attach_at = {x = 0, y = 7.5, z = 1.75}
			self.player_rotation = {x = 0, y = 180, z = 0}
			self.driver_eye_offset = {x = 0, y = 3, z = 0}
			self.driver_scale = {x = 1/self.visual_size.x, y = 1/self.visual_size.y}
		end

		-- if driver present allow control of horse
		if self.driver then

			mobs.drive(self, "walk", "stand", false, dtime)

			return false -- skip rest of mob functions
		end

		return true
	end,

	on_die = function(self, pos)

		-- drop saddle when horse is killed while riding
		-- also detach from horse properly
		if self.driver then
			minetest.add_item(pos, mobs_mc.items.saddle)
			mobs.detach(self.driver, {x = 1, y = 0, z = 1})
		end

	end,

	on_rightclick = function(self, clicker)

		-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end

		-- feed, tame or heal horse
		if mobs:feed_tame(self, clicker, 1, true, true) then
			return
		end

		-- make sure tamed horse is being clicked by owner only
		if self.tamed and self.owner == clicker:get_player_name() then

			local inv = clicker:get_inventory()

			-- detatch player already riding horse
			if self.driver and clicker == self.driver then

				mobs.detach(clicker, {x = 1, y = 0, z = 1})

				-- add saddle back to inventory
				if inv:room_for_item("main", mobs_mc.items.saddle) then
					inv:add_item("main", mobs_mc.items.saddle)
				else
					minetest.add_item(clicker.getpos(), mobs_mc.items.saddle)
				end

			-- attach player to horse
			elseif not self.driver
			and clicker:get_wielded_item():get_name() == mobs_mc.items.saddle then

				self.object:set_properties({stepheight = 1.1})
				mobs.attach(self, clicker)

				-- take saddle from inventory
				inv:remove_item("main", mobs_mc.items.saddle)
			end
		end

		-- used to capture horse with magic lasso
		mobs:capture_mob(self, clicker, 0, 0, 80, false, nil)
	end
}

mobs:register_mob("mobs_mc:horse", horse)

-- Skeleton horse
local skeleton_horse = table.copy(horse)
skeleton_horse.textures = {{"mobs_mc_horse_skeleton.png"}}
skeleton_horse.drops = {
	{name = mobs_mc.items.bone,
	chance = 1,
	min = 1,
	max = 1,},
}
skeleton_horse.sounds = {
	random = "skeleton1",
	death = "skeletondeath",
	damage = "skeletonhurt1",
}
mobs:register_mob("mobs_mc:skeleton_horse", skeleton_horse)

-- Zombie horse
local zombie_horse = table.copy(horse)
zombie_horse.textures = {{"mobs_mc_horse_zombie.png"}}
zombie_horse.drops = {
	{name = mobs_mc.items.rotten_flesh,
	chance = 1,
	min = 1,
	max = 1,},
}
zombie_horse.sounds = {
	random = "zombie1",
	death = "zombiedeath",
	damage = "zombiehurt1",
}
mobs:register_mob("mobs_mc:zombie_horse", zombie_horse)

-- Donkey
local d = 0.86 -- donkey scale
local donkey = table.copy(horse)
donkey.mesh = "mobs_mc_mule.b3d"
donkey.textures = {{"mobs_mc_horse_creamy.png"}}
donkey.animation = {
	speed_normal = 25,
	stand_start = 0, stand_end = 0,
	walk_start = 0, walk_end = 40,
}
donkey.visual_size = { x=horse.visual_size.x*d, y=horse.visual_size.y*d }
donkey.collisionbox = {
	horse.collisionbox[1] * d,
	horse.collisionbox[2] * d,
	horse.collisionbox[3] * d,
	horse.collisionbox[4] * d,
	horse.collisionbox[5] * d,
	horse.collisionbox[6] * d,
}
mobs:register_mob("mobs_mc:donkey", donkey)

-- Mule
local m = 0.94
local mule = table.copy(donkey)
mule.textures = {{"mobs_mc_mule.png"}}
mule.visual_size = { x=horse.visual_size.x*m, y=horse.visual_size.y*m }
mule.collisionbox = {
	horse.collisionbox[1] * m,
	horse.collisionbox[2] * m,
	horse.collisionbox[3] * m,
	horse.collisionbox[4] * m,
	horse.collisionbox[5] * m,
	horse.collisionbox[6] * m,
}
mobs:register_mob("mobs_mc:mule", mule)

--===========================
--Spawn Function
mobs:register_spawn("mobs_mc:horse", mobs_mc.spawn.grassland_savanna, minetest.LIGHT_MAX+1, 0, 15000, 12, 31000)
mobs:register_spawn("mobs_mc:donkey", mobs_mc.spawn.grassland_savanna, minetest.LIGHT_MAX+1, 0, 15000, 12, 31000)


-- compatibility
mobs:alias_mob("mobs:horse", "mobs_mc:horse")

-- spawn eggs
mobs:register_egg("mobs_mc:horse", "Horse", "mobs_mc_spawn_icon_horse.png", 0)
mobs:register_egg("mobs_mc:skeleton_horse", "Skeleton Horse", "mobs_mc_spawn_icon_horse_skeleton.png", 0)
mobs:register_egg("mobs_mc:zombie_horse", "Zombie Horse", "mobs_mc_spawn_icon_horse_zombie.png", 0)
mobs:register_egg("mobs_mc:donkey", "Donkey", "mobs_mc_spawn_icon_donkey.png", 0)
mobs:register_egg("mobs_mc:mule", "Mule", "mobs_mc_spawn_icon_mule.png", 0)


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Horse loaded")
end
