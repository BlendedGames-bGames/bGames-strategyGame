/// @description Insert description here
// You can write your code in this editor

//There's a lot of stuff packed up in this event. Take a seat and enjoy the ride.


#region drawing background and storing it in a surface

if !surface_exists(surf_parallax) {
	surf_parallax = surface_create(global.w+256,global.h);
	}	



surface_set_target(surf_parallax);
with obj_controller {
	//sky
	var _xx = 0;
	draw_rectangle_color(_xx,128,_xx+global.w+256, global.ground_level+80,current_color.mid,current_color.mid,current_color.bot,current_color.bot,0);
	draw_rectangle_color(_xx,0+96,_xx+global.w+256,127,current_color.mid,current_color.mid,current_color.mid,current_color.mid,0);
	draw_rectangle_color(_xx,0,_xx+global.w+256, 0+95,current_color.top,current_color.top,current_color.mid,current_color.mid,0);
	
	gpu_set_blendmode(bm_add);
	
	var _sun_angle = clamp(time_ratio,0,300)*180/270;
	var _moon_angle = clamp(time_ratio-270,-20,90)*2;
	var _yy = global.h/2;
	_xx = 128+global.w/2;
	draw_sprite_ext(spr_lightsource,0,_xx+lengthdir_x(-192,_sun_angle),_yy+lengthdir_y(128,_sun_angle),1,1,0,c_yellow,1);
	draw_sprite_ext(spr_lightsource,0,_xx+lengthdir_x(-192,_moon_angle),_yy+lengthdir_y(128,_moon_angle),1,1,0,c_white,1);
	gpu_set_blendmode(bm_normal);
	}
for (var j = 0; j < 4;j++) {
	for (var i = 0; i < global.world.background.mountain_repeats[j];i++) {
		draw_sprite_ext(spr_mountain,j,128+obj_controller.x*((0.99-0.05*j)-1)+i*global.world.background.sprite_size[j],-96+6*j*j+4,1,1,0,obj_controller.parallax_color,1);
		}
	}
surface_reset_target();

#endregion
draw_surface_ext(surf_parallax,obj_controller.x-global.w/2-128,global.h,1,-1,0,c_white,1);
var _cw = camera_get_view_width(view_camera[0]);
var _cx = obj_controller.x-global.w/2;

//calculate the chunk border coordinates for the forest background.
var min_x_forest=max(0,floor(_cx/64)-5);
var max_x_forest=min(global.world.size,ceil((_cx+_cw)/64)+5);


var _mat = matrix_build(0, 0,128, 0,0,0, 1, 1, -1);
matrix_set(matrix_world, _mat);
for (var i=min_x_forest; i<max_x_forest;i++) {				
	if global.world.chunk_type[i]==2 {
		var _index = global.world.forest_bg_index2[i];
		draw_sprite_ext(spr_forest_layer2,_index,i*64+32,global.ground_level+80,1.4,1.4,0,obj_controller.parallax_color,1);	
		}
	}
var _mat = matrix_build(0, 0,64, 0,0,0, 1, 1, -1);
matrix_set(matrix_world, _mat);

for (var i=min_x_forest; i<max_x_forest;i++) {				
	if global.world.chunk_type[i]==2 {
		var _index = global.world.forest_bg_index[i];
		
		draw_sprite_ext(spr_forest_layer1,_index,i*64+32,global.ground_level+64,1.3,1.3,0,obj_controller.parallax_color,1);		
		}
	}
	
matrix_set(matrix_world, matrix_build_identity());





