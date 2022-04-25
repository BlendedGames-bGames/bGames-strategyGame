/// @description Insert description here
// You can write your code in this editor



job = jobs.unemployed;
state=wander;
timer = 0;

//general behaviour varibles
effect_done = false;
target_x = -1;
next_state = -1;
target_instance = noone;
target_side = 0;
//lumberjack variables

current_chunk = -1;
current_tree = -1;

walk_speed = .5;
run_speed = 1;

ds_list_add(global.peasant_list[jobs.unemployed],id);
global.pops++;