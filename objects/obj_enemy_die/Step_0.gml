/// @description Insert description here
// You can write your code in this editor

vspeed=min(vspeed+.5,4);
y = min(global.ground_level,y);	
if y == global.ground_level {
	vspeed = 0;
	hspeed = 0;
	}

