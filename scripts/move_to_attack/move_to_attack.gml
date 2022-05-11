// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_to_attack(){
	target_x = global.world.size*64/2;

	if sprite_index!=spr_carcass_run {
			sprite_index=spr_carcass_run;
			image_index = 0;
			}
	image_xscale = sign(target_x-x+0.001);
	
	if abs(x-target_x)<global.carcass_run_speed*2 {
		if sprite_index!=spr_carcass {
			sprite_index=spr_carcass;
			image_index = 0;
			}
		}
	else {
		x+=image_xscale*global.carcass_run_speed;
		}
	//instead of checking everytime if there's a target it tries to find one every 10 ticks.
	if ((global.time + clock_offset) mod 10) == 0 { 
		potential_target=collision_line(x,y-16,x+image_xscale*48,y-16,obj_building_wall,false,true);
		if potential_target!=noone {
			state=attack_enemy;
			target=potential_target;	
			}
		else {
			potential_target=collision_line(x,y-16,x+image_xscale*48,y-16,obj_peasant,0,true);
			if potential_target!=noone {
				state=attack_enemy;
				target=potential_target;
						
				}
			}
		} 
}