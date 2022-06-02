// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_spawn(){
	sprite_index = spawn_sprite;

	if (image_index>=sprite_get_number(spawn_sprite)-2){
		state = move_to_attack;
		}
}