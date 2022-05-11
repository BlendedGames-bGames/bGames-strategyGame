/// @description Insert description here
// You can write your code in this editor


//Mouse states
enum mouse {
	idle,
	moving_camera
	}
	
enum menu {
	job,
	build,
	combat,
	structure,
	place_lumberjack_zone,
	none
	}

enum submenu {
	none,
	moving_peasant,
	build_mode
	}

enum jobs {
	unemployed,
	builder,
	lumberjack,
	miner,
	farmer,
	soldier,
	soldier_left,
	soldier_right
	}	

enum buildings {
	lumberjack_hut,
	mining_camp,
	windmill,
	barraks,
	house,
	lab,
	tower,
	wall,
	town_center
	}	
	
enum shop {
	name,
	times_bought,
	max_stock
	}	
	
enum explore {
	left_side,
	right_side
	}
	
enum request {
	login,
	attributes,
	consume
	}	
	
//Camera variables
camera = view_camera[0];
cam_dist = -192;
cam_fov = 90;
cam_asp=global.w/global.h;
view_mat = -1;
proj_mat = -1;

mouse_hold = 0;
mouse_hold_time = 0;

//application_surface_draw_enable(false);

//Utility movement variables
prev_mouse_pos = new Vector(0,0);
camera_acceleration = new Vector(0,0);
mouse_mode = mouse.idle;


show_min_button = false;
show_max_button = false;

global.ground_level = room_height-112;

//scouting variables
for (var i = 0; i<2; i++) {
	units_going_to_explore[i] = 0;
	units_exploring[i] = 0;
	exploration_active[i] = 0;
	exploration_progress[i] = 0;
	exploration_cooldown[i] = 0;
	}

exploration_wait_value = room_speed*10;
exploration_progress_target = room_speed*10;
exploration_chunk_reward = 10;


//hud variables

current_menu = menu.none;
current_submenu = submenu.none;
current_submenu_function = -1;
current_instance = noone;
touched_an_instance = false;

//job-handling variables
selected_job = -1;
target_job = -1;

/*
HUD buttons are activated in a two step process:
 1) when the player presses the left mouse button or finger taps, the game detects which button the player touched
 2) when the player releases the button, the game will act according to that pressed button
*/
sel_menu = -1;
sel_submenu = -1;
sel_index = -1;
sel_choose_a_menu = false;

//build-handling variables

global.building_data = define_building_info();
selected_building = -1;
build_x = -1;
base_build_x = 0;
can_build = true;
moving_building = false;
mouse_x_old = 0;
initial_x = 0;

//wood cut variables

woodcutting_area = {
	x : 0,
	image_xscale : 1,
	}


//base area and control
global.control_radius_left = 0;
global.control_radius_right = 0;
global.left_wall = noone;
global.right_wall = noone;

//in-game variables

global.time = 0;

global.gather_timer = 0;

global.peasant_list[jobs.unemployed] = ds_list_create();
global.peasant_list[jobs.builder] = ds_list_create();
global.peasant_list[jobs.miner] = ds_list_create();
global.peasant_list[jobs.lumberjack] = ds_list_create();
global.peasant_list[jobs.farmer] = ds_list_create();
global.peasant_list[jobs.soldier] = ds_list_create();

global.peasant_list[jobs.soldier_left] = ds_list_create();
global.peasant_list[jobs.soldier_right] = ds_list_create();

initialize_global_modifiers();

instance_create_layer(0,0,"Ground",obj_ground);
show_debug_overlay(1);

#region surface definition
//surfaces are used as an empty canvas. It's the image equivalent of a C pointer.
surf_menu = -1;
render_menu = true;

surf_submenu = -1;
render_submenu = true;

surf_resources = -1;
render_resources = true;

//surf_parallax = -1;

surf_pause = -1;

surf_lighting = -1;

surf_entities = -1;
#endregion

//pause variables
pause_sprite = noone;
pause = false;

main_options[0] = "Continue";
main_options[1] = "bGames Settings";
main_options[2] = "Settings";
main_options[3] = "Quit";

#region bgames variables

