/// @description Insert description here
// You can write your code in this editor
if bgames_settings_request_timer>0 {
	if ds_map_find_value(async_load, "id") == get {
		var _end_time = get_timer();
		show_debug_message("time: "+string((_end_time-request_time)/1000)+"ms");
		
		if request_type = request.login {
			if ds_map_find_value(async_load, "status") == 0 {
				var _result = ds_map_find_value(async_load, "result");
				
				try {
					bgames_user.id = real(_result);
					current_pause_menu = bgames_settings;
					bgames_user_has_logon = true;
						
					}
				catch(_err) {
					show_debug_message(_err.message);
					error_message.content="Couldn't log in."
					error_message.time = room_speed*3;
					}
					
				}
			else {
				error_message.content="Service unavailable"
				error_message.time = room_speed*3;
				}
			}
		else if request_type = request.attributes {
			if ds_map_find_value(async_load, "status") == 0 {
				var _result = ds_map_find_value(async_load, "result");
				try {
					var _temp_map=ds_map_create();
					
					_temp_map = json_decode(_result);
					//ds_list_clear(bgames_attributes);
					//var _size=ds_map_size(temp_map);
					bgames_attributes = json_parse(_result);
					
					}
				catch(_err) {
					show_debug_message(_err.message);
					error_message.content="Couldn't get attributes."
					error_message.time = room_speed*3;
					}
				}
			}
		else if request_type = request.consume {
			if ds_map_find_value(async_load, "status") == 0 {
				var _result = ds_map_find_value(async_load, "result");
				try {
					
					current_pause_menu = bgames_bonus;
					bgames_bonus[bgames_selected_item][shop.times_bought]++;
					switch bgames_selected_item {
						case 0:
							//population cap bonus
							global.pop_cap_bonus+=5;
							break;
						case 1: 
							// Faster Peasants
							global.peasant_run_speed_percent_bonus+=0.25;
							global.peasant_walk_speed_percent_bonus+=0.25;
							break;
						case 2: 
							//stronger soldiers
							global.soldier_attack_speed_bonus-=0.10;
							break;
						case 3: 
							//build speed bonus
							global.build_speed_percent_bonus+=0.25;
							break;
						//case 4: 
						//	//build hp bonus
						//	global.building_max_hp_percent_bonus+=0.15;
						//	instance_activate_object(obj_building_parent);
						//	with obj_building_parent {
						//		var _percent = hp/max_hp;
						//		max_hp = base_max_hp * (1+global.building_max_hp_percent_bonus);
						//		hp = _percent * max_hp;
						//		hp_per_hit = max_hp/40;
						//		}
						//	instance_deactivate_object(obj_building_parent);
						//	break;
						case 4: 
							//gather bonus
							global.daily_gather_percent_bonus+=0.25;
							break;
						}
						bgames_modifiers();
						render_resources = true;
					
					}
				catch(_err) {
					show_debug_message(_err.message);
					error_message.content="Couldn't get attributes."
					error_message.time = room_speed*3;
					}
				}
			}
		}
	request_type = -1;
	bgames_settings_request_timer = 0;
	}
