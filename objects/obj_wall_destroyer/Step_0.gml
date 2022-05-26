/// @description Insert description here
// You can write your code in this editor

//Wall destruction process. It will destroy background walls until it finds another wall.
if !finished_removing_background_walls {
	
	if check_wall {
		if instance_position((current_wall_pos)*64+8,global.ground_level-8,obj_building_wall) or instance_position((current_wall_pos + (right_side - !right_side) )*64+8,global.ground_level-8,obj_building_capitol)  {
			if global.world.wall_sprite[current_wall_pos]==spr_wall_bg {
				if right_side {
					global.world.wall_sprite[current_wall_pos]=spr_wall_border_right; 
					}
				else {
					global.world.wall_sprite[current_wall_pos]=spr_wall_border_left; 
					}
				}
			
			finished_removing_background_walls = true;
			exit;
			}
		check_wall = false;
		}
	
	if (pos==current_wall_pos) {
		if global.world.wall_sprite[current_wall_pos]==spr_wall_bg {
			finished_removing_background_walls = true;
			exit;
			}
		}
	if global.world.wall_y[current_wall_pos]>0 {
		global.world.wall_y[current_wall_pos]-=0.05;
		}
	else {
		 global.world.wall_sprite[current_wall_pos]=noone;
		current_wall_pos -= right_side - !right_side;
		check_wall = true;
		}
	}
else {
	instance_destroy();
	}