bgames_settings[0] = "Consume points";
bgames_settings[1] = "Log out";
bgames_settings[2] = "Go back";

bgames_get_points[0][0] = 10; //tokens
bgames_get_points[0][1] = 1; //bgames points

bgames_get_points[1][0] = 25;
bgames_get_points[1][1] = 2; //bgames points

bgames_get_points[2][0] = 50;
bgames_get_points[2][1] = 3; //bgames points

bgames_get_points[3][0] = 100;
bgames_get_points[3][1] = 5; //bgames points

bgames_get_points[4][0] = 250;
bgames_get_points[4][1] = 8; //bgames points

bgames_get_points[5][0] = 500;
bgames_get_points[5][1] = 12; //bgames points

bgames_payment_method[0] = "Go back";

bgames_bonus[0][shop.name] = "+5 Town size";
bgames_bonus[0][shop.times_bought] = 0;
bgames_bonus[0][shop.max_stock] = 3;

bgames_bonus[1][0] = "Faster Peasants";
bgames_bonus[1][shop.times_bought] = 0;
bgames_bonus[1][shop.max_stock] = 3;

bgames_bonus[2][0] = "Stronger\nSoldiers";
bgames_bonus[2][shop.times_bought] = 0;
bgames_bonus[2][shop.max_stock] = 3;

bgames_bonus[3][0] = "Build faster";
bgames_bonus[3][shop.times_bought] = 0;
bgames_bonus[3][shop.max_stock] = 3;

//bgames_bonus[4][0] = "Stronger\nBuildings";
//bgames_bonus[4][shop.times_bought] = 0;
//bgames_bonus[4][shop.max_stock] = 3;

bgames_bonus[4][0] = "Gather bonus";
bgames_bonus[4][shop.times_bought] = 0;
bgames_bonus[4][shop.max_stock] = 3;

bgames_prices = [1, 2, 3];


bgames_login[0] = "Log In";
bgames_login[1] = "Go Back";

bgames_selected_item = 0; //selected bonus when consuming bgames points


bgames_settings_request_timer = 0;
bgames_settings_request_wait = room_speed*5;


bgames_login_angle = 0;
bgames_login_selection = -1; //0 = user, 1 = pass, -1 = noone
bgames_user_has_logon = false;
bgames_user = {
	user: "",
	password: "",
	id: -1
	}
input = false;

//bgames_attributes = ds_list_create();

bgames_attributes = noone
get = 1;
request_type = -1;

//bgames_attributes[0] = {
//	name: "Social",
//	data: 2
//	}

current_pause_menu = main_options;



error_message = {
	content : "",
	time : 0
	}

user_management_service = "http://164.90.156.141:3010";
dimensions_get_service = "http://164.90.156.141:3001";
dimensions_post_service = "http://164.90.156.141:3002";
#endregion

#region day night cycle variables

dawn_color = new Color(make_color_rgb(187,163,176),make_color_rgb(216,211,218),make_color_rgb(151,146,176));
day_color  = new Color(make_color_rgb(236,245,231),make_color_rgb(107,179,218),make_color_rgb(83,141,192));
dusk_color = new Color(make_color_rgb(255,108,0),  make_color_rgb(178,155,137),make_color_rgb(114,122,145));
night_color = new Color(make_color_rgb(87,102,118),  make_color_rgb(37,44,51),   make_color_rgb(13,14,38));

current_color = new Color(make_color_rgb(230,164,128),make_color_rgb(55,56,92),make_color_rgb(33,38,96));

parallax_color = c_white;

time_ratio = 0;
night_factor = 0;
dawn_factor = 0;
dusk_factor = 0;

#endregion

#region shader variables

u_vLightCoord = shader_get_uniform(shd_lighting,"u_vLightCoord");
u_fLightRadius = shader_get_uniform(shd_lighting,"u_fLightRadius");
u_lightTex = shader_get_sampler_index(shd_lightmap_cutter, "u_sLightMap");

#endregion


#region submenu methods. Constant functions used when a submenu or menu is active

