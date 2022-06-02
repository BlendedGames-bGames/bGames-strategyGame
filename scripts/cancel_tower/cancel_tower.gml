// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cancel_tower(){
	
	is_busy = false;
	state = attack_to_pos;
	check_state = -1;
	next_state = soldier_idle;
	cancel_state = generic_cancel;
	on_finish_state = -1;
}