/// @description Insert description here
// You can write your code in this editor

y=min(y,global.ground_level);

if y==global.ground_level {
	hspeed=0;
	vspeed=0;
	}
else {
	image_angle=direction;
	}

if position_meeting(x,y,obj_enemy) and can_hit{
	can_hit = false;
	var victim=instance_place(x,y,obj_enemy);
	victim.hp-=global.soldier_attack_damage;
	instance_destroy();
	}
