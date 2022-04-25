/// @description Insert description here
// You can write your code in this editor


draw_sprite_ext(spr_unknown_border,0,(min_camera_chunk-1)*64,0,1,5,0,c_white,1);
draw_sprite_ext(spr_unknown_border,0,(max_camera_chunk+1)*64,0,-1,5,0,c_white,1);


if current_submenu == submenu.build_mode {
	draw_sprite(global.building_data[selected_building].sprite_index,1+!can_build,build_x,global.ground_level);
	}
	


