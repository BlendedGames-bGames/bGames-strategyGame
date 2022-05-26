/// @description Insert description here
// You can write your code in this editor
timer = max(0,timer-1);

scared_timer = max(0,scared_timer-1);
if scared_timer {
	run_scared();
	}
else { 
	state();
	}
visible = in_range(x,obj_controller.x-global.w*0.6,obj_controller.x+global.w*0.6);

if hp == 0 {
	before_switching_jobs(self);
	instance_destroy();
	
	var _pos = ds_list_find_index(global.peasant_list[job],id);
	
	ds_list_delete(global.peasant_list[job],_pos);
	
	global.pops--;
	obj_controller.render_resources = true;
	obj_controller.render_submenu = true;
	}
