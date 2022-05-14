// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function builder_job_assigner(){
	if (global.time/global.day_time <0.65) {
	var _builders = ds_list_size(global.peasant_list[jobs.builder]);
	with obj_building_parent {

		//if a building needs to be built or repaired
		if hp<max_hp and builders<max_builders{
			var _free_builder = noone;
			var _min_distance = 999999;
			for (var i = 0 ; i < _builders ; i++) {
				var _builder = global.peasant_list[jobs.builder][|i];
				if !_builder.is_busy and abs(x-_builder.x)<_min_distance {
					_free_builder = _builder;
					_min_distance = abs(x-_builder.x);
					}
				}
			if _free_builder != noone {
				_free_builder.state = move_to_object;
				_free_builder.check_state = check_build;
				_free_builder.next_state = build;
				_free_builder.cancel_state = build_cancelled;
				_free_builder.on_finish_state = -1;
				_free_builder.target_instance = id;
				_free_builder.is_busy = true;
				builders++;
				show_debug_message("assigning "+string(_free_builder));
				}
			}
		}
	}
}