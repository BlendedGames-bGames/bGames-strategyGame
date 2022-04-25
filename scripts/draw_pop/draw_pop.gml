// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_pop(_pop_list, _x, _y, _width, _height){
	var _size = ds_list_size(_pop_list);
	var _row_length = floor((_width - 5) / 8);
	
	var _draw_numbers = ( (_height - 14) < 8 * floor(_size/_row_length));
	
	if _draw_numbers {
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_text(_x + _width - 4, _y + _height - 2, _size);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		}
	else {
		for (var i = 0; i < _size; i++) {
			draw_sprite(spr_pop_icon,0,_x + _width - 5 - 8 * (i mod _row_length), _y + _height - 2- 8 * floor(i/_row_length));
			}
		}
	}