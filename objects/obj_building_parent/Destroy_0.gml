/// @description Insert description here
// You can write your code in this editor

with obj_controller {
	if current_instance = other {
		current_menu = menu.none;
		render_menu = true;
		render_submenu = true;
		}
	}
	
audio_play_sound_at(snd_wall1_destroy,x,y,0,64,24,1,0,8);
