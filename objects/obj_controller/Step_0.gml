

var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

#region Camera control & HUD/units selection
if !pause {
	
	
	global.gather_timer = max(global.gather_timer-1,0);
	if global.gather_timer == 0 {
		global.gather_timer = room_speed*3;
		collect_resources();
		}
	
	if device_mouse_check_button_pressed(0,mb_left) {
		var _can_move_camera = true;
	
		//pause 
		click_pause(_mouse_x,_mouse_y);
	
		//HUD handling
		if _mouse_y>=global.ground_level+32 {
			
			#region menu select
			for (var i = 0; i<3; i++) {
				if point_in_rectangle(_mouse_x,_mouse_y,32+72*i,room_height-80,32+72*(i+1),room_height-80+48) {
					current_menu = i;
					current_submenu = submenu.none;
					current_submenu_function = -1;
					render_menu = true;
					render_submenu = true;
					_can_move_camera = false;
					break;
					}		
				}
			#endregion
			
			#region select building to build 
			if _can_move_camera {
				if current_menu==menu.job { 
					if current_submenu == submenu.none {
						// Check if moving peasants between jobs
						for (var i = 0; i<6; i++) {
							if !ds_list_empty(global.peasant_list[i]) {
								if (i == 0 and point_in_rectangle(_mouse_x,_mouse_y,global.w-33-64,room_height-80,global.w-33,room_height-80+48)) or
									(i != 0 and point_in_rectangle(_mouse_x,_mouse_y,global.w-33-64-48*i,room_height-80,global.w-33-64-48*(i-1),room_height-80+48)) {
									current_submenu = submenu.moving_peasant;
									current_submenu_function = submenu_peasant_function;
									selected_job = i;
									target_job = i;
									_can_move_camera = false;
									break;
									}
								}
							}
						}
					}
				else if current_menu == menu.build { 
					if current_submenu == submenu.none { 
						for (var i = 0; i<8; i++) {
							if point_in_rectangle(_mouse_x,_mouse_y,global.w-33-48*(i+1),room_height-80,global.w-33-48*(i),room_height-80+48) {
								current_submenu = submenu.build_mode;
								current_submenu_function = submenu_build_function;
								build_x = floor((x)/64)*64;
								selected_building = i;
								render_submenu = true;
								_can_move_camera = false;
							
								break;
								}
							}
						}
					else if current_submenu == submenu.build_mode {
						if point_in_rectangle(_mouse_x,_mouse_y,global.w-33-48,room_height-80,global.w-33,room_height-80+48) {
							current_submenu = submenu.none;
							render_submenu = true;
							_can_move_camera = false;
							}
						else if can_build and point_in_rectangle(_mouse_x,_mouse_y,global.w-33-48*2,room_height-80,global.w-33-48,room_height-80+48) {
							var _new_build_site = instance_create_layer(build_x,global.ground_level,"Buildings",global.building_data[selected_building].object)
							ds_list_add(global.building_in_need,_new_build_site);
							current_submenu = submenu.none;
							render_submenu = true;
							_can_move_camera = false;
							}
						}
					}
				else if current_menu = menu.structure {
					
					if !current_instance.built {
						if point_in_button(_mouse_x,_mouse_y,global.w-33-48,room_height-80,1,1) {
							
							var _building = current_instance;
							show_debug_message(_building);
							current_instance = noone;
							with _building {
								instance_destroy();
								}
							current_menu = submenu.none;
							}
						}
					else if current_instance.object_index == obj_building_lumberjack_hut {
						//chop trees button 
						if point_in_button(_mouse_x,_mouse_y,global.w-33-48,room_height-80,1,1) {
							show_debug_message("chop chop");
							}
						}
					}
				}
			#endregion			
			}
			
		//select exploration order
		
		if show_min_button and point_in_rectangle(_mouse_x,_mouse_y,24,global.h/2-24,24+48,global.h/2-24+48) {
			exploration_active[explore.left_side] = !exploration_active[explore.left_side];
			show_debug_message("EXPLORING");
			_can_move_camera = false;
			}
		else if show_max_button and point_in_rectangle(_mouse_x,_mouse_y,global.w-72,global.h/2-24,global.w-72+48,global.h/2-24+48){
			exploration_active[explore.right_side] = !exploration_active[explore.right_side];
			_can_move_camera = false;
			}
		
		//check if selecting a structure
		if position_meeting(x-global.w/2+_mouse_x,_mouse_y,obj_building_parent) {
			touched_an_instance = true;
			}
		//moving the camera
		if _can_move_camera and current_submenu!=submenu.build_mode and _mouse_y<global.ground_level+32 {
		
			mouse_mode = mouse.moving_camera;
			prev_mouse_pos.x = _mouse_x;
			initial_x = x;
			}
		}
	else if device_mouse_check_button_released(0,mb_left) {
		if touched_an_instance and abs(initial_x-x)<16 and position_meeting(x-global.w/2+_mouse_x,_mouse_y,obj_building_parent) {
			current_instance = instance_position(x-global.w/2+_mouse_x,_mouse_y,obj_building_parent);
			current_menu = menu.structure;
			render_menu = true;
			render_submenu = true;
			_can_move_camera = false;
			}
		touched_an_instance = false;
		if mouse_mode == mouse.moving_camera {
			mouse_mode = mouse.idle;
			}
		else {
			#region dropping peasants between jobs
			if current_submenu == submenu.moving_peasant {
				current_submenu = submenu.none;
				current_submenu_function = -1;
				for (var i = 0; i<6; i++) {
					if (target_job == i and selected_job!=i) {
						if (i == 0 and point_in_rectangle(_mouse_x,_mouse_y,global.w-33-64,room_height-80,global.w-33,room_height-80+48)) or
						   (i !=0 and point_in_rectangle(_mouse_x,_mouse_y,global.w-33-64-48*i,room_height-80,global.w-33-64-48*(i-1),room_height-80+48)) {
							var _which_free_peasant = -1;
							var _free_peasant_pos = -1;
							var _size = ds_list_size(global.peasant_list[selected_job]);
							//Select a peasant not doing tasks
							for (var k = 0; k<_size; k++) {
								var _peasant = global.peasant_list[selected_job][|k];
								if _peasant.state == wander {
									_which_free_peasant = _peasant;
									_free_peasant_pos = k;
									break;
									}
								}
							//If every peasant is occupied
							if _which_free_peasant == -1 {
								_which_free_peasant = global.peasant_list[selected_job][|_size-1];
								_free_peasant_pos = _size-1;
								}
							

							if _which_free_peasant.job=jobs.builder {
								if _which_free_peasant.target_instance!=noone {
									_which_free_peasant.target_instance.builders--;
									}
								}
							else if _which_free_peasant.job=jobs.lumberjack {
								if _which_free_peasant.target_instance!=noone {
									_which_free_peasant.target_instance.workers--;
									if _which_free_peasant.state == work_lumberjack {
	
										_which_free_peasant.target_instance.workers_working--;
										}
									}
								}
							else if _which_free_peasant.job=jobs.soldier {
								if _which_free_peasant.state==explore_new_land {
									units_exploring[_which_free_peasant.target_side]--;
									units_going_to_explore[_which_free_peasant.target_side]--;
									
									}
								else if _which_free_peasant.state==move_to_pos {
									units_going_to_explore[_which_free_peasant.target_side]--;
									}
								}
							_which_free_peasant.state = wander;
							_which_free_peasant.job = i;
							ds_list_add(global.peasant_list[target_job],_which_free_peasant);
							ds_list_delete(global.peasant_list[selected_job],_free_peasant_pos);
							render_submenu = true;
							break;
							}
						}
					}
				}
			#endregion
			}
		}

	if current_submenu_function!=-1 current_submenu_function(_mouse_x,_mouse_y);

	if (mouse_mode == mouse.moving_camera) {
		camera_acceleration.x = (prev_mouse_pos.x - _mouse_x);
		}
	else {
		var _left_border = (min_camera_chunk)*64+global.w/2;
		var _right_border = (max_camera_chunk)*64-global.w/2;

		show_min_button = (x<=_left_border);
		show_max_button = (x>=_right_border);
		camera_acceleration.x *=.9;
		if show_min_button {
			camera_acceleration.x = 0;
			x+=(_left_border-x)/10;
			}
		else if show_max_button {
			camera_acceleration.x = 0;
			x+=(_right_border-x)/10;
			}
		}
	
	x += camera_acceleration.x;
	var _left_border = max(0,(min_camera_chunk-1)*64)+global.w/2;
	var _right_border = min(global.world.size*64,(max_camera_chunk+1)*64)-global.w/2;
	x = clamp(x,_left_border,_right_border);


	camera_set_view_pos(camera,x-global.w/2,0);

	#endregion

	builder_job_assigner();
	lumberjack_job_assigner();
	exploration_job_assigner();
	global.time++;

}
else {
	error_message.time = max(error_message.time-1,0);
	if input {
		if bgames_login_selection == 0 {
			bgames_user.user = keyboard_string;
			}
		else if bgames_login_selection == 1 {
			bgames_user.password = keyboard_string;
			}
		}
	if os_type==os_android and keyboard_check_pressed(vk_return) {
		keyboard_virtual_hide(); 
		input = false;
		}
	if device_mouse_check_button_pressed(0,mb_left) {
		if bgames_settings_request_timer<=0 {
			var _guiw = global.w;
			var _guih = global.h;
			var _len = array_length(current_pause_menu);
		
			if current_pause_menu == main_options {
				main_options_step(_mouse_x,_mouse_y,_len);
				}
			else if current_pause_menu == bgames_login {
				bgames_login_step(_mouse_x,_mouse_y);
				}
			else if current_pause_menu == bgames_settings {
				bgames_settings_step(_mouse_x,_mouse_y,_len);
				}
			//else if current_pause_menu == bgames_get_points {
			//	bgames_get_points_step(_mouse_x,_mouse_y,_len);
			//	}
			else if current_pause_menu == bgames_payment_method {
				_len = array_length(bgames_attributes);
				for (var i = 0; i < _len ;i++) {
					var _yy = _guih/2 - 160;
					if point_in_rectangle(_mouse_x,_mouse_y,_guiw/2-1.5*128+(i mod 3) * 128+16,_yy+128*floor(i/3),_guiw/2-1.5*128+(i mod 3) * 128+16+96,_yy+128*floor(i/3)+96) {
						if bgames_attributes[i].data>=bgames_prices[bgames_bonus[bgames_selected_item][shop.times_bought]] {	
							var _str = "id_player="+string(bgames_user.id)+
							           "&id_attributes="+string(bgames_attributes[i].id_attributes)+
									   "&new_data="+string( bgames_prices[bgames_bonus[bgames_selected_item][shop.times_bought]]);
							
							get = http_post_string(dimensions_post_service+"/spend_attribute/",_str);
							request_type = request.consume;
							bgames_settings_request_timer = bgames_settings_request_wait;
							
							}
						break;
						}
					}
				if point_in_rectangle(_mouse_x,_mouse_y,_guiw/2-3.75*48,_guih-80,_guiw/2+(7.5-3.75)*48,_guih-80+48) {
					current_pause_menu = bgames_bonus;
					}
				}
			else if current_pause_menu == bgames_bonus {
				for (var i = 0; i < _len ;i++) {
					var _yy = _guih/2 - _len*54/2;
					if point_in_rectangle(_mouse_x,_mouse_y,_guiw/2-1.5*128+(i mod 3) * 128+16,_yy+128*floor(i/3),_guiw/2-1.5*128+(i mod 3) * 128+16+96,_yy+128*floor(i/3)+96) {
						if bgames_bonus[i][shop.times_bought]<bgames_bonus[i][shop.max_stock] {
							current_pause_menu = bgames_payment_method;
							bgames_selected_item = i;
							
							get = http_get(dimensions_get_service+"/player_all_attributes/"+string(bgames_user.id));	
							request_type = request.attributes;
							bgames_settings_request_timer = bgames_settings_request_wait;
							
							}
						break;
						}
					}
				if point_in_rectangle(_mouse_x,_mouse_y,_guiw/2-3.75*48,_guih-80,_guiw/2+(7.5-3.75)*48,_guih-80+48) {
					current_pause_menu = bgames_settings;
					}
				}
			}
		}
	if bgames_settings_request_timer>0 {
		bgames_settings_request_timer = max(0, bgames_settings_request_timer-1);
		bgames_login_angle+=6;
		} 
	
	}

//save previous mouse position
prev_mouse_pos.x = _mouse_x;

