// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_spawn(){
	sprite_index = spr_carcass_spawn;
	if image_index>43 {
		state = move_to_attack;
		}
}