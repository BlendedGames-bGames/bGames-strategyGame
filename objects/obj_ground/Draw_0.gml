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


////drawing background

for (var i=min_x; i<max_x;i++) {	
	if global.world.wall_sprite[i]!=noone {
		draw_sprite(global.world.wall_sprite[i],0,(floor((obj_controller.x-global.w/2)/64)*64)+ (i-min_x)*64,global.ground_level+64-64*global.world.wall_y[i]);
		}
	for (var j=0;j<3;j++) {
		if global.world.forest_tree[i][j]!=-1 {
			draw_sprite_ext(spr_tree,global.world.forest_tree[i][j].image_index,(floor((obj_controller.x-global.w/2)/64)*64)+ (i-min_x)*64+global.world.forest_tree[i][j].x,global.ground_level,global.world.forest_tree[i][j].image_xscale,1,global.world.forest_tree[i][j].image_angle,c_white,1);
			}
		}
	
	var _spr=global.world.chunk_sprite[i];
	if _spr!=noone {
		draw_sprite_ext(_spr,0,(floor((obj_controller.x-global.w/2)/64)*64)+ (i-min_x)*64,room_height,1,1,0,c_white,1);	
		}		
	}
	
	
