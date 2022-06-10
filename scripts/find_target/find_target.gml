// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_target(_range){
	if ((floor(global.time) + clock_offset) mod 10) == 0 and !((sprite_index == spr_archer_attack_front or sprite_index == spr_archer_attack_up)){
		if !instance_exists(attack_instance) or abs(attack_instance.x-x)>=_range{
			attack_instance = noone;
			show_debug_message("<<"+string(id)+">>: can find target");
			if instance_number(obj_enemy)!=0 {
				var nearest=collision_line(x-192,global.ground_level-4,x+_range,global.ground_level-4,obj_enemy,0,true);
				if nearest!=noone {
					show_debug_message("<<"+string(id)+">>: target adquired");
					attack_instance=nearest;
					behind_wall = collision_line(x,y-8,attack_instance.x,y-8,obj_building_wall,0,true);
					behind_wall = (behind_wall!=noone);
					attack_cooldown = global.soldier_attack_speed;
					image_index = 0;
					if behind_wall {
						sprite_index=spr_archer_attack_up;
						}
					else {
						sprite_index=spr_archer_attack_front;
						
						}
					}
				}
			}
		}
	}