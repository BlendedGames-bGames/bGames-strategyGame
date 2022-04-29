// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cancel_exploration(){
	state = wander;
	if job == jobs.soldier {
		obj_controller.units_going_to_explore[target_side]--; 
		}
}