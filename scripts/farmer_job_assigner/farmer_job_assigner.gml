// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function farmer_job_assigner(){
	if (global.time/global.day_time <global.job_endtime) {
		var _farmers = ds_list_size(global.peasant_list[jobs.farmer]);
		with obj_building_windmill {

			//if a building needs to be built or repaired
			if built and workers<max_workers{
				var _free_farmer = noone;
			
				//find the closest free peasant
				var _min_distance = 999999;
				for (var i = 0 ; i < _farmers ; i++) {
					var _farmer = global.peasant_list[jobs.farmer][|i];
					if !_farmer.is_busy and abs(x-_farmer.x)<_min_distance {
						_free_farmer = _farmer;
						_min_distance = abs(x-_farmer.x);
						}
					}
				if _free_farmer != noone {
					show_debug_message("farmer,assigned to work: "+string(_free_farmer));
					_free_farmer.state = move_to_object;
					_free_farmer.is_busy = true;
					_free_farmer.check_state = -1;
					_free_farmer.next_state = work_farm;
					_free_farmer.cancel_state = cancel_farm;
					_free_farmer.on_finish_state = start_farming;
					_free_farmer.target_instance = id;
					workers++;
					}
				}
			}
		}
	}