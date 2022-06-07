/// @description Insert description here
// You can write your code in this editor

current_tutorial_sucessful = false;
current_tutorial++
audio_play_sound(snd_tut_progress,9,0);
y = -32;
image_alpha = 0;

arrow_x = 0;
arrow_alpha = 0;

show_debug_message("tutorial step: "+string(current_tutorial));

if current_tutorial>=array_length(tutorial_condition) {
	instance_destroy();
	}
