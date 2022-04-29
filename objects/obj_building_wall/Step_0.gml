/// @description Insert description here
// You can write your code in this editor

hp = clamp(hp,0,max_hp);



built = built or (hp==max_hp);

if !built {
	yscale = hp/max_hp;
	}
else {
	if can_call_wall_function {
		
		find_furthest_walls();
		can_call_wall_function = false;
		}
	//Wall construction process. Each time a wall is built, it will build background walls until it finds another wall.
	if !finished_placing_background_walls {
		if (pos==current_wall_pos) {
			if global.world.wall_sprite[current_wall_pos]==noone {
				if right_side {
					global.world.wall_sprite[current_wall_pos] = spr_wall_border_right;
					}
				else {
					global.world.wall_sprite[current_wall_pos] = spr_wall_border_left;
					}
				}
			}
		else {
			global.world.wall_sprite[current_wall_pos] = spr_wall_bg;
			}

		if global.world.wall_y[current_wall_pos]<1 {
			global.world.wall_y[current_wall_pos]+=0.05;
			}
		else {
			current_wall_pos -= right_side - !right_side;
			
			var _pos = current_wall_pos + right_side;
			
			if (_pos)!=pos and instance_position((_pos)*64+8,global.ground_level-8,obj_building_wall) or instance_position((_pos)*64+8,global.ground_level-8,obj_building_capitol) {
				finished_placing_background_walls = true;
				}
			}
			
		}
	}
