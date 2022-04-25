// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function work_lumberjack(){
	if !instance_exists(target_instance){
		with target_instance {
			workers--;
			}
		target_instance = noone;
		state = wander;
		}
	var _can_work = !ds_list_empty(target_instance.forest_chunks);
	
	if _can_work {
		if timer == 0 {
			if target_x==-1 {
				current_tree = -1;
				while current_tree = -1 {
					current_chunk = target_instance.forest_chunks[| irandom(ds_list_size(target_instance.forest_chunks)-1)];
					var _tries = 3;
					while (current_tree == -1 and _tries >0) {
						current_tree = global.world.forest_tree[current_chunk][irandom(2)];
						_tries--;
						}
					}
				target_x = current_chunk*64+current_tree.x;
				image_xscale = sign(target_x-x+0.001);
				sprite_index=spr_peasant_walk;
				image_index = 0;
				}
			x+=image_xscale*walk_speed;
			if abs(target_x-x)<10 {
				effect_done = false;
				timer = room_speed*3;
				image_index=0;
				sprite_index = spr_peasant_work;
				target_x=-1;
				}
			}
		else {
			if round(image_index) == 0 {
				effect_done = false;
				}
			else if round(image_index) == 6 and !effect_done {
				//global.wood+=global.daily_wood_gather_base;
				current_tree.image_angle+=-3*(image_xscale);
				effect_done = true; 
				}
		
			}
		}
	else {
		if timer == 0 {
			if target_x==-1 {
				target_x = irandom_range(target_instance.x-128,target_instance.x+256);
				image_xscale = sign(target_x-x+0.001);
				sprite_index=spr_peasant_walk;
				image_index = 0;
				}
			x+=image_xscale*walk_speed;
			if abs(target_x-x)<walk_speed {
				timer = room_speed*3;
				sprite_index = spr_peasant;
				image_index=0;
				target_x=-1;
				}
			}
		}
}