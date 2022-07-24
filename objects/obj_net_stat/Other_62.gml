/// @description Insert description here
// You can write your code in this editor

	if ds_map_find_value(async_load, "id") == get {
		
		var _end_time = get_timer();
		show_debug_message(string((_end_time-request_time)/1000)+",");

		//if ds_map_find_value(async_load, "status") == 0 {
		//	var _result = ds_map_find_value(async_load, "result");
		//	try {
		//		switch irandom(4) {
		//			case 0:
		//				//population cap bonus
		//				global.pop_cap_bonus+=5;
		//				break;
		//			case 1: 
		//				// Faster Peasants
		//				global.peasant_run_speed_percent_bonus+=0.25;
		//				global.peasant_walk_speed_percent_bonus+=0.25;
		//				break;
		//			case 2: 
		//				//stronger soldiers
		//				global.soldier_attack_speed_bonus-=0.10;
		//				break;
		//			case 3: 
		//				//build speed bonus
		//				global.build_speed_percent_bonus+=0.25;
		//				break;
		//			//case 4: 
		//			//	//build hp bonus
		//			//	global.building_max_hp_percent_bonus+=0.15;
		//			//	instance_activate_object(obj_building_parent);
		//			//	with obj_building_parent {
		//			//		var _percent = hp/max_hp;
		//			//		max_hp = base_max_hp * (1+global.building_max_hp_percent_bonus);
		//			//		hp = _percent * max_hp;
		//			//		hp_per_hit = max_hp/40;
		//			//		}
		//			//	instance_deactivate_object(obj_building_parent);
		//			//	break;
		//			case 4: 
		//				//gather bonus
		//				global.daily_gather_percent_bonus+=0.25;
		//				break;
		//			}
		//			bgames_modifiers();
		//		}
		//	catch(_err) {
		//		show_debug_message(_err.message);
		//		}
		//	}
		}



