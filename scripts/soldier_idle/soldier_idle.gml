// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function soldier_idle(){
	//show_debug_message(string(id)+": step start. Tick: "+string((global.time + clock_offset) mod 10));
	attack_cooldown = max(0,attack_cooldown-1);
	
	
	if sprite_index!=spr_idle {
		sprite_index=spr_idle;
		image_index = 0;
		}
	
	//The soldier will find a target then shoot it.
	//However finding a target is very expensive when you have a lot of soldier
	//so, we check every 10 ticks asynchronously (meaning that some soldiers will attack at tick 0, 1, 2...)
	
	if attack_cooldown == 0 {
		can_attack = true;
		}
	
	if can_attack and ((global.time + clock_offset) mod 10) == 0 {
		show_debug_message(string(id)+": check");
		target_instance = noone;
		if !instance_exists(target_instance) or abs(target_instance.x-x)>=128{
			if instance_number(obj_enemy)!=0 {
				var nearest=collision_line(x-192,y-4,x+192,y-4,obj_enemy,0,true);
				if nearest!=noone {
					target_instance=nearest;
					
					}
				show_debug_message(string(id)+": target "+string(nearest));
				}
			}
		if instance_exists(target_instance) {
			show_debug_message(string(id)+": shooting");
			can_attack = false;
			attack_cooldown = 40;
			image_xscale = sign(target_instance.x-x+0.001);
			var  _factor = abs(target_instance.x-x)/192;
			var _travel_time = room_speed * 1;
			var _aim_x=target_instance.x+irandom(16)*choose(1,-1)*_factor; //the further, the bigger the missing chance
			var yy=global.ground_level+16;
			
			var _behind_wall =collision_line(x,y-8,target_instance.x,y-8,obj_building_wall,0,true);
			
			_behind_wall = (_behind_wall!=noone);
			
			with instance_create_layer(x,y-16,"Units",obj_arrow) {
				gravity = 0.25;
				if _behind_wall {
					hspeed = (_aim_x - x)/_travel_time;
					vspeed = -(yy - y + 0.5 * 0.25 * _travel_time * _travel_time) / _travel_time;
					image_speed = 0;
					image_index = 0;
					image_angle=point_direction(0,0,hspeed,vspeed);
					}
				else {
					speed = 8;
					var dis = other.target_instance.x - x;
					direction = point_direction(x,y-16,other.target_instance.x,other.target_instance.y-32) + (0.5*darcsin(gravity*dis/sqr(speed)));
					}
				}
			}
		}
	}