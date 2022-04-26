/// @description Insert description here
// You can write your code in this editor
var _size = 256;
global.world = generate_world(_size);


var _center =  (_size/2) * 64;
obj_controller.x = _center;

obj_controller.min_camera_chunk = _size/2-8;
obj_controller.max_camera_chunk = _size/2+8;
global.base = instance_create_layer(_center-64,global.ground_level,"Buildings",obj_building_capitol);

global.left_wall = global.base;
global.right_wall = global.base;


repeat(5) {
	instance_create_layer(_center+irandom(48)*choose(1,-1),global.ground_level,"Units",obj_peasant);
	}
	
