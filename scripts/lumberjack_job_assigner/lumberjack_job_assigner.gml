// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lumberjack_job_assigner(){
	var _lumberjacks = ds_list_size(global.peasant_list[jobs.lumberjack]);
	with obj_building_lumberjack_hut {

		//if a building needs to be built or repaired
		if built and workers<max_workers{
			var _free_lumberjack = noone;
			var _min_distance = 999999;
			for (var i = 0 ; i < _lumberjacks ; i++) {
				var _lumberjack = global.peasant_list[jobs.lumberjack][|i];
				if _lumberjack.state == wander and abs(x-_lumberjack.x)<_min_distance {
					_free_lumberjack = _lumberjack;
					_min_distance = abs(x-_lumberjack.x);
					}
				}
			if _free_lumberjack != noone {
				_free_lumberjack.state = move_to_object;
				_free_lumberjack.target_instance = id;
				workers++;
				}
			}
		}
}