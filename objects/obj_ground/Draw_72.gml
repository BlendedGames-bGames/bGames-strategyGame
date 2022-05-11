/// @description Insert description here
// You can write your code in this editor





with obj_controller {
	var _xx = x-global.w/2;
	draw_rectangle_color(_xx,global.ground_level-63,_xx+global.w, global.ground_level+80,current_color.mid,current_color.mid,current_color.bot,current_color.bot,0);
	draw_rectangle_color(_xx,0+64,_xx+global.w,global.ground_level-64,current_color.mid,current_color.mid,current_color.mid,current_color.mid,0);
	draw_rectangle_color(_xx,0-128,_xx+global.w, 0+63,current_color.top,current_color.top,current_color.mid,current_color.mid,0);
	}
for (var j = 0; j < 4;j++) {
	for (var i = 0; i < global.world.background.mountain_repeats[j];i++) {
		draw_sprite_ext(spr_mountain,j,obj_controller.x*((0.9-0.1*j))+i*global.world.background.sprite_size[j],-128+j*j*8+4,1,1,0,obj_controller.parallax_color,1);
		}
	}
	
var _cw = camera_get_view_width(view_camera[0]);
var _cx = obj_controller.x-global.w/2;

//calculate the chunk border coordinates for the forest background.
var min_x_forest=max(0,floor(_cx/64)-5);
var max_x_forest=min(global.world.size,ceil((_cx+_cw)/64)+5);

#region drawing forest background
var _mat = matrix_build(0, 0,128, 0,0,0, 1, 1, -1);
matrix_set(matrix_world, _mat);
for (var i=min_x_forest; i<max_x_forest;i++) {				
	if global.world.chunk_type[i]==2 {
		var _index = global.world.forest_bg_index2[i];
		draw_sprite_ext(spr_forest_layer2,_index,i*64+32,global.ground_level+54,1,1,0,obj_controller.parallax_color,1);	
		}
	}
var _mat = matrix_build(0, 0,64, 0,0,0, 1, 1, -1);
matrix_set(matrix_world, _mat);

for (var i=min_x_forest; i<max_x_forest;i++) {				
	if global.world.chunk_type[i]==2 {
		var _index = global.world.forest_bg_index[i];
		
		draw_sprite_ext(spr_forest_layer1,_index,i*64+32,global.ground_level+48,1,1,0,obj_controller.parallax_color,1);		
		}
	}
	
matrix_set(matrix_world, matrix_build_identity());

#endregion

