/// @description Insert description here
// You can write your code in this editor
var _cw = camera_get_view_width(view_camera[0]);
var _cx = obj_controller.x-global.w/2;
//calculate the chunk border coordinates.
var min_x=max(0,floor(_cx/64));
var max_x=min(global.world.size,ceil((_cx+_cw)/64));

//calculate the chunk border coordinates for the forest background.
var min_x_forest=max(0,floor(_cx/64)-5);
var max_x_forest=min(global.world.size,ceil((_cx+_cw)/64)+5);


//drawing background

for (var j = 0; j < 4;j++) {

	for (var i = 0; i < global.world.background.mountain_repeats[j];i++) {
		draw_sprite(spr_mountain,j,obj_controller.x*(0.9-0.1*j)+i*global.world.background.sprite_size[j],-160+j*j*8+4);
		}
	}
#region drawing forest background
var _mat = matrix_build(0, 0,128, 0,0,0, 1, 1, -1);
matrix_set(matrix_world, _mat);
for (var i=min_x_forest; i<max_x_forest;i++) {				
	if global.world.chunk_type[i]==2 {
		var _index = global.world.forest_bg_index2[i];
		draw_sprite(spr_forest_layer2,_index,i*64+32,global.ground_level+54);	
		}
	}
var _mat = matrix_build(0, 0,64, 0,0,0, 1, 1, -1);
matrix_set(matrix_world, _mat);

for (var i=min_x_forest; i<max_x_forest;i++) {				
	if global.world.chunk_type[i]==2 {
		var _index = global.world.forest_bg_index[i];
		
		draw_sprite(spr_forest_layer1,_index,i*64+32,global.ground_level+48);	
		}
	}
	
matrix_set(matrix_world, matrix_build_identity());

#endregion


for (var i=min_x; i<max_x;i++) {	
	if global.world.wall_sprite[i]!=noone {
		draw_sprite(global.world.wall_sprite[i],0,i*64,global.ground_level+64-64*global.world.wall_y[i]);
		}
	for (var j=0;j<global.world.forest_tree_amount[i];j++) {
		draw_sprite_ext(spr_tree,global.world.forest_tree[i][j].image_index,i*64+global.world.forest_tree[i][j].x,global.ground_level,global.world.forest_tree[i][j].image_xscale,1,global.world.forest_tree[i][j].image_angle,c_white,1);
		}
	
	var _spr=global.world.chunk_sprite[i];
	if _spr!=noone {
		draw_sprite_ext(_spr,0,i*64,room_height,1,1,0,c_white,1);	
		draw_text(i*64,room_height-64,i);
		}			
	}
	