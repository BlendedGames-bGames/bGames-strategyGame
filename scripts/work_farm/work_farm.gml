// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function work_farm(){
	if !instance_exists(target_instance){
		with target_instance {
			workers--;
			}
		target_instance = noone;
		state = wander;
		exit;
		}
	var _can_work = !ds_list_empty(target_instance.farm_chunks);
	_can_work = _can_work and (global.time/global.day_time <global.job_endtime);
	_can_work = _can_work and abs(x-(target_instance.x+64))<200;
	if _can_work {
		if timer == 0 {
			if target_x==-1 {

				current_chunk = target_instance.farm_chunks[|irandom(ds_list_size(target_instance.farm_chunks)-1)];

					
				target_x = current_chunk.pos*64+8+irandom(64-8);
				image_xscale = sign(target_x-x+0.001);
				sprite_index=spr_walk;
				image_index = 0;
				}
			x+=image_xscale*global.peasant_walk_speed;
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
				}
			else if round(image_index) == 6 and !effect_done {
				//global.wood+=global.daily_wood_gather_base;
				target_instance.work_ground(current_chunk);
				effect_done = true; 
				}
		
			}
		}
	else {
		if in_range(x,target_instance.x-128,target_instance.x+256) {
			if timer == 0 {
				if target_x==-1 {
					target_x = irandom_range(target_instance.x-128,target_instance.x+256);
					image_xscale = sign(target_x-x+0.001);
					sprite_index=spr_walk;
					image_index = 0;
					}
				x+=image_xscale*global.peasant_walk_speed;
				if abs(target_x-x)<global.peasant_walk_speed*2 {
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
			image_xscale = sign(target_instance.x+64-x+0.001);
			x+=image_xscale*global.peasant_run_speed;
			if timer!=0 {
				timer=0;
				}
			}	
		}
}