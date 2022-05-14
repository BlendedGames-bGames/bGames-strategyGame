/// @description 3D camera control & HUD
// You can write your code in this editor

if !pause {

	shader_set(shd_lightmap_cutter);
	texture_set_stage(u_lightTex, surface_get_texture(surf_lighting));
	draw_surface_ext(surf_entities,x-global.w/2,global.h,1,-1,0,c_white,1);
	shader_reset();

	surface_set_target(surf_water);
	draw_clear_alpha(c_black,0);
	if surface_exists(obj_ground.surf_parallax) {
		draw_surface_ext(obj_ground.surf_parallax,0,0,1,.75,0,c_white,1);
		}
	shader_set(shd_lightmap_cutter);
	texture_set_stage(u_lightTex, surface_get_texture(surf_lighting));
	draw_surface_ext(surf_entities,0,0,1,.75,0,c_white,1);
	shader_reset();
	surface_reset_target();


	#region drawing water 

	water_shift_R		+= .1 * 2 - 1;
	water_shift_G		+= .2 * 2 - 1 - camera_acceleration.x ;
	water_shift_B		+= .2* 0.5 - 0.25 ;
	var strength_x		= 0.05 * 2;
	var strength_y		= 0.05 * 2;
	var pattern_w		= max(0.001, 0.75) * sprite_get_width(sprite_distort)  * 2;		// mustn't be <= 0
	var pattern_h		= max(0.001, 0.40) * sprite_get_height(sprite_distort) * 0.25;	// mustn't be <= 0

	// get colour variables:
	//-------------------------------------------------------------------------
	var blend_col		= make_color_hsv(0.43  * 255, 0  * 255, 0.95 * 255);
	var water_col		= merge_color(make_color_hsv(154,103,19),make_color_hsv(230,32,10),night_factor);//make_color_hsv(0.02 * 255, 0.44 * 255, 0.2 * 255);
	var col_mix_0		= 0.24 - 0.5;
	var col_mix_1		= 0.71 + 0.5;
	
	var brightness		= 0.5 * 2 - 1;
	var saturation		= 0.25 * 4;
	var contrast		= 0.25 * 4;
	

	var mat = matrix_build(x-global.w/2, global.ground_level+48,0, -90,0,0, 1, 1, -1);

	matrix_set(matrix_world, mat);
	shader_set(shader);
	shader_set_uniform_f(u_water_shift_RGB,		water_shift_R, water_shift_G, water_shift_B);
	shader_set_uniform_f(u_distort_strength,	strength_x, strength_y);			// could be turned into a constant
	shader_set_uniform_f(u_pattern_size,		pattern_w, pattern_h);				// could be turned into a constant
	shader_set_uniform_f(u_water_col,			color_get_red(water_col)/255, color_get_green(water_col)/255, color_get_blue(water_col)/255); // could be turned into a constant
	shader_set_uniform_f(u_col_mix,				col_mix_0, col_mix_1);				// could be turned into a constant
	shader_set_uniform_f(u_brt_sat_con,			brightness, saturation, contrast);	// could be turned into a constant
	//shader_set_uniform_f(u_blend_mode,			blend_mode);						// for testing only
	//shader_set_uniform_f(u_show_result,			show_result);						// for debugging only
	texture_set_stage(u_distort_tex,			distort_tex);
		
	draw_surface_part_ext(surf_water,0,-64,global.w,global.h,0,global.h*.8,1,-.80,blend_col,1);
	shader_reset();

	//draw_surface_part_ext(application_surface,0,96*(global.res_h/global.h),global.res_w,global.res_h,0,0,global.w/global.res_w,global.h/global.res_h*.8,c_white,0.6);
	matrix_set(matrix_world, matrix_build_identity());

	#endregion

	//draw_surface_part_ext(surf_water,0,0,global.w,global.h,x-global.w/2,0,.5,.5,c_white,0.6);

	if current_menu == menu.place_lumberjack_zone {
		draw_sprite_ext(spr_chop_zone,!can_build,woodcutting_area.x,global.ground_level,woodcutting_area.image_xscale,1,0,c_white,0.75);
		}

	else if current_submenu == submenu.build_mode {
		draw_sprite(global.building_data[selected_building].sprite_index,1+!can_build,build_x,global.ground_level);
		}
	
	}
