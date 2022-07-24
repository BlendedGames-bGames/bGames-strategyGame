/// @description Insert description here
// You can write your code in this editor

alarm[0] = room_speed;
global.can_help = -1;

is_android = (os_type == os_android);

stored_movement = 0;

current_tutorial = 0;
current_tutorial_sucessful = false;

basic_draw = function() {

	var _yy = -80 + y;
	draw_set_color(c_black);
	draw_set_alpha(.5 * image_alpha);
	draw_rectangle(0,global.h/2-8+_yy,global.w,global.h/2+8+_yy,0);
	draw_set_alpha(image_alpha);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.w/2,global.h/2+_yy,tutorial_text[current_tutorial,is_android]);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	}

#region tutorial 0
tutorial_text[0,0] = "Hold left click and drag the mouse to move the camera.";
tutorial_text[0,1] = "Drag the screen to move the camera.";

tutorial_condition[0] = function() {
	stored_movement+=abs(obj_controller.camera_acceleration.x);
	////show_debug_message(stored_movement);
	return stored_movement>10;
	}

tutorial_draw[0] = function() {
	basic_draw();
	}
#endregion

#region tutorial 1
tutorial_text[1,0] = "Move to the borders and click each compass button";
tutorial_text[1,1] = "Move to the borders and touch each compass button";

tutorial_condition[1] = function() {
	return (obj_controller.exploration_active[explore.left_side] and obj_controller.exploration_active[explore.right_side]);
	}
	
tutorial_draw[1] = function() {
	basic_draw();
	
	if obj_controller.show_min_button {
		draw_sprite(spr_hud_bar,4,24,global.h/2-24);
		}
	if obj_controller.show_max_button {
		draw_sprite(spr_hud_bar,4,global.w-72,global.h/2-24);
		}
	
	}
#endregion

#region tutorial 2

arrow_x = 0;
arrow_alpha = 0;

tutorial_text[2,0] = "Assign 4 citizens to the soldier job.\nDrag unemployed units to the soldier slot in the Job menu";
tutorial_text[2,1] = "Assign 4 citizens to the soldier job.\nDrag unemployed units to the soldier slot in the Job menu";

tutorial_condition[2] = function() {
	if arrow_alpha == 1 {
		arrow_x=min(48,arrow_x+2);
		}
	if arrow_x == 48 {
		arrow_alpha = max(0,arrow_alpha-0.05);
		if arrow_alpha == 0 {
			arrow_x = 0;
			}
		}
	if arrow_x == 0 {
		arrow_alpha += 0.1;
		}
	
	return (ds_list_size(global.peasant_list[jobs.soldier])>=4);
	}
	
tutorial_draw[2] = function() {
	var _yy = -80 + y;
	draw_set_color(c_black);
	draw_set_alpha(.5 * image_alpha);
	draw_rectangle(0,global.h/2-16+_yy,global.w,global.h/2+16+_yy,0);
	draw_set_alpha(image_alpha);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.w/2,global.h/2+_yy,tutorial_text[current_tutorial,is_android]);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	
	if obj_controller.current_menu != menu.job {
		draw_sprite_ext(spr_hud_bar,4,32,room_height-80,64/48,1,0,c_white,1);
		}
	else {
		draw_sprite_ext(spr_hud_bar,4,global.w-33-64,room_height-80,64/48,1,0,c_white,1);
		draw_sprite_ext(spr_tutorial_arrow,0,global.w-33-64+32-arrow_x,room_height-80,arrow_x/48,1,0,c_white,arrow_alpha);
		}
	
	}
#endregion

#region tutorial 3


tutorial_text[3,0] = "Soldiers are now assigned to scout the surrounding area.\n You can do this process until you reach the end of the map.";
tutorial_text[3,1] = "Soldiers are now assigned to scout the surrounding area.\n You can do this process until you reach the end of the map.";

tutorial_condition[3] = function() {
	return (obj_controller.exploration_successes[explore.left_side] and obj_controller.exploration_successes[explore.right_side]);
	}
	
