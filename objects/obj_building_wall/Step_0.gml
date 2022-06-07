/// @description Insert description here
// You can write your code in this editor



event_inherited();

built = built or (hp==max_hp);

if !built {
	yscale = hp/max_hp;
	}
else {
	hp = clamp(hp,0,max_hp);
	yscale = 1;
	if can_call_wall_function {
		
		find_furthest_walls();
		can_call_wall_function = false;
		}
	//Wall construction process. Each time a wall is built, it will build background walls until it finds another wall.
	if !finished_placing_background_walls {
		is_in_invalid_place = false;
		if global.world.chunk_type[current_wall_pos] >=3 {
			current_wall_pos -= right_side - !right_side;
			check_wall = true;
			is_in_invalid_place = true;
			}
		if check_wall {
			if ((current_wall_pos)!=pos and ( instance_position((current_wall_pos)*64+8,global.ground_level-8,obj_building_wall)) or instance_position((current_wall_pos + (right_side - !right_side) )*64+8,global.ground_level-8,obj_building_capitol) ) {
				finished_placing_background_walls = true;
				}
			check_wall = false;
			}
		if !is_in_invalid_place {
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
				check_wall = true;
				}
			}
		}
	}
