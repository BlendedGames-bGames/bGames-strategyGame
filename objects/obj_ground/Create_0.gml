/// @description Insert description here
// You can write your code in this editor
var _size = 256;
global.world = generate_world(_size);
surf_parallax = -1;

var _center =  (_size/2) * 64;
obj_controller.x = _center;

obj_controller.min_camera_chunk = _size/2-8;
obj_controller.max_camera_chunk = _size/2+8;

//obj_controller.min_camera_chunk = 0;
//obj_controller.max_camera_chunk = _size-1;
global.base = instance_create_layer(_center-64*3,global.ground_level,"Buildings",obj_building_capitol);

global.left_wall = global.base;
global.right_wall = global.base;

find_furthest_walls();

repeat(4) {
	instance_create_layer(_center+irandom(48)*choose(1,-1),global.ground_level,"Units",obj_peasant);
	}
	
forest_chunk_to_animate = ds_list_create();


