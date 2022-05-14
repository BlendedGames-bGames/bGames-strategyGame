// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_furthest_walls(){
	var _furthest_right = global.base;
	var _pos_right = global.base.x;
	
	var _furthest_left = global.base;
	var _pos_left = global.base.x;
	
	with obj_building_wall {
		if x<_pos_left {
			_pos_left = x;
			_furthest_left = self;
			}
		else if x>_pos_right {
			_pos_right = x;
			_furthest_right = self;
			}
		}
	
	if _furthest_left != -1 {
		global.left_wall = _furthest_left;
		}
	if _furthest_right != -1 {
		global.right_wall = _furthest_right;
		}
	global.control_radius_left = min(_furthest_left.x + 160,global.base.x+sprite_get_width(spr_castle2)/2-64);
	global.control_radius_right = max(_furthest_right.x-128,global.base.x+sprite_get_width(spr_castle2)/2+64);
	
	var _size = ds_list_size(global.peasant_list[jobs.soldier]);
	for (var i = 0; i< _size; i++) {
		var _soldier = global.peasant_list[jobs.soldier][|i];
		with _soldier {
			if !is_busy {
				state = move_to_pos;
				}
			}
		}
}