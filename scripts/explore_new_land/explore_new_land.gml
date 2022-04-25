// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function explore_new_land(){
	if !obj_controller.exploration_active[target_side] {
		state = wander;
		obj_controller.units_exploring[target_side]--; 
		obj_controller.units_going_to_explore[target_side]--; 
		}
}