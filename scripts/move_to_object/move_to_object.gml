// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_to_object(){

	if instance_exists(target_instance) and (check_state==-1 or (check_state!=-1 and check_state())) and (global.time/global.day_time <0.65)  {
		if sprite_index!=spr_walk {
			sprite_index=spr_walk;
			image_index = 0;
			}
		image_xscale = sign(target_instance.x-x+0.001);
		x+=image_xscale*global.peasant_run_speed;
		if in_range(x,target_instance.x,target_instance.x+target_instance.sprite_width*target_instance.image_xscale) {
			show_debug_message("llegue");
			sprite_index = spr_idle;
			image_index=0;
			timer = 0;
			target_x = -1;
			if on_finish_state!=-1 on_finish_state();
			state = next_state;

			}
		}	
	else {
		cancel_state();
		}
	}