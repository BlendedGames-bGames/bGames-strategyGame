// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_standard_button(sprite_icon,icon_index,text,xx,yy){
	draw_sprite_ext(spr_hud_bar,0,xx,yy,1,1,0,c_white,1);
	draw_sprite(sprite_icon,icon_index,xx+24,yy+12);
	draw_text_ext(xx+24,yy+22,text,9,96);	
}