/// @description Insert description here
// You can write your code in this editor


if hp<=0 or (global.time/global.day_time <global.job_endtime) {
	var _corpse = instance_create_layer(x,y,"Units",obj_enemy_die);
	_corpse.hspeed = hspeed;
	_corpse.vspeed = vspeed;
	instance_destroy();
	
	}

state();