tutorial_draw[3] = function() {
	var _yy = -80 + y;
	draw_set_color(c_black);
	draw_set_alpha(.5 * image_alpha);
	draw_rectangle(0,global.h/2-16+_yy,global.w,global.h/2+16+_yy,0);
	draw_set_alpha(image_alpha);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.w/2,global.h/2+_yy,tutorial_text[current_tutorial,is_android]);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	}
#endregion

#region tutorial 4



tutorial_text[4,0] = "Build a lumberjack's hut. It must be placed around trees to work.\nSelect the building from the Build menu.";
tutorial_text[4,1] = "Build a lumberjack's hut. It must be placed around trees to work.\nSelect the building from the Build menu.";

tutorial_condition[4] = function() {
	return (instance_exists(obj_building_lumberjack_hut));
	}
	
tutorial_draw[4] = function() {
	var _yy = -80 + y;
	draw_set_color(c_black);
	draw_set_alpha(.5 * image_alpha);
	draw_rectangle(0,global.h/2-16+_yy,global.w,global.h/2+16+_yy,0);
	draw_set_alpha(image_alpha);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.w/2,global.h/2+_yy,tutorial_text[current_tutorial,is_android]);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	if obj_controller.current_menu != menu.build {
		draw_sprite_ext(spr_hud_bar,4,32+64,room_height-80,64/48,1,0,c_white,1);
		}
	else {
		if obj_controller.current_submenu == submenu.none {
			draw_sprite_ext(spr_hud_bar,4,global.w-33-64,room_height-80,64/48,1,0,c_white,1);
			}
		else if obj_controller.current_submenu == submenu.resource_buildings {
			draw_sprite_ext(spr_hud_bar,4,global.w-33-48*2,room_height-80,1,1,0,c_white,1);
			}
		
		}
	
	}
#endregion

#region tutorial 5



tutorial_text[5,0] = "Assign 2 citizens to the builder job.\nDrag unemployed units to the builder slot in the Job menu";
tutorial_text[5,1] = "Assign 2 citizens to the builder job.\nDrag unemployed units to the builder slot in the Job menu";

tutorial_condition[5] = function() {
	if arrow_alpha == 1 {
		arrow_x=min(48*2,arrow_x+2);
		}
	if arrow_x == 48*2 {
		arrow_alpha = max(0,arrow_alpha-0.05);
		if arrow_alpha == 0 {
			arrow_x = 0;
			}
		}
	if arrow_x == 0 {
		arrow_alpha += 0.1;
		}
	
	return (ds_list_size(global.peasant_list[jobs.builder])>=2);
	}
	
tutorial_draw[5] = function() {
	var _yy = -80 + y;
	draw_set_color(c_black);
	draw_set_alpha(.5 * image_alpha);
	draw_rectangle(0,global.h/2-16+_yy,global.w,global.h/2+16+_yy,0);
	draw_set_alpha(image_alpha);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.w/2,global.h/2+_yy,tutorial_text[current_tutorial,is_android]);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	
	if obj_controller.current_menu != menu.job {
		draw_sprite_ext(spr_hud_bar,4,32,room_height-80,64/48,1,0,c_white,1);
		}
	else {
		draw_sprite_ext(spr_hud_bar,4,global.w-33-64,room_height-80,64/48,1,0,c_white,1);
		draw_sprite_ext(spr_tutorial_arrow,0,global.w-33-64+32-arrow_x,room_height-80,arrow_x/48,1,0,c_white,arrow_alpha);
		}
	
	}
#endregion

#region tutorial 6


tutorial_text[6,0] = "Builders are now assigned to the building.\n The maximum build speed is achieved with 2 builders.";
tutorial_text[6,1] = "Builders are now assigned to the building.\n The maximum build speed is achieved with 2 builders.";

tutorial_condition[6] = function() {
	return (instance_exists(obj_building_lumberjack_hut) and obj_building_lumberjack_hut.built);
	}
	
tutorial_draw[6] = function() {
	var _yy = -80 + y;
	draw_set_color(c_black);
	draw_set_alpha(.5 * image_alpha);
	draw_rectangle(0,global.h/2-16+_yy,global.w,global.h/2+16+_yy,0);
	draw_set_alpha(image_alpha);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.w/2,global.h/2+_yy,tutorial_text[current_tutorial,is_android]);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	}
