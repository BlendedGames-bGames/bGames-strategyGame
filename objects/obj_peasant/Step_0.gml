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