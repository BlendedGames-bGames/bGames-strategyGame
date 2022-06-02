// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_to_pos(){

	if target_x!=-1 and (check_state==-1 or (check_state!=-1 and check_state())) and (global.time/global.day_time <global.job_endtime) {
		if sprite_index!=spr_walk {
			sprite_index=spr_walk;
			image_index = 0;
			}
		image_xscale = sign(target_x-x+0.001);
		x+=image_xscale*global.peasant_run_speed;
		if abs(x-target_x)<global.peasant_run_speed*2 {
			timer = 0;
			//target_x = -1;
			if on_finish_state!=-1 on_finish_state();
			state = next_state;
			}
		}	
	else {
		if job = jobs.soldier {
			show_debug_message("pa la casa");
			}
		cancel_state();
		}
	}