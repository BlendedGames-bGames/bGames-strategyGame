// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function soldier_job_assigner(){
	var _soldiers = ds_list_size(global.peasant_list[jobs.soldier]);
	if (global.time/global.day_time <global.job_endtime) {
		for (var i = 0; i<2 ;i++) {
			exploration_cooldown[i] = max(exploration_cooldown[i]-1,0);
			if exploration_active[i] {
				exploration_progress[i]+=units_exploring[i]/2;
				if exploration_progress[i]>=exploration_progress_target {
					exploration_active[i] = false;
					if i == explore.left_side {
						min_camera_chunk = max(min_camera_chunk-exploration_chunk_reward,0);
						}
					else {
						max_camera_chunk = min(max_camera_chunk+exploration_chunk_reward,global.world.size);
						}
					exploration_progress[i] = 0;
					exploration_cooldown[i] = exploration_wait_value;
					exploration_successes[i]++;
					//units_going_to_explore[i] = 0;
					//units_exploring[i] = 0;
					break;
					}
				if units_going_to_explore[i] < 2 {
					var _free_soldier = noone;
					var _min_distance = 999999;
					var _pos = min_camera_chunk*64;
					if i == explore.right_side {
						_pos = max_camera_chunk*64;
						}
					for (var j = 0; j<_soldiers;j++) {
						var _soldier = global.peasant_list[jobs.soldier][|j];
						if !_soldier.is_busy and abs(_pos-_soldier.x)<_min_distance {
							_free_soldier = _soldier;
							_min_distance = abs(_pos-_soldier.x);
							}
						}
					if _free_soldier != noone {
						show_debug_message("adding instance: "+string(_free_soldier));
					
						_free_soldier.check_state = exploration_is_active;
						_free_soldier.state = move_to_pos;
						_free_soldier.next_state = explore_new_land;
						_free_soldier.on_finish_state = start_exploring;
						_free_soldier.cancel_state = cancel_exploration;
						_free_soldier.is_busy = true;
						_free_soldier.target_instance = noone;
						_free_soldier.target_side = i;
						if i == explore.left_side {
							_free_soldier.target_x = (min_camera_chunk-2)*64;
							}
						else {
							_free_soldier.target_x = (max_camera_chunk+2)*64;
							}
						units_going_to_explore[i]++;
						}
					}
				}
			}
		}
	
	with obj_building_watchtower {
		if open {
			if slots<max_slots {
				var _soldier_list = global.peasant_list[jobs.soldier_left];
				if right_side {
					_soldier_list = global.peasant_list[jobs.soldier_right];
					}
				var _size = ds_list_size(_soldier_list);
				for (var j = 0; j<_size;j++) {
					
					var _free_soldier = noone;
					var _min_distance = 999999;
					
					var _soldier = _soldier_list[|j];
					if !_soldier.is_busy and abs(x-_soldier.x)<_min_distance {
						_free_soldier = _soldier;
						_min_distance = abs(x-_soldier.x);
						}
					if _free_soldier!=noone {
						slots++;
						_free_soldier.tower_pos = slots;
						_free_soldier.is_busy = true;
						_free_soldier.check_state = check_tower;
						_free_soldier.state = move_to_object;
						_free_soldier.target_instance = id;
						_free_soldier.next_state = climb_tower;
						_free_soldier.on_finish_state = -1;
						_free_soldier.cancel_state = cancel_tower;
						_free_soldier.is_busy = true;
						}
					if slots==max_slots { 
						break;
						}
					}
				}
			}
		}
	
	for (var i = 0; i<_soldiers;i++) {
		var _soldier = global.peasant_list[jobs.soldier][|i];
		if _soldier.state == wander {
			if _soldier.side == 1 {
				_soldier.target_x =global.control_radius_right -64+irandom(48);
				}
			else {
				_soldier.target_x = global.control_radius_left +64-irandom(48);
			}
			_soldier.state = attack_to_pos;
			_soldier.check_state = -1;
			_soldier.next_state = soldier_idle;
			_soldier.cancel_state = generic_cancel;
			_soldier.on_finish_state = -1;
			}
		}
	}
