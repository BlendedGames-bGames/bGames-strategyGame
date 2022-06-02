// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_to_pos(){

	find_target(160);
	if (sprite_index == spr_archer_attack_front or sprite_index == spr_archer_attack_up) {
		state = soldier_idle;
		}
	if target_x!=-1 and (check_state==-1 or (check_state!=-1 and check_state()))  {
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
		cancel_state();
		}
	}