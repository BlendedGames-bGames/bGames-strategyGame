/// @description Insert description here
// You can write your code in this editor
if right_side {
	draw_sprite_ext(sprite_index,image_index,x,y,1,yscale,0,c_white,1);
	}
else {
	draw_sprite_ext(sprite_index,image_index,x+64,y,-1,yscale,0,c_white,1);
	}
if !built {
	draw_sprite_ext(spr_building_site,0,x,y,sprite_width/128,1,0,c_white,1);
}

