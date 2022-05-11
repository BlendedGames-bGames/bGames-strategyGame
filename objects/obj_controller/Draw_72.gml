/// @description Clear app surf last frame
// You can write your code in this editor


if !surface_exists(surf_entities) {
	surf_entities = surface_create(global.w+1,global.h);
	}	
else {
	surface_set_target(surf_entities);
	draw_clear_alpha(c_black,0);
	surface_reset_target()
	}		

