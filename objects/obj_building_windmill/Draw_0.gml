/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,image_index,x,y,1,yscale,0,c_white,1);
if !built {
	draw_sprite_ext(spr_building_site,0,x,y,sprite_width/128,1,0,c_white,1);
}
else {
	draw_sprite_ext(spr_windmill_wing,0,x+63,y-sprite_height+56,1,1,global.time/10,c_white,1);
	
	for (var i = 0; i < ds_list_size(farm_chunks) ; i++) {
		var _lvl = farm_chunks[|i].level;
		var _yoffset = 3;
		if _lvl == 2 {
			_yoffset = 12;
			}
		else if _lvl > 2 {
			_yoffset = 18;
			}
		
		var _xoffset1 = 8*(dsin(air_time+i*56)) ;
		var _xoffset2 = 8*(dsin(air_time+i*56+30)) ;
	
		var _xx = farm_chunks[|i].pos*64;
		var _yy = global.ground_level-_yoffset;	
	
		draw_sprite_pos(spr_wheat,_lvl,                 _xx+_xoffset1,   _yy,
														_xx+64+_xoffset2,_yy,
														_xx+64,         _yy+_yoffset,
														_xx,            _yy+_yoffset
														,1);
			
		}
	}


