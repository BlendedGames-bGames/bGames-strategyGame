/// @description Insert description here
// You can write your code in this editor

event_inherited();

with obj_controller {
	need_to_find_walls = true;
	}

if built {
	instance_create_layer(x,y,"Units",obj_wall_destroyer);
	}
