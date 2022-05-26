// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lumberjack_job_assigner(){
	if (global.time/global.day_time <0.65) {
		var _lumberjacks = ds_list_size(global.peasant_list[jobs.lumberjack]);
		with obj_building_lumberjack_hut {

			//if a building needs to be built or repaired
			if built and workers<max_workers{
				var _free_lumberjack = noone;
			
				//find the closest free peasant
				var _min_distance = 999999;
				for (var i = 0 ; i < _lumberjacks ; i++) {
					var _lumberjack = global.peasant_list[jobs.lumberjack][|i];
					if _lumberjack.state == wander and abs(x-_lumberjack.x)<_min_distance {
						_free_lumberjack = _lumberjack;
						_min_distance = abs(x-_lumberjack.x);
						}
					}
				if _free_lumberjack != noone {
					show_debug_message("lumberjack,assigned to work: "+string(_free_lumberjack));
					_free_lumberjack.state = move_to_object;
					_free_lumberjack.check_state = -1;
					_free_lumberjack.next_state = work_lumberjack;
					_free_lumberjack.cancel_state = cancel_lumberjack;
					_free_lumberjack.on_finish_state = start_cutting_wood;
					_free_lumberjack.target_instance = id;
					workers++;
					}
				}
			if built and cut_zone!=noone {
				show_debug_message("Tengo un cut zone")
				for (var i = 0 ; i < _lumberjacks ; i++) {
					var _lumberjack = global.peasant_list[jobs.lumberjack][|i];
					if _lumberjack.target_instance == id and _lumberjack.state!=clear_forest {
						show_debug_message("Iré a trabajar pue")
						if _lumberjack.state == work_lumberjack {
							workers_working--;
							}
						_lumberjack.state = clear_forest;
						_lumberjack.timer = 0;
						_lumberjack.target_x=-1;
						}
					}
				}
			}
		}
	}