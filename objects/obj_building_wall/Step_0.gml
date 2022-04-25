/// @description Insert description here
// You can write your code in this editor

hp = clamp(hp,0,max_hp);



built = built or (hp==max_hp);

if !built {
	yscale = hp/max_hp;
	}
else {
	if !finished_placing_background_walls {
		if (current_wall_pos+right_side)!=pos and instance_position((current_wall_pos+right_side)*64+8,global.ground_level-8,obj_building_wall) or instance_position((current_wall_pos+right_side)*64+8,global.ground_level-8,obj_building_capitol) {
			finished_placing_background_walls = true;
			}
		else {
			if global.world.wall_y[current_wall_pos]<1 {
				global.world.wall_sprite[current_wall_pos] = spr_wall_bg;
				global.world.wall_y[current_wall_pos]+=0.05;
				}
			else {
				current_wall_pos -= right_side - !right_side;
				}
			}
		}
	}
