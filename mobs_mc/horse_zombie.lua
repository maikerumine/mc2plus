--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### ZOMBIE HORSE
--###################


mobs:register_mob("mobs_mc:horsezombie", {
	type = "animal",
	hp_min = 15,
	hp_max = 30,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "horse.b3d",
    textures = {{"horsezombie.png"}},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = 1,
	drops = {
		{name = "mobs:rotten_flesh",
		chance = 1,
		min = 1,
		max = 1,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	sounds = {
		random = "zombie1",
		death = "zombiedeath",
		damage = "zombiehurt1",
		attack = "default_punch3",
	},
	animation = {
		speed_normal = 25,
		stand_start = 0,		stand_end = 40,
		walk_start = 0,		walk_end = 40,
	},
	follow = "farming:wheat",
	view_range = 16,
	do_custom = function(self, dtime)

		-- set needed values if not already present
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 2  --swap due to -180 model
			self.max_speed_reverse = 4  --swap due to -180 model
			self.accel = 4
			self.terrain_type = 3
			self.driver_attach_at = {x = 0, y = 7.5, z = 0}
			self.player_rotation = {x = 0, y = 180, z = 0}
			self.driver_eye_offset = {x = 0, y = 3, z = 0}
			self.driver_scale = {x = 0.3, y = 0.3}
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
			minetest.add_item(pos, "mobs:saddle")
			mobs.detach(self.driver, {x = 1, y = 0, z = 1})
		end

	end,

	on_rightclick = function(self, clicker)

		-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end

		-- feed, tame or heal horse
		if mobs:feed_tame(self, clicker, 10, true, true) then
			return
		end

		-- make sure tamed horse is being clicked by owner only
		if self.tamed and self.owner == clicker:get_player_name() then

			local inv = clicker:get_inventory()

			-- detatch player already riding horse
			if self.driver and clicker == self.driver then

				mobs.detach(clicker, {x = 1, y = 0, z = 1})

				-- add saddle back to inventory
				if inv:room_for_item("main", "mobs:saddle") then
					inv:add_item("main", "mobs:saddle")
				else
					minetest.add_item(clicker.getpos(), "mobs:saddle")
				end

			-- attach player to horse
			elseif not self.driver
			and clicker:get_wielded_item():get_name() == "mobs:saddle" then

				self.object:set_properties({stepheight = 1.1})
				mobs.attach(self, clicker)

				-- take saddle from inventory
				inv:remove_item("main", "mobs:saddle")
			end
		end

		-- used to capture horse with magic lasso
		mobs:capture_mob(self, clicker, 0, 0, 80, false, nil)
	end

})


--spawn
mobs:register_spawn("mobs_mc:horsezombie", {"default:dirt_with_dry_grass"}, 20, 12, 23000, 1, 31000)
mobs:register_spawn("mobs_mc:horsezombie", {"default:desert_sand"}, 20, 8, 7000, 1, 5)
mobs:register_spawn("mobs_mc:horsezombie", {"default:cobblestone"}, 5, -1, 17000, 1, 5)

--spawnegg
mobs:register_egg("mobs_mc:horsezombie", "Zombie Horse", "horsezombie_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Horse Zombie loaded")
end