submenu_build_function = function(_mouse_x,_mouse_y) {
	if device_mouse_check_button_pressed(0,mb_left) and point_in_rectangle(_mouse_x,_mouse_y,build_x-(x-global.w/2),0,build_x-(x-global.w/2)+sprite_get_width(global.building_data[selected_building].sprite_index),global.ground_level+32) {
		moving_building = true;
		base_build_x = build_x;
		mouse_x_old = _mouse_x;
		}
	else if device_mouse_check_button_released(0,mb_left) {
		moving_building = false;
		}
	if moving_building {
		var _mouse_diff = floor((_mouse_x-mouse_x_old)/64)*64;
		build_x = base_build_x+_mouse_diff;
		}
		
	can_build = true;
	for (var i = 0; i < global.building_data[selected_building].length; i++) {
		if position_meeting(build_x+32+i*64,global.ground_level-16,obj_building_parent) {
			can_build = false;
			break;
			}
		}
	}
	
submenu_lumberjack_zone_function = function(_mouse_x,_mouse_y) {

	woodcutting_area.x = floor((x)/64)*64 - floor(woodcutting_area.image_xscale/2)*64; 
	can_build = true;
	for (var i = 0; i < woodcutting_area.image_xscale; i++) {
		if position_meeting(woodcutting_area.x+32+i*64,global.ground_level-16,obj_chop_zone) {
			can_build = false;
			break;
			}
	
		}
	}	

submenu_peasant_function = function(_mouse_x,_mouse_y) {
	for (var i = 0; i<6; i++) {
		if (i == 0 and point_in_rectangle(_mouse_x,_mouse_y,global.w-33-64,room_height-80,global.w-33,room_height-80+48)) or
			(i != 0 and point_in_rectangle(_mouse_x,_mouse_y,global.w-33-64-48*i,room_height-80,global.w-33-64-48*(i-1),room_height-80+48)) {
			target_job = i;
			break;
			}
		}
	}	

#endregion

click_pause = function(_mouse_x,_mouse_y) {
	if !pause and point_in_rectangle(_mouse_x,_mouse_y,24,24,72,72) {
		instance_deactivate_all(1);
		pause_sprite = sprite_create_from_surface(application_surface,0,0,res_w,res_h,0,0,0,0);
		pause = true;
		exit;
		}
	}



//day night cycle functions

day_cycle_step = function() {
	time_ratio = global.time*360/global.day_time;
	//night_factor=min(1,max(dsin(time_ratio+180)*3,0));
	//dawn_factor=max(dcos(time_ratio),0);
	//dusk_factor=max(dcos(time_ratio+180),0);
	//dusk_factor*=dusk_factor;
	
	dawn_factor=max(dcos(time_ratio),0);
	dusk_factor = dsin(clamp(time_ratio-180,0,180));
	night_factor = min(dsin(clamp(time_ratio-270,0,90)*2)*3,1);

	current_color.bot = merge_color(day_color.bot,dawn_color.bot,dawn_factor);
	current_color.bot = merge_color(current_color.bot,dusk_color.bot,dusk_factor);
	current_color.bot = merge_color(current_color.bot,night_color.bot,night_factor);
	
	current_color.mid = merge_color(day_color.mid,dawn_color.mid,dawn_factor);
	current_color.mid = merge_color(current_color.mid,dusk_color.mid,dusk_factor);
	current_color.mid = merge_color(current_color.mid,night_color.mid,night_factor);
	
	current_color.top = merge_color(day_color.top,dawn_color.top,dawn_factor);
	current_color.top = merge_color(current_color.top,dusk_color.top,dusk_factor);
	current_color.top = merge_color(current_color.top,night_color.top,night_factor);
	
	parallax_color = merge_color(c_white,make_color_rgb(35,12,26),dawn_factor*.5);
	parallax_color = merge_color(parallax_color,dusk_color.mid,dusk_factor);
	parallax_color = merge_color(parallax_color,night_color.bot,night_factor);
	
	shadow_color = merge_color(c_white,make_color_rgb(35,12,26),dawn_factor*.5);
	shadow_color = merge_color(shadow_color,dusk_color.mid,dusk_factor);
	shadow_color = merge_color(shadow_color,make_color_rgb(22,27,31),night_factor);
	
	}

