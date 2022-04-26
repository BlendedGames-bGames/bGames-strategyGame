// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_furthest_walls(){
	var _furthest_right = -1;
	var _pos_right = global.base.x;
	
	var _furthest_left = -1;
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
}