/// @description Insert description here
// You can write your code in this editor

if (built and hp <=0) or (!build and hp<0) {
	instance_destroy();
	}
	
if obj_controller.current_instance == id and old_hp!=hp {
	obj_controller.render_submenu = true;
	}	
	
old_hp = hp;
