// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_building_options(_array,_mouse_x,_mouse_y){
	var _size = array_length(_array);
	for (var i = 0; i<_size; i++) {
		if point_in_rectangle(_mouse_x,_mouse_y,global.w-33-48*(i+2),room_height-80,global.w-33-48*(i),room_height-80+48) {
			var _struct = global.building_data[_array[i]];
			if (_struct.wood_cost-global.wood)<=0 and (_struct.stone_cost-global.stone)<=0 {
				sel_menu = current_menu;
				sel_submenu = current_submenu;
				sel_index = _array[i]+1;
				render_resources= true;
				render_submenu = true;
				return false;
				}
			break;
			}
		}
	return true;
}