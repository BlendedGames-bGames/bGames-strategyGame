/// @description Insert description here
// You can write your code in this editor


if hp<=0 {
	var _corpse = instance_create_layer(x,y,"Units",obj_enemy_die);
	_corpse.hspeed = hspeed;
	_corpse.vspeed = vspeed;
	instance_destroy();
	
	}

state();
