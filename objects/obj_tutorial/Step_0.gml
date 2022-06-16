/// @description Insert description here
// You can write your code in this editor


if global.can_help!= -1 {

	if global.can_help == 0 {
		show_debug_message("I DIE");
		instance_destroy();
		}
	else if global.can_help == 1 {
		if current_tutorial !=10 and (global.time/global.day_time>=global.job_endtime) {
			current_tutorial = 10;
			audio_play_sound(snd_tut_progress,9,0);
			y = -32;
			image_alpha = 0;
			}
		if !current_tutorial_sucessful {
			y += (0-y)/8;
			image_alpha = min(1,image_alpha+.025);
			if tutorial_condition[current_tutorial]() {
					show_debug_message("condition accepted");
					current_tutorial_sucessful = true;
					alarm[1] = room_speed;
				}
			}
		}
	}
