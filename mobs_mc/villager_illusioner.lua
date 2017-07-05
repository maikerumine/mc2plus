--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes

-- intllib
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

mobs:register_mob("mobs_mc:illusioner", {
	type = "monster",
	attack_type = "shoot",
	shoot_interval = 0.5,
	arrow = "mobs_mc:arrow_entity",
	shoot_offset = 1.5,
	hp_min = 32,
	hp_max = 32,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.94, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_illusioner.b3d",
	textures = {
		{"mobs_mc_illusionist.png^mobs_mc_illusionist_bow.png"},
	},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		walk_speed = 25,
		run_speed = 25,
		shoot_speed = 25,
		stand_start = 40,
		stand_end = 59,
		stand_speed = 5,
		walk_start = 0,
		walk_end = 40,
		--speed_walk = 50,
		shoot_start = 90,
		shoot_end = 110,
		die_start = 110,
		die_end = 130,
		die_speed = 5,
        -- 60-80 magic arm swinging, 80-90 transition between magic to bow shooting
	},
	view_range = 16,
	fear_height = 4,
	lava_damage = 4,
})

mobs:register_egg("mobs_mc:illusioner", S("Illusioner"), "mobs_mc_spawn_icon_illusioner.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Illusioner loaded")
end
