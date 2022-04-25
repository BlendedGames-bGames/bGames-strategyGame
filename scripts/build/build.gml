// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function build(){
	if !instance_exists(target_instance) or target_instance.built{
		with target_instance {
			builders--;
			}
		target_instance = noone;
		state = wander;
		}
	else if timer == 0 {
		if target_x==-1 {
			target_x = irandom_range(target_instance.x,target_instance.x+sprite_get_width(target_instance.sprite_index));
			image_xscale = sign(target_x-x+0.001);
			sprite_index=spr_peasant_walk;
			image_index = 0;
			}
		x+=image_xscale*walk_speed;
		if abs(target_x-x)<walk_speed*2 {
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
		if round(image_index) == 6 and !effect_done {
			target_instance.hp+=target_instance.hp_per_hit;
			effect_done = true;
			}
		}
	}