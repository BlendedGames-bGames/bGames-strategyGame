// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clear_forest(){
	if !instance_exists(target_instance) or (global.time/global.day_time >=global.job_endtime)  {

		state = work_lumberjack;
		exit;
		with target_instance {
			workers_working++;
			}
		//target_instance = noone;
		//state = wander;
		}
	else if !instance_exists(target_instance.cut_zone) {
		state = move_to_object;
		}
	

	if timer == 0 {
		if target_x==-1 {
			current_tree = -1;
			if !instance_exists(target_instance.cut_zone) exit;
			var _chunks = target_instance.cut_zone.image_xscale;
			while (current_tree = -1 and _chunks>0){
				current_chunk = target_instance.cut_zone.x/64 + irandom(target_instance.cut_zone.image_xscale-1);
				var _tries = 3;
				while (current_tree == -1 and _tries >0) {
					current_tree_pos = irandom(2);
					current_tree = global.world.forest_tree[current_chunk][current_tree_pos];
					_tries--;
					}
				_chunks--;
				}
			if (current_tree == -1) {
				exit;
				}
			target_x = current_chunk*64+current_tree.x;
			image_xscale = sign(target_x-x+0.001);
			sprite_index=spr_walk;
			image_index = 0;
			}
		var _ms = global.peasant_walk_speed;
		if abs(x-target_x)>64 _ms = global.peasant_run_speed;
		x+=image_xscale*_ms;
		if abs(target_x-x)<10 {
			effect_done = false;
			timer = room_speed*3;
			image_index=0;
			sprite_index = spr_work;
			target_x=-1;
			}
		}
	else {
			
		if round(image_index) == 0 {
			effect_done = false;
			if  global.world.forest_tree[current_chunk][current_tree_pos] == -1 {
				target_x=-1;
				timer = 0;
				}
				
			}
		else if round(image_index) == 6 and !effect_done {
			//global.wood+=global.daily_wood_gather_base;
			current_tree.image_angle=-3*(image_xscale);
			current_tree.hp-=1;
			if global.world.forest_needs_to_be_animated[current_chunk] = false {
				ds_list_add(obj_ground.forest_chunk_to_animate,current_chunk);
				global.world.forest_needs_to_be_animated[current_chunk] = true;
				}
			effect_done = true; 
			}
		
		}
		

}
