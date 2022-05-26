/// @description Insert description here
// You can write your code in this editor

hp = clamp(hp,0,max_hp);

built = built or (hp==max_hp);

if !built {
	yscale = hp/max_hp;
	}
	
event_inherited();

//var _len = ds_list_size(forest_chunks);
//for (var i = 0; i<_len; i++) {
//	var _tree_slot = 0;
//	repeat (3) {
//		_current_tree = global.world.forest_tree[forest_chunks[|i]][_tree_slot];
//		if _current_tree!=-1 {
//			_current_tree.image_angle*=0.9;
//			}
//		_tree_slot++;
//		}
//	}
	
gather = workers_working * efficiency * global.daily_wood_gather;

//light and stuff
var _ratio = global.time / global.day_time;
image_index = (_ratio>0.75);

if need_to_change_lights {
	for (var i = 0 ; i<array_length(lights); i++) {
		lights[i].radius = (_ratio>0.75)*56*built;
		}
	need_to_change_lights = false;
	}

if global.time = 0 or global.time==floor((global.day_time)*.75) {
	need_to_change_lights = true;
	}