#endregion

#region tutorial 7


tutorial_text[7,0] = "Assign 4 citizens to the lumberjack job.\nYou can assign citizens from other jobs.";
tutorial_text[7,1] = "Assign 4 citizens to the lumberjack job.\nYou can assign citizens from other jobs.";

tutorial_condition[7] = function() {
	if arrow_alpha == 1 {
		arrow_x=min(48*3,arrow_x+2);
		}
	if arrow_x == 48*3 {
		arrow_alpha = max(0,arrow_alpha-0.05);
		if arrow_alpha == 0 {
			arrow_x = 0;
			}
		}
	if arrow_x == 0 {
		arrow_alpha += 0.1;
		}
	
	return (ds_list_size(global.peasant_list[jobs.lumberjack])>=4);
	}
	
tutorial_draw[7] = function() {
	var _yy = -80 + y;
	draw_set_color(c_black);
	draw_set_alpha(.5 * image_alpha);
	draw_rectangle(0,global.h/2-16+_yy,global.w,global.h/2+16+_yy,0);
	draw_set_alpha(image_alpha);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.w/2,global.h/2+_yy,tutorial_text[current_tutorial,is_android]);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	
	if obj_controller.current_menu != menu.job {
		draw_sprite_ext(spr_hud_bar,4,32,room_height-80,64/48,1,0,c_white,1);
		}
	else {
		draw_sprite_ext(spr_tutorial_arrow,0,global.w-33-64+32-arrow_x,room_height-80,arrow_x/48,1,0,c_white,arrow_alpha);
		}
	
	}
#endregion

#region tutorial 8

tutorial_text[8,0] = "Prepare for the night. Place 2 walls covering the base.\nHint: Cover the lumberjack's hut area.";
tutorial_text[8,1] = "Prepare for the night. Place 2 walls covering the base.\nHint: Cover the lumberjack's hut area.";

tutorial_condition[8] = function() {
	return (instance_number(obj_building_wall)>=2);
	}
	
tutorial_draw[8] = function() {
	var _yy = -80 + y;
	draw_set_color(c_black);
	draw_set_alpha(.5 * image_alpha);
	draw_rectangle(0,global.h/2-16+_yy,global.w,global.h/2+16+_yy,0);
	draw_set_alpha(image_alpha);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.w/2,global.h/2+_yy,tutorial_text[current_tutorial,is_android]);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	
	if obj_controller.current_menu != menu.build {
		draw_sprite_ext(spr_hud_bar,4,32+64,room_height-80,64/48,1,0,c_white,1);
		}
	else {
		if obj_controller.current_submenu == submenu.none {
			draw_sprite_ext(spr_hud_bar,4,global.w-33-64*3,room_height-80,64/48,1,0,c_white,1);
			}
		else if obj_controller.current_submenu == submenu.defensive_buildings {
			draw_sprite_ext(spr_hud_bar,4,global.w-33-48*3,room_height-80,1,1,0,c_white,1);
			}
		}
	
	}
#endregion

#region tutorial 9

tutorial_text[9,0] = "";
tutorial_text[9,1] = "";

tutorial_condition[9] = function() {
	return (global.time/global.day_time>=global.job_endtime);
	}
	
tutorial_draw[9] = function() {
	//nothing
	}
#endregion

#region tutorial 10

tutorial_text[10,0] = "Assign at least 2 soldiers.\nThey'll protect the base at night.";
tutorial_text[10,1] = "Assign at least 2 soldiers.\nThey'll protect the base at night.";

tutorial_condition[10] = function() {
	return (ds_list_size(global.peasant_list[jobs.soldier])>=2);
	}
	
tutorial_draw[10] = function() {
	var _yy = -80 + y;
	draw_set_color(c_black);
	draw_set_alpha(.5 * image_alpha);
	draw_rectangle(0,global.h/2-16+_yy,global.w,global.h/2+16+_yy,0);
	draw_set_alpha(image_alpha);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.w/2,global.h/2+_yy,tutorial_text[current_tutorial,is_android]);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	};
#endregion
