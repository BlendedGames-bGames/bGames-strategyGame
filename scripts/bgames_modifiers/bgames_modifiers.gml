// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bgames_modifiers(){
	global.pop_cap = global.pop_cap_base + global.pop_cap_bonus;
	
	global.daily_wood_gather  = global.daily_wood_gather_base  * (1+global.daily_wood_gather_percent_bonus + global.daily_gather_percent_bonus);
	global.daily_gold_gather  = global.daily_gold_gather_base  * (1+global.daily_gold_gather_percent_bonus + global.daily_gather_percent_bonus);
	global.daily_stone_gather = global.daily_stone_gather_base * (1+global.daily_stone_gather_percent_bonus+ global.daily_gather_percent_bonus);
	global.daily_food_gather  = global.daily_food_gather_base  * (1+global.daily_food_gather_percent_bonus + global.daily_gather_percent_bonus);
	
	global.peasant_walk_speed = global.peasant_walk_speed_base * (1+global.peasant_walk_speed_percent_bonus);
	global.peasant_run_speed = global.peasant_run_speed_base   * (1+global.peasant_run_speed_percent_bonus);
}