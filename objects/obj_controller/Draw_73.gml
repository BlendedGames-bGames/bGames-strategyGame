/// @description 3D camera control & HUD
// You can write your code in this editor



shader_set(shd_lightmap_cutter);
texture_set_stage(u_lightTex, surface_get_texture(surf_lighting));
draw_surface_ext(surf_entities,x-global.w/2,global.h,1,-1,0,c_white,1);
shader_reset();


if current_menu == menu.place_lumberjack_zone {
	draw_sprite_ext(spr_chop_zone,!can_build,woodcutting_area.x,global.ground_level,woodcutting_area.image_xscale,1,0,c_white,0.75);
	}

else if current_submenu == submenu.build_mode {
	draw_sprite(global.building_data[selected_building].sprite_index,1+!can_build,build_x,global.ground_level);
	}
	

