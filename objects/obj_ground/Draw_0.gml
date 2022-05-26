/// @description Insert description here
// You can write your code in this editor
var _cw = camera_get_view_width(view_camera[0]);
var _cx = obj_controller.x-global.w/2;
//calculate the chunk border coordinates.
var min_x=max(0,floor(_cx/64));
var max_x=min(global.world.size,ceil((_cx+_cw)/64));

//calculate the chunk border coordinates for the forest background.
//var min_x_forest=max(0,floor(_cx/64)-5);
//var max_x_forest=min(global.world.size,ceil((_cx+_cw)/64)+5);

var mat1 = matrix_build(-(obj_controller.x-global.w/2), 0,0, 0,0,0, 1, 1, -1);
var mat2 = matrix_build(-(obj_controller.x-global.w/2), 0,32, 0,0,0, 1, 1, -1);
//var mat3 = matrix_build(-(obj_controller.x-global.w/2), 0,64, 0,0,0, 1, 1, -1);
////drawing background

with obj_quarry {
	
	
	
	matrix_set(matrix_world, mat2);
	draw_sprite(spr_stone_deposit,1,x,y+2);
	matrix_set(matrix_world, mat1);
	draw_sprite(spr_stone_deposit,0,x,y);
	
	
	}


for (var i=min_x; i<max_x;i++) {	
	var _index=global.world.chunk_index[i];
	
	
	
	
	
	if global.world.wall_sprite[i]!=noone {
		draw_sprite(global.world.wall_sprite[i],0,(floor((obj_controller.x-global.w/2)/64)*64)+ (i-min_x)*64,global.ground_level+64-64*global.world.wall_y[i]);
		}
	for (var j=0;j<3;j++) {
		if global.world.forest_tree[i][j]!=-1 {
			draw_sprite_ext(spr_tree,global.world.forest_tree[i][j].image_index,(floor((obj_controller.x-global.w/2)/64)*64)+ (i-min_x)*64+global.world.forest_tree[i][j].x,global.ground_level,global.world.forest_tree[i][j].image_xscale,1,global.world.forest_tree[i][j].image_angle,c_white,1);
			}
		}
	
	if global.world.chunk_type[i]==3 {
		matrix_set(matrix_world, mat2);
		draw_sprite_ext(spr_ground,_index+3,(floor((obj_controller.x-global.w/2)/64)*64)+ (i-min_x)*64,room_height+4,1,1,0,c_grey,1);	
		matrix_set(matrix_world, mat1);
		}

	draw_sprite_ext(spr_ground,_index,(floor((obj_controller.x-global.w/2)/64)*64)+ (i-min_x)*64,room_height,1,1,0,c_white,1);	
			
	}
	

	
	
