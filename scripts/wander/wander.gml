// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wander(){
	var _base = global.base;
	if in_range(x,global.control_radius_left,global.control_radius_right) {
		if timer == 0 {
			if target_x==-1 {
				target_x = irandom_range(global.control_radius_left,global.control_radius_right);
				image_xscale = sign(target_x-x+0.001);
				sprite_index=spr_walk;
				image_index = 0;
				}
			x+=image_xscale*global.peasant_walk_speed;
			if abs(target_x-x)<global.peasant_walk_speed {
				timer = room_speed*3;
				sprite_index = spr_idle;
				image_index=0;
				target_x=-1;
				}
			}
		}
	else {
		if sprite_index!=spr_walk {
			sprite_index=spr_walk;
			image_index = 0;
			}
		image_xscale = sign(_base.x-x+0.001);
		x+=image_xscale*global.peasant_walk_speed;
		timer=0;
	}	
}