// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function run_scared(){
	
	image_xscale = hit_dir;
	vspeed=min(vspeed+.5,4);
	y = min(ystart,y);	
	if y == ystart {
		vspeed = 0;
		hspeed = 0;
		if sprite_index!=spr_walk {
			sprite_index=spr_walk;
			image_index = 0;
			}
		
		x+=image_xscale*global.peasant_run_speed;
		}
	
}