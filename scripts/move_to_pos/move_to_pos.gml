// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_to_pos(){

	if target_x!=-1 and obj_controller.exploration_active[target_side] {
		if sprite_index!=spr_peasant_walk {
			sprite_index=spr_peasant_walk;
			image_index = 0;
			}
		image_xscale = sign(target_x-x+0.001);
		x+=image_xscale*run_speed;
		if abs(x-target_x)<run_speed*2 {
			if job == jobs.soldier {
				state = explore_new_land;
				obj_controller.units_exploring[target_side]++; 
				timer = 0;
				target_x = -1;
				}
			}
		}	
	else {
		state = wander;
		if job == jobs.soldier {
			obj_controller.units_going_to_explore[target_side]--; 
			}
		}
	}