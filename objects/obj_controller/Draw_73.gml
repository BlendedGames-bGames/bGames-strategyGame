/// @description Drawing world
// You can write your code in this editor

if !pause {

	#region water variables
	
	water_shift_R		+= .37 - 1  - (x-xprevious);
	water_shift_G		+= .42 - 1 -  (x-xprevious);
	water_shift_B		+= .1 - 0.25 ;
	var strength_x		= 0.1;
	var strength_y		= 0.05;
	var pattern_w		= max(0.001, 0.75) * sprite_get_width(sprite_distort)  * 2;		// mustn't be <= 0
	var pattern_h		= max(0.001, 0.40) * sprite_get_height(sprite_distort) * 0.25;	// mustn't be <= 0

	// get colour variables:
	//-------------------------------------------------------------------------
	var blend_col		= make_color_hsv(0.43  * 255, 0  * 255, 0.95 * 255);
	var water_col		= merge_color(make_color_hsv(154,103,19),make_color_hsv(230,32,10),night_factor);//make_color_hsv(0.02 * 255, 0.44 * 255, 0.2 * 255);
	var col_mix_0		= 0.24 - 0.5;
	var col_mix_1		= 0.71 + 0.5;
	
	var brightness		= -0.1;
	var saturation		= .75;
	var contrast		= 1.26;
	
	
	#endregion

	#region shading world
	surface_set_target(surf_shaded_entities);
	draw_clear_alpha(c_black,0);
	shader_set(shd_lightmap_cutter);
	texture_set_stage(u_lightTex, surface_get_texture(surf_lighting));
	draw_surface_part(surf_entities,0,64,global.w+1,global.h-64,0,64);
	shader_reset();
	surface_reset_target();
	
	#endregion

	#region rendering water 
	
	surface_set_target(surf_water);
	draw_clear_alpha(c_black,0);
	if surface_exists(obj_ground.surf_parallax) {
		draw_surface_ext(obj_ground.surf_parallax,-128,-64,1,.85,0,c_white,1);
		}
	shader_set(shd_draw_bottom_white_line);


	//draw_surface_ext(surf_shaded_entities,128,global.h*_scale+64*(2-_scale),1,-_scale,0,c_white,1);
	
	draw_surface_ext(surf_shaded_entities,0,global.h*.35+4,1,-.35,0,c_white,1);	
	
	
	shader_reset();
	gpu_set_blendmode(bm_zero);
	draw_set_alpha(.25);
	draw_rectangle_color(0,16,global.w+256,-1,current_color.mid,current_color.mid,c_black,c_black,false);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	#endregion
	
	#region drawing water 
	surface_set_target(surf_rendered_water);
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
	//var mat = matrix_build(x-global.w/2, global.ground_level+48,64, -90,0,0, 1, 1, -1);
	//matrix_set(matrix_world, mat);
	//draw_surface_part_ext(surf_water,0,-64,global.w+256,global.h,-128,global.h,1,-1,blend_col,1);
	draw_surface_ext(surf_water,0,global.h,1,-1,0,blend_col,1)
	
	shader_reset();
	
	
	surface_reset_target();
	//draw_surface_part_ext(application_surface,0,96*(global.res_h/global.h),global.res_w,global.res_h,0,0,global.w/global.res_w,global.h/global.res_h*.8,c_white,0.6);
	matrix_set(matrix_world, matrix_build_identity());

	#endregion

	//draw water, ground and units
	draw_surface_ext(surf_rendered_water,x-global.w/2,global.ground_level+22+global.h,1,-1,0,blend_col,1)
	
	draw_surface_ext(surf_shaded_entities,x-global.w/2,0,1,1,0,c_white,1);
	//draw_surface_part_ext(surf_shaded_entities,0,0,global.w,global.h-64,x-global.w/2,0,1,1,c_white,1);
	//draw_surface_part_ext(surf_water,0,0,global.w,global.h,x-global.w/2,0,.5,.5,c_white,0.6);

	if current_menu == menu.place_lumberjack_zone {
		draw_sprite_ext(spr_chop_zone,!can_build,woodcutting_area.x,global.ground_level,woodcutting_area.image_xscale,1,0,c_white,0.75);
		}

	else if current_submenu == submenu.build_mode {
		var _color = c_red;
		if can_build {
			_color = c_white;
			}
		draw_sprite_ext(global.building_data[selected_building].sprite_index,0,build_x,global.ground_level,1,1,0,_color,global.job_endtime);
		
		if selected_building == buildings.lumberjack_hut {
			var _effectivity = 0;
			for (var i = 0; i < 6; i++) {
				var _color2 = c_red;
				if global.world.chunk_type[build_x/64+(i-2)] == 2 {
					_color2 = c_white;
					_effectivity+=1;
					}
				draw_sprite_ext(spr_build_zone,0,build_x+(i-2)*64,global.ground_level-32,1,.25,0,_color2,0.75);
				}
			var _yy = global.ground_level+24;
			draw_set_color(c_black);
			draw_set_alpha(.5 * image_alpha);
			draw_rectangle(x-global.w/2,-8+_yy,x+global.w/2,8+_yy,0);
			draw_set_alpha(image_alpha);
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text(x,_yy,"Effectivity: "+string(floor(_effectivity*100/6))+"%");
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_alpha(1);
			}
		else if selected_building == buildings.windmill {
			var _effectivity = 0;
			for (var i = 0; i < 6; i++) {
				var _color2 = c_red;
				if global.world.chunk_type[build_x/64+(i-2)] == 1 and !position_meeting(build_x+(i-2)*64,global.ground_level-8,obj_building_parent) {
					_color2 = c_white;
					_effectivity+=1;
					}
				draw_sprite_ext(spr_build_zone,0,build_x+(i-2)*64,global.ground_level-32,1,.25,0,_color2,0.75);
				}
			var _yy = global.ground_level+24;
			draw_set_color(c_black);
			draw_set_alpha(.5 * image_alpha);
			draw_rectangle(x-global.w/2,-8+_yy,x+global.w/2,8+_yy,0);
			draw_set_alpha(image_alpha);
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text(x,_yy,"Effectivity: "+string(floor(_effectivity*100/6))+"%");
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_alpha(1);
			}
		
		}
	
	}

//if keyboard_check_pressed(ord("O")) {
//	surface_save(surf_lighting,"light_surf.png");
//	surface_save(surf_rendered_water,"water_surf.png");
//	surface_save(surf_entities,"entities_surf.png");
//	surface_save(surf_shaded_entities,"shaded_surf.png");
//	surface_save(surf_menu,"menu_surf.png");
//	surface_save(surf_submenu,"submenu_surf.png");
//	surface_save(surf_resources,"resources_surf.png");
//	}