// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function point_in_button(_px,_py,_x,_y,_xscale,_yscale){
	return point_in_rectangle(_px,_py,_x,_y,_x+48*_xscale,_y+48*_yscale);
}