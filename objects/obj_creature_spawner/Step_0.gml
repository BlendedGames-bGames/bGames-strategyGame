/// @description Insert description here
// You can write your code in this editor
if  (global.time/global.day_time >=global.night_attack_time) {
	if need_to_calculate_pos {
		var _snd = audio_play_sound(snd_wave_starts,9,false);
		audio_sound_gain(_snd,.55,0);
		left_side=global.world.size*64;
		right_side=0;
		with obj_building_parent {
			other.right_side = max(other.right_side,x+sprite_width/2);
			other.left_side = min(other.left_side,x+sprite_width/2);
			}
		right_side+=64*8;
		left_side-=64*8;
		show_debug_message(string(left_side)+","+string(right_side));
		enemies_left = get_enemies_amount(global.day);
		need_to_calculate_pos = false;
		}
	spawn_cooldown = max(0,spawn_cooldown-1);
	if spawn_cooldown == 0 and enemies_left>0 {
		instance_create_layer(right_side+irandom(64)*choose(1,-1),global.ground_level,"Units",obj_enemy);
		instance_create_layer(left_side+irandom(64)*choose(1,-1),global.ground_level,"Units",obj_enemy);
		spawn_cooldown = max_spawn_cooldown;
		enemies_left--;
		}
	}
else {
	need_to_calculate_pos = true;
	}
