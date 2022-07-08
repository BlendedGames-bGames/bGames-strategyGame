// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function climb_tower(){
	//show_debug_message("can I stay in tower? :"+string(target_instance.open));
	if instance_exists(target_instance) and target_instance.open {
		y = global.ground_level - 128 + 63;
		x = target_instance.x+6+16*tower_pos;
		//show_debug_message(string(id)+": step start. Tick: "+string((global.time + clock_offset) mod 10));
		attack_cooldown = max(0,attack_cooldown-1);
		time_before_going_back_to_pos = max(0,time_before_going_back_to_pos-1);
		//The soldier will find a target then shoot it.
		//However finding a target is very expensive when you have a lot of soldier
		//so, we check every 10 ticks asynchronously (meaning that some soldiers will attack at tick 0, 1, 2...)
		if (sprite_index!=spr_idle and !((sprite_index == spr_archer_attack_front or sprite_index == spr_archer_attack_up)) )or ((sprite_index == spr_archer_attack_front or sprite_index == spr_archer_attack_up) and image_index>12){
			sprite_index=spr_idle;
			image_index = 0;
			}
	
		if attack_cooldown == 0 {
			attack_instance = noone;
			can_attack = true;
		
			}
	
		if can_attack {
			find_target(192);
			behind_wall = false;
			if floor(image_index)==9 {
				can_attack = false;
				attack_cooldown = global.soldier_attack_speed;
				audio_play_sound_at(choose(snd_arrow_shoot1,snd_arrow_shoot2,snd_arrow_shoot3,snd_arrow_shoot4,snd_arrow_shoot5),x,y,0,64,64,1,0,8);
				with instance_create_layer(x,y-16,"Units_No_Light",obj_arrow) {
					gravity = 0.25;
					speed = 8;
					var dis = other.attack_x - x;
					direction = point_direction(x,y-16,other.attack_x,global.ground_level-32) + (0.5*darcsin(gravity*dis/sqr(speed)));
					}
				}
		
			}
		}	
	else {
		cancel_tower();
		}
}