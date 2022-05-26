// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function miner_job_assigner(){
	if (global.time/global.day_time <0.65) {
		var _miners = ds_list_size(global.peasant_list[jobs.miner]);
		with obj_building_mining_camp {

			//if a building needs to be built or repaired
			if built and workers<max_workers{
				var _free_miner = noone;
			
				//find the closest free peasant
				var _min_distance = 999999;
				for (var i = 0 ; i < _miners ; i++) {
					var _miner = global.peasant_list[jobs.miner][|i];
					if _miner.state == wander and abs(x-_miner.x)<_min_distance {
						_free_miner = _miner;
						_min_distance = abs(x-_miner.x);
						}
					}
				if _free_miner != noone {
					show_debug_message("farmer,assigned to work: "+string(_free_miner));
					_free_miner.state = move_to_object;
					_free_miner.check_state = -1;
					_free_miner.next_state = work_mine;
					_free_miner.cancel_state = cancel_mine;
					_free_miner.on_finish_state = start_mining;
					_free_miner.target_instance = id;
					workers++;
					}
				}
			}
		}
	}