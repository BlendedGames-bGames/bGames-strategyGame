/// @description Insert description here
// You can write your code in this editor



hp=1;

attack_cooldown = 0;
can_attack = true;
state = enemy_spawn;

target = noone;
target_x = 0;
potential_target = noone;

clock_offset = irandom(9);

if xstart<((global.world.size/2)*64) {
	target_x = (global.world.size)*64;
	image_xscale = 1;
	}
else {
	target_x = 0;
	image_xscale = -1;
	}
	
spawn_sprite=spr_carcass_spawn;

var _pos = floor(x/64);

if global.world.chunk_type[_pos] == 3 {
	spawn_sprite = spr_carcass_water_spawn;
	}
