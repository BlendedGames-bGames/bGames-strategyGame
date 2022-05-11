/// @description Insert description here
// You can write your code in this editor

check_timer = max(0,check_timer-1);

if check_timer==0 {
	check_timer = max_check_timer;
	var _can_be_destroyed = true;
	var _pos;
	for (var i =0; i < image_xscale; i++) {
		_pos = x/64 + i;
		if global.world.chunk_type[_pos]==2 {
			_can_be_destroyed = false;
			}
		}
	if _can_be_destroyed {
		with owner {
			cut_zone=noone;
			}
		with obj_controller {
			if current_menu == menu.structure {
				render_submenu = true;
				}
			}
		instance_destroy();
		
		}
	}
