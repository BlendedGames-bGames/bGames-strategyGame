// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function soldier_idle(){
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
		if time_before_going_back_to_pos==0 and !instance_exists(attack_instance) and abs(x-target_x)>global.peasant_run_speed*2 and sprite_index == spr_archer {
				state = move_to_pos;
			}	
		}
	
	if can_attack {
		find_target(192);
		if instance_exists(attack_instance) {
			image_xscale = sign(attack_x-x+0.001);
			attack_x = attack_instance.x;
			}
		if floor(image_index)==9 {
			can_attack = false;
			attack_cooldown = global.soldier_attack_speed;
			var  _factor = abs(attack_x-x)/192;
			var _travel_time = room_speed * 1;
			var _aim_x=attack_x+irandom(16)*choose(1,-1)*_factor; //the further, the bigger the missing chance
			var yy=global.ground_level+16;
			audio_play_sound_at(choose(snd_arrow_shoot1,snd_arrow_shoot2,snd_arrow_shoot3,snd_arrow_shoot4,snd_arrow_shoot5),x,y,0,64,64,1,0,8);
			with instance_create_layer(x,y-16,"Units_No_Light",obj_arrow) {
				gravity = 0.25;
				if other.behind_wall {
					hspeed = (_aim_x - x)/_travel_time;
					vspeed = -(yy - y + 0.5 * 0.25 * _travel_time * _travel_time) / _travel_time;
					image_speed = 0;
					image_index = 0;
					image_angle=point_direction(0,0,hspeed,vspeed);
					}
				else {
					speed = 8;
					var dis = other.attack_x - x;
					direction = point_direction(x,y-16,other.attack_x,global.ground_level-32) + (0.5*darcsin(gravity*dis/sqr(speed)));
					}
				}
			}
		
		}
		
	}