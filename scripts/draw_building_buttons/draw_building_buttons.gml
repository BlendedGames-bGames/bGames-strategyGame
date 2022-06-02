// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_building_buttons(_array){
	var _size = array_length(_array);
	var _bar_width = 48;
	for (var k = 0; k<_size; k++) {
		draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width*(k+2),room_height-80,1,1,0,c_white,1);
		draw_sprite_ext(spr_hud_building_icon,_array[k],global.w-33-_bar_width*(k+2),room_height-80,1,1,0,c_white,1);
		var _struct = global.building_data[_array[k]];
		var _pos = 0;
					
		if (_struct.wood_cost-global.wood)>0 or (_struct.stone_cost-global.stone)>0 {

			gpu_set_colorwriteenable(true,true,true,false);
			draw_sprite_ext(spr_hud_bar,3,global.w-33-_bar_width*(k+2),room_height-80,1,1,0,c_white,1);
			gpu_set_colorwriteenable(true,true,true,true);
			draw_set_color(c_red);
			if (_struct.wood_cost-global.wood)>0 {
				draw_sprite(spr_resource_font,1,global.w-33-_bar_width*(k+2)+8,room_height-80+_pos+8);
				draw_text(global.w-33-_bar_width*(k+2)+24,room_height-80+_pos+8,string(max(0,_struct.wood_cost-global.wood)));
				_pos+=16;
				}
			if (_struct.stone_cost-global.stone)>0 {
				draw_sprite(spr_resource_font,2,global.w-33-_bar_width*(k+2)+8,room_height-80+_pos+8);
				draw_text(global.w-33-_bar_width*(k+2)+24,room_height-80+_pos+8,string(max(0,_struct.stone_cost-global.stone)));
				_pos+=16;
				}
			draw_set_color(c_white);
			}
		}
}