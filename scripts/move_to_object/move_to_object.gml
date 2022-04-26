// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_to_object(){

	if instance_exists(target_instance) {
		if job == jobs.builder {
			if !instance_exists(target_instance) or target_instance.built{
				with target_instance {
					builders--;
					}
				target_instance = noone;
				state = wander;
				exit;
				}
			}
		if sprite_index!=spr_peasant_walk {
			sprite_index=spr_peasant_walk;
			image_index = 0;
			}
		image_xscale = sign(target_instance.x-x+0.001);
		x+=image_xscale*run_speed;
		if in_range(x,target_instance.x,target_instance.x+target_instance.sprite_width*target_instance.image_xscale) {
			show_debug_message("llegue");
			timer = room_speed*3;
			sprite_index = spr_peasant;
			image_index=0;
			show_debug_message(string(job));
			if job == jobs.builder {
				state = build;
				timer = 0;
				target_x = -1;
				}
			else if job == jobs.lumberjack {
				state = work_lumberjack;
				target_instance.workers_working++;
				timer = 0;
				target_x = -1;
				}
			}
	}	
}