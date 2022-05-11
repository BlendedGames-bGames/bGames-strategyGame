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
	
gather = workers_working * efficienty * global.daily_wood_gather_base;