//pause methods 

main_options_step = function(_mouse_x,_mouse_y,_len) {
	for (var i = 0; i < _len ;i++) {
		var _yy = global.h/2 - _len*54/2;
		if point_in_rectangle(_mouse_x,_mouse_y,global.w/2-3*48,_yy+54*i,global.w/2+3*48,_yy+54*i+48) {
			switch (i) {
				case 0: {
					pause = false;
					
					instance_activate_all();
					break;
					}
				case 1: {
					if !bgames_user_has_logon {
						current_pause_menu = bgames_login;
						}
					else {
						current_pause_menu = bgames_settings;
						}
					break;
					}
				}
			break;
			}
		}
	}

bgames_settings_step = function(_mouse_x,_mouse_y,_len) {
	for (var i = 0; i < _len ;i++) {
		var _yy = global.h/2 - _len*54/2;
		if point_in_rectangle(_mouse_x,_mouse_y,global.w/2-3*48,_yy+54*i,global.w/2+3*48,_yy+54*i+48) {
			switch (i) {
				case 0: {
					current_pause_menu = bgames_bonus;
					break;
					}
				case 1: {
					bgames_user.id = -1;
					bgames_user_has_logon = false;
					current_pause_menu = bgames_login;
					break;
					}
				case 2: {
					current_pause_menu = main_options;
					break;
					}
				}
			break;
			}
		}
	}
	
bgames_login_step = function(_mouse_x,_mouse_y) {
	var _yy = global.h/2-56*1.5;
			
	if point_in_button(_mouse_x,_mouse_y,global.w/2-3*48,_yy+96,2.5,.75) {//if mouse in login button
		get = http_get(user_management_service+"/player/"+bgames_user.user+"/"+bgames_user.password);	
		request_type = request.login;
		bgames_settings_request_timer = bgames_settings_request_wait;
		input = false;
		}
	else if point_in_button(_mouse_x,_mouse_y,global.w/2+24,_yy+96,2.5,.75) { //if mouse in go back button
		current_pause_menu = main_options;
		input = false;
		}
			
	else if point_in_button(_mouse_x,_mouse_y,global.w/2-3*48,_yy,6,.75) { //if mouse in user button
		bgames_login_selection = 0;
		keyboard_string = bgames_user.user;
		input = true;
		if os_type==os_android keyboard_virtual_show(kbv_type_default, kbv_returnkey_done, kbv_autocapitalize_none, false);
		}
	else if point_in_button(_mouse_x,_mouse_y,global.w/2-3*48,_yy+48,6,.75) { //if mouse in password button
		bgames_login_selection = 1;
		keyboard_string = bgames_user.password;
		input = true;
		if os_type==os_android keyboard_virtual_show(kbv_type_default, kbv_returnkey_done, kbv_autocapitalize_none, false);
		}
	else {
		show_debug_message("Nothing else, closing the virtual keyboard");
		input = false;
		bgames_login_selection = -1;
		keyboard_virtual_hide(); 
		}
	}
	
function layer_start(){
    if event_type == ev_draw
    {
        if event_number == 0
        {
            if surface_exists(obj_controller.surf_entities) {
				surface_set_target(obj_controller.surf_entities);
				//x-=obj_controller.x-global.w/2;
				var mat = matrix_build(-(obj_controller.x-global.w/2), 0,0, 0,0,0, 1, 1, -1);
				matrix_set(matrix_world, mat);
				
				}
        }
    }
}

function layer_end(){
    if event_type == ev_draw
    {
        if event_number == 0
        {
            if surface_exists(obj_controller.surf_entities) {
				surface_reset_target();
				matrix_set(matrix_world, matrix_build_identity());
				}
        }
    }
}

layer_script_begin("Units",layer_start);
layer_script_end("Units",layer_end);

layer_script_begin("Buildings",layer_start);
layer_script_end("Buildings",layer_end);

layer_script_begin("Ground",layer_start);
layer_script_end("Ground",layer_end);
