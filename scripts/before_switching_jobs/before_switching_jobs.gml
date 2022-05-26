// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function before_switching_jobs(_which_free_peasant){
	if _which_free_peasant.job==jobs.builder {
		if _which_free_peasant.target_instance!=noone {
			_which_free_peasant.target_instance.builders--;
			}
		}
	else if _which_free_peasant.job==jobs.lumberjack {
		if _which_free_peasant.target_instance!=noone {
			_which_free_peasant.target_instance.workers--;
			if _which_free_peasant.state == work_lumberjack {
	
				_which_free_peasant.target_instance.workers_working--;
				}
			}
		}
	else if _which_free_peasant.job==jobs.farmer {
		if _which_free_peasant.target_instance!=noone {
			_which_free_peasant.target_instance.workers--;
			if _which_free_peasant.state == work_farm {
	
				_which_free_peasant.target_instance.workers_working--;
				}
			}
		}
	else if _which_free_peasant.job==jobs.miner {
		if _which_free_peasant.target_instance!=noone {
			_which_free_peasant.target_instance.workers--;
			if _which_free_peasant.state == work_mine {
	
				_which_free_peasant.target_instance.workers_working--;
				}
			}
		}
	else if _which_free_peasant.job==jobs.soldier {
		if _which_free_peasant.side == 0 {

			var _pos = ds_list_find_index(global.peasant_list[jobs.soldier_left],_which_free_peasant.id);
			if _pos!=-1 ds_list_delete(global.peasant_list[jobs.soldier_left],_pos);
			}
		else {
			var _pos = ds_list_find_index(global.peasant_list[jobs.soldier_right],_which_free_peasant.id);
			if _pos!=-1 ds_list_delete(global.peasant_list[jobs.soldier_right],_pos);
			}
		if _which_free_peasant.state==explore_new_land {
			units_exploring[_which_free_peasant.target_side]--;
			units_going_to_explore[_which_free_peasant.target_side]--;
			}
		else if _which_free_peasant.state==move_to_pos and _which_free_peasant.next_state == explore_new_land {
			units_going_to_explore[_which_free_peasant.target_side]--;
			}
		}
}