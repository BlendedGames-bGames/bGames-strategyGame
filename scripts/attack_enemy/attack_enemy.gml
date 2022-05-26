// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_enemy(){
	attack_cooldown = max(attack_cooldown-1,0);
	
	
	//y(t+1) = y(t) + vspeed(t)
	
	//vspeed is a base variable, meaning that it doesn't need to be applied.
	vspeed=min(vspeed+.25,4);
	y = min(ystart,y);	
	if y == ystart {
		vspeed = 0;
		hspeed = 0;
		can_attack = false;
		}

	if sprite_index == spr_carcass_attack and image_index>12 {
		sprite_index=spr_carcass;
		image_index = 0;
		}

	if attack_cooldown == 0 {
		//if sprite_index!=spr_carcass and sprite_index!=spr_carcass_attack{
		//	sprite_index=spr_carcass;
		//	image_index = 0;
		//	}
		if instance_exists(target) and abs(x-target.x)<64 {
			can_attack = true;
			attack_cooldown = room_speed;
			vspeed = -2;
			hspeed = 4 * image_xscale;
			y-=0.1; //the y gets changed a bit so the hspeed doesn't get affected by the line 15
			
			}
		else {
			state = move_to_attack;
			}
		}
	if can_attack {
		
		if sprite_index!=spr_carcass_attack {
			sprite_index=spr_carcass_attack;
			image_index = 0;
			}
		
		if instance_exists(target) and place_meeting(x-24*image_xscale,y,target) {
			hspeed*=-random_range(0.5,1);
			with target {
				hp-=1;
				if object_index == obj_peasant {
					hit_dir = other.image_xscale;
					vspeed=choose(-2,-3,-4);
					hspeed=4*hit_dir;
					scared_timer=room_speed*2;
					time_before_going_back_to_pos = room_speed*1;
					}
				}
			can_attack = false;
			}
		}
	
}
