# r-Spawn for Minetest

A spawn command for Minetest without needing a fixed point -- `singleplayer` rejoice!

Players are each given their own randomized spawn point near the spawn origin on first joining. If no `static_spawnpoint` is defined in `minetest.conf`, the origin is 0,0,0. If static spawn point is defined, that point is used as origin instead.

## Features

* A normal game in singleplayer mode will still alow the player access to a spawn location
* Player will respawn at their spawnpoint if they die.
	* Players will respawn at their bed if this option is active (default `bedspawn = true`)
	* Their `/spawn` location will still be the randomized location.
* Players will not spawn in spaces that are protected by any other player than the Server Admin.
* Additional commands
	* Players can request a new spawn point by typing `/newspawn` if they have the `newspawn` privilege.
	* Players can set their spawn point by typing `/setspawn` if they have the `setspawn` privelege.
* Secondary mode: `spawn_anywhere`

### Spawn Anywhere

If `spawn_anywhere` is set in minetest.conf, any *new* player will be given a spawn point anywhere in the world. In the case of a server, players can be given spawns very far from eachother, and maybe not meet anybody for a long time ...!

## Considerations for a server

If running on a server consider the following

* make sure the space around the origin is clear of ownership, or is owned by the server admin
* make sure there is sufficient space (try for 32 nodes radius around and above origin) and walkable nodes in the area

Failure to take these into consideration will often mean that the calculation of a new spawn point will take longer and be more processor-intense.

## License

(C) 2017 Tai "DuCake" Kedzierski
based originally on the mod uploaded by everamzah

Provided under the terms of the LGPL v3.0
