

var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

if !pause {
	audio_listener_position(x,y,0);
	global.gather_timer = max(global.gather_timer-1,0);
	
	if global.gather_timer == 0 {
		global.gather_timer = room_speed*3;
		collect_resources();
		}
	
	builder_job_assigner();
	lumberjack_job_assigner();
	soldier_job_assigner();
	farmer_job_assigner();
	miner_job_assigner();
	bgames_modifiers();
	if global.time==0 {
		global.day++;
		var _snd = audio_play_sound(choose(snd_dawn1,snd_dawn2,snd_dawn3),9,false);
		audio_sound_gain(_snd,.55,0);
		}
	global.time = ((global.time+1) mod global.day_time);
	
	day_cycle_step();
	
		
	var _can_move_camera = true;
	mouse_hold_time += mouse_hold;

	if device_mouse_check_button_pressed(0,mb_left) {
		
		//pause 
		click_pause(_mouse_x,_mouse_y);

		if current_submenu!=submenu.build_mode {
			//check if selecting a structure
			if current_menu!=menu.place_lumberjack_zone and position_meeting(x-global.w/2+_mouse_x,_mouse_y,obj_building_parent) {
				touched_an_instance = true;
				}
			//moving the camera
			if _can_move_camera and _mouse_y<global.ground_level+32 {
		
				mouse_mode = mouse.moving_camera;
				prev_mouse_pos.x = _mouse_x;
				initial_x = x;
				}
			}
		
		//selection variables reset
		sel_menu = -1;
		sel_submenu = -1;
		sel_index = -1;
		sel_choose_a_menu = false;
		mouse_hold = true;
		
		if _mouse_y>=global.ground_level+32 {
			#region menu select
			for (var i = 0; i<3; i++) {
				if point_in_rectangle(_mouse_x,_mouse_y,32+64*i,room_height-80,32+64*(i+1),room_height-80+48) {
					sel_menu = i;
					sel_choose_a_menu = true;
					render_menu = true;
					render_submenu = true;
					_can_move_camera = false;
					break;
					}		
				}
			#endregion
			#region build menu
			if current_menu == menu.build { 
				if current_submenu == submenu.none { 
					if point_in_button(_mouse_x,_mouse_y,global.w-33-64,room_height-80,64/48,1) {
						sel_menu = current_menu;
						sel_submenu = current_submenu;
						sel_index = 0;
						render_submenu = true;
						_can_move_camera = false;
						}
					else if point_in_button(_mouse_x,_mouse_y,global.w-33-64*2,room_height-80,64/48,1) {
						sel_menu = current_menu;
						sel_submenu = current_submenu;
						sel_index = 1;
						render_submenu = true;
						_can_move_camera = false;
						}
					else if point_in_button(_mouse_x,_mouse_y,global.w-33-64*3,room_height-80,64/48,1) {
						sel_menu = current_menu;
						sel_submenu = current_submenu;
						sel_index = 2;
						render_submenu = true;
						_can_move_camera = false;
						}
					}
				else if current_submenu == submenu.resource_buildings {
					if point_in_button(_mouse_x,_mouse_y,global.w-33-48,room_height-80,1,1) {
						sel_menu = current_menu;
						sel_submenu = current_submenu;
						sel_index = 0;
						render_submenu = true;
						_can_move_camera = false;
						}
					else {
						_can_move_camera = step_building_options(resource_buildings,_mouse_x,_mouse_y);
						}
					}
				else if current_submenu == submenu.civilian_buildings {
					if point_in_button(_mouse_x,_mouse_y,global.w-33-48,room_height-80,1,1) {
						sel_menu = current_menu;
						sel_submenu = current_submenu;
						sel_index = 0;
						render_submenu = true;
						_can_move_camera = false;
						}
					else {
						_can_move_camera = step_building_options(civilian_buildings,_mouse_x,_mouse_y);
						}
					}
				else if current_submenu == submenu.defensive_buildings {
					if point_in_button(_mouse_x,_mouse_y,global.w-33-48,room_height-80,1,1) {
						sel_menu = current_menu;
						sel_submenu = current_submenu;
						sel_index = 0;
						render_submenu = true;
						_can_move_camera = false;
						}
					else {
						_can_move_camera = step_building_options(defensive_buildings,_mouse_x,_mouse_y);
						}
					}
				else if current_submenu == submenu.build_mode {
					if point_in_rectangle(_mouse_x,_mouse_y,global.w-33-48,room_height-80,global.w-33,room_height-80+48) {
						sel_menu = current_menu;
						sel_submenu = current_submenu;
						sel_index = 0;
						render_submenu = true;
						_can_move_camera = false;
						}
					else if can_build and point_in_rectangle(_mouse_x,_mouse_y,global.w-33-48*2,room_height-80,global.w-33-48,room_height-80+48) {
						sel_menu = current_menu;
						sel_submenu = current_submenu;
						sel_index = 1;
						
						render_submenu = true;
						_can_move_camera = false;
						}
					}
				}
			#endregion
			#region structure menu
			else if current_menu == menu.structure {
				if instance_exists(current_instance) {
					if !current_instance.built {
						if point_in_button(_mouse_x,_mouse_y,global.w-33-48,room_height-80,1,1) {
							sel_menu = current_menu;
							sel_submenu = current_submenu;
							sel_index = 0;
							render_submenu = true;
							_can_move_camera = false;
							}
						}
					else if current_instance.object_index == obj_building_lumberjack_hut {
						//chop trees button 
						if point_in_button(_mouse_x,_mouse_y,global.w-33-48,room_height-80,1,1) {
							sel_menu = current_menu;
							sel_submenu = current_submenu;
							sel_index = 0;
							render_submenu = true;
							_can_move_camera = false;
							}
						}
					else if current_instance.object_index == obj_building_watchtower {
						//chop trees button 
						if point_in_button(_mouse_x,_mouse_y,global.w-33-48,room_height-80,1,1) {
							sel_menu = current_menu;
							sel_submenu = current_submenu;
							sel_index = 0;
							render_submenu = true;
							_can_move_camera = false;
							}
						}
					}
				}
			#endregion
			#region demolish
			else if current_menu == menu.demolish {
				if instance_exists(current_instance) and current_instance.object_index != obj_building_capitol {
					if point_in_button(_mouse_x,_mouse_y,global.w-33-48,room_height-80,1,1) {
						sel_menu = current_menu;
						sel_submenu = current_submenu;
						sel_index = 0;
						render_submenu = true;
						_can_move_camera = false;
						}
					else if point_in_button(_mouse_x,_mouse_y,global.w-33-48*2,room_height-80,1,1) {
						sel_menu = current_menu;
						sel_submenu = current_submenu;
						sel_index = 1;
						render_submenu = true;
						_can_move_camera = false;
						}
					}
				}
			#endregion
			#region place lumberjack zone
			else if current_menu = menu.place_lumberjack_zone {
				if point_in_button(_mouse_x,_mouse_y,global.w-33-48,room_height-80,1,1) {
					sel_menu = current_menu;
					sel_submenu = current_submenu;
					sel_index = 0;
					render_submenu = true;
					_can_move_camera = false;
					}
				else if can_build and point_in_button(_mouse_x,_mouse_y,global.w-33-48*2,room_height-80,1,1) {
					sel_menu = current_menu;
					sel_submenu = current_submenu;
					sel_index = 1;
					render_submenu = true;
					_can_move_camera = false;
					}
				else if point_in_button(_mouse_x,_mouse_y,global.w-33-48*3,room_height-80,1,1) {
					sel_menu = current_menu;
					sel_submenu = current_submenu;
					sel_index = 2;
					render_submenu = true;
					_can_move_camera = false;
					}
				else if point_in_button(_mouse_x,_mouse_y,global.w-33-48*4,room_height-80,1,1) {
					sel_menu = current_menu;
					sel_submenu = current_submenu;
					sel_index = 3;
					render_submenu = true;
					_can_move_camera = false;
					}
				}
			#endregion
			}
		
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
							mouse_hold = false;
							_can_move_camera = false;
							break;
							}
						}
					}
				}
			}
		
		}
	else if device_mouse_check_button_released(0,mb_left) {
		mouse_hold = false;
		//HUD handling
		if mouse_hold_time<room_speed/2 and mouse_hold_time > 0{
			
 			if _mouse_y>=global.ground_level+32 {
				#region menu select
				if sel_choose_a_menu {
					if current_menu = menu.structure {
						with current_instance {
							if on_deselected!=-1 {
								on_deselected();
								}
							}
						current_instance = noone;
						}
					current_menu = sel_menu;
					current_submenu = submenu.none;
					current_submenu_function = -1;
					render_menu = true;
					render_submenu = true;
					}		
				#endregion
				#region current submenu events
				else {
					#region build menu
					if sel_menu == menu.build { 
						if sel_submenu == submenu.none { 
							if sel_index == 0 {
								current_submenu = submenu.resource_buildings;
								render_submenu = true;
								_can_move_camera = false;
								}
							else if sel_index == 1 {
								current_submenu = submenu.civilian_buildings;
								render_submenu = true;
								_can_move_camera = false;
								}
							else if sel_index == 2 {
								current_submenu = submenu.defensive_buildings;
								render_submenu = true;
								_can_move_camera = false;
								}
							}
						else if sel_submenu == submenu.resource_buildings or sel_submenu == submenu.defensive_buildings  or sel_submenu == submenu.civilian_buildings {
							if sel_index == 0 {
								current_submenu = submenu.none;
								render_submenu = true;
								_can_move_camera = false;
								}
							else {
								current_submenu = submenu.build_mode;
								current_submenu_function = submenu_build_function;
								build_x = floor((x)/64)*64;
								selected_building = sel_index-1;
								build_x-=floor(global.building_data[selected_building].length/2)*64;
								render_submenu = true;
								_can_move_camera = false;
								}
							}
						else if sel_submenu == submenu.build_mode {
							if sel_index == 0 {
								current_submenu = submenu.none;
								render_submenu = true;
								_can_move_camera = false;
								}
							else if sel_index == 1 {
								var _new_build_site = instance_create_layer(build_x,global.ground_level,"Buildings",global.building_data[selected_building].object);
								current_submenu = submenu.none;
								render_submenu = true;
								var _struct = global.building_data[selected_building];
								global.wood-=_struct.wood_cost;
								global.stone-=_struct.stone_cost;
								_can_move_camera = false;
								}
							}
						}
					#endregion
					#region structure menu 
					else if sel_menu == menu.structure {
					
						if !current_instance.built {
							if sel_index == 0 {
								var _building = current_instance;
								if !_building.built {
									var _id = _building.building_id;
									var _struct = global.building_data[_id];
									global.wood+=_struct.wood_cost;
									global.stone+=_struct.stone_cost;
									}
								
								current_instance = noone;
								with _building {
									instance_destroy();
									}
								current_menu = menu.none;
								render_submenu = true;
								}
							}
						else if current_instance.built {
							if current_instance.object_index == obj_building_lumberjack_hut {
								//chop trees button 
								if sel_index == 0 {
									if current_instance.cut_zone==noone {
										current_menu = menu.place_lumberjack_zone;
										render_submenu = true;
										woodcutting_area.x = floor((x)/64)*64;
										woodcutting_area.image_xscale = 1;
										current_submenu_function = submenu_lumberjack_zone_function;
										}
									else {
										instance_destroy(current_instance.cut_zone);
										current_instance.cut_zone = noone;
										render_submenu = true;
										}
									}
								}
							else if current_instance.object_index = obj_building_watchtower {
								if sel_index == 0 {
									render_submenu = true;
									current_instance.open=!current_instance.open;
									if !current_instance.open {
										current_instance.slots = 0;
										}
									}
								}
							}
						}
					#endregion
					#region place lumberjack zone
					else if sel_menu == menu.place_lumberjack_zone {
						if sel_index == 0 {
							current_menu = menu.structure;
							render_submenu = true;
							_can_move_camera = false;
							}
						else if sel_index == 1 {
							var _new_build_site = instance_create_layer(woodcutting_area.x,global.ground_level,"Buildings",obj_chop_zone);
							_new_build_site.image_xscale = woodcutting_area.image_xscale;
							_new_build_site.owner = current_instance;
							current_instance.cut_zone = _new_build_site;

							current_menu = menu.structure;
							render_submenu = true;
							_can_move_camera = false;
							}
						else if sel_index == 2 {
							woodcutting_area.image_xscale = min(woodcutting_area.image_xscale+1,4);
							}
						else if sel_index == 3 {
							woodcutting_area.image_xscale = max(woodcutting_area.image_xscale-1,1);
							}
						}
						#endregion	
					#region demolish
					else if sel_menu == menu.demolish {
						if instance_exists(current_instance) {
							if sel_index == 0 {
								current_instance = noone;
								render_submenu = true;
								_can_move_camera = false;
								}
							else if sel_index == 1 {
								var _building = current_instance;
								show_debug_message(_building);
								current_instance = noone;
								if !_building.built {
									var _id = _building.building_id;
									var _struct = global.building_data[_id];
									global.wood+=_struct.wood_cost;
									global.stone+=_struct.stone_cost;
									}
								with _building {
									instance_destroy();
									}
								current_menu = menu.none;
								render_submenu = true;
								}
							}
						}
					#endregion
					}
					
					
				#endregion			
				}
			else {
				#region select exploration order
		
				if show_min_button and point_in_rectangle(_mouse_x,_mouse_y,24,global.h/2-24,24+48,global.h/2-24+48) {
					exploration_active[explore.left_side] = !exploration_active[explore.left_side];
					show_debug_message("EXPLORING");
					_can_move_camera = false;
					}
				else if show_max_button and point_in_rectangle(_mouse_x,_mouse_y,global.w-72,global.h/2-24,global.w-72+48,global.h/2-24+48){
					exploration_active[explore.right_side] = !exploration_active[explore.right_side];
					_can_move_camera = false;
					}
				#endregion
				}
			}
		
		mouse_hold_time = 0;
		#region Selecting a building
		if touched_an_instance and abs(initial_x-x)<16 and position_meeting(x-global.w/2+_mouse_x,_mouse_y,obj_building_parent) {
			if current_menu = menu.structure {
				with current_instance {
					if on_deselected!=-1 {
						on_deselected();
						}
					}
				current_instance = noone;
				}
			current_instance = instance_position(x-global.w/2+_mouse_x,_mouse_y,obj_building_parent);
			if current_menu != menu.demolish {
				with current_instance {
					if on_selected!=-1 {
						on_selected();
						}
					}
				current_menu = menu.structure;
				}
			render_menu = true;
			render_submenu = true;
			_can_move_camera = false;
			}
		touched_an_instance = false;
		#endregion
		
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
								_free_peasant_pos = _size-1;
								}
							
							before_switching_jobs(_which_free_peasant);
							
							_which_free_peasant.state = wander;
							_which_free_peasant.job = i;
							_which_free_peasant.is_busy = false;
							ds_list_add(global.peasant_list[target_job],_which_free_peasant);
							ds_list_delete(global.peasant_list[selected_job],_free_peasant_pos);
							
							if i = jobs.soldier {
								_which_free_peasant.spr_walk = spr_archer_walk;
								_which_free_peasant.spr_idle = spr_archer;
								var _size_right = ds_list_size(global.peasant_list[jobs.soldier_right]);
								var _size_left = ds_list_size(global.peasant_list[jobs.soldier_left]);
								if _size_right<_size_left {
									_which_free_peasant.side = 1;
									ds_list_add(global.peasant_list[jobs.soldier_right],_which_free_peasant.id);
									}	
								else {
									_which_free_peasant.side = 0;
									ds_list_add(global.peasant_list[jobs.soldier_left],_which_free_peasant.id);
									}
								}
							else if i == jobs.builder {
								_which_free_peasant.spr_walk = spr_builder_walk;
								_which_free_peasant.spr_idle = spr_builder;
								_which_free_peasant.spr_work = spr_builder_work;
								}
							else if i == jobs.lumberjack {
								_which_free_peasant.spr_walk = spr_builder_walk;
								_which_free_peasant.spr_idle = spr_builder;
								_which_free_peasant.spr_work = spr_builder_work;
								}
							else if i == jobs.unemployed {
								_which_free_peasant.spr_walk = spr_peasant_walk;
								_which_free_peasant.spr_idle = spr_peasant;
								}
							else if i == jobs.farmer {
								_which_free_peasant.spr_walk = spr_farmer_walk;
								_which_free_peasant.spr_idle = spr_farmer;
								_which_free_peasant.spr_work = spr_farmer_work;
								}
							else if i == jobs.miner {
								_which_free_peasant.spr_walk = spr_builder_walk;
								_which_free_peasant.spr_idle = spr_builder;
								_which_free_peasant.spr_work = spr_builder_work;
								}
							
							render_submenu = true;
							break;
							}
						}
					}
				}
			#endregion
			}
		}

	if mouse_hold_time>room_speed {
		mouse_hold = false;
		mouse_hold_time = 0;
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


	camera_set_view_pos(camera,x-global.w/2,16);

	

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
							request_time = get_timer();
							request_type = request.consume;
							bgames_settings_request_timer = bgames_settings_request_wait;
							get = http_post_string(dimensions_post_service+"/spend_attribute/",_str);
							
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
							request_time = get_timer();
							request_type = request.attributes;
							bgames_settings_request_timer = bgames_settings_request_wait;
							get = http_get(dimensions_get_service+"/player_all_attributes/"+string(bgames_user.id));
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
	if keyboard_check_pressed(vk_tab) {
		if bgames_settings_request_timer<=0 {
			if current_pause_menu == bgames_login {
				if bgames_login_selection == 0 {
					bgames_login_selection = 1;
					keyboard_string = bgames_user.password;
					}
				else if bgames_login_selection == 1{
					bgames_login_selection = 0;
					keyboard_string = bgames_user.user;
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

