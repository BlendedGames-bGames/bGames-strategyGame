// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initialize_global_modifiers(){
	
	global.time = 0;
	global.day = 0;
	global.old_time = 0;
	global.gather_timer = 0;

	global.peasant_list[jobs.unemployed] = ds_list_create();
	global.peasant_list[jobs.builder] = ds_list_create();
	global.peasant_list[jobs.miner] = ds_list_create();
	global.peasant_list[jobs.lumberjack] = ds_list_create();
	global.peasant_list[jobs.farmer] = ds_list_create();
	global.peasant_list[jobs.soldier] = ds_list_create();

	global.peasant_list[jobs.soldier_left] = ds_list_create();
	global.peasant_list[jobs.soldier_right] = ds_list_create();
	
	global.gold = 0;
	global.gold_weekly = 0;
	global.stone = 0;
	global.stone_weekly = 0;
	global.wood = 300;
	global.wood_weekly = 0;
	global.food = 0;
	global.food_weekly = 0;
	global.pop_cap = 10;
	global.pops = 0;


	global.daily_wood_gather_base = 2;
	global.daily_gold_gather_base = 2;
	global.daily_stone_gather_base = 2;
	global.daily_food_gather_base = 2;
	
	global.daily_wood_gather = 2;
	global.daily_gold_gather = 2;
	global.daily_stone_gather = 2;
	global.daily_food_gather = 2;

	global.daily_wood_gather_percent_bonus = 0;
	global.daily_gold_gather_percent_bonus = 0;
	global.daily_stone_gather_percent_bonus = 0;
	global.daily_food_gather_percent_bonus = 0;
	
	global.daily_gather_percent_bonus = 0;
	
	global.build_speed_percent_bonus = 0;
	global.building_max_hp_percent_bonus = 0;
	global.soldier_attack_speed_bonus = 0;
	global.soldier_attack_damage_bonus = 0;
	
	global.soldier_attack_damage_base = 1;
	global.soldier_attack_speed_base = 30;
	
	global.soldier_attack_damage = 1;
	global.soldier_attack_speed = 30;
	
	global.pop_cap_bonus = 0;
	global.pop_cap_base = 10;
	
	global.peasant_walk_speed_base = 0.5;
	global.peasant_run_speed_base = 1;
	
	global.peasant_walk_speed_percent_bonus = 0;
	global.peasant_run_speed_percent_bonus = 0;
	
	global.peasant_walk_speed = .5;
	global.peasant_run_speed = 1;
	
	global.carcass_run_speed = 1.5;
	
}