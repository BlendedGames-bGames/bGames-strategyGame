/// @description Insert description here
// You can write your code in this editor



job = jobs.unemployed;

//Units are state machines. Each state machine will to his "state" method if "check_state". 
//Once "state" finishes, "on_finish_state" will be called once, and "next_state" will be
//the next state. If cancelled, "cancel_state" will be called once.

state=wander;

check_state = -1;

next_state = -1;

cancel_state = -1;

on_finish_state = -1;

timer = 0;

//general behaviour varibles
effect_done = false;
target_x = -1;

target_instance = noone;
target_side = 0;
//lumberjack variables

current_chunk = -1;
current_tree = -1;

walk_speed = .5;
run_speed = 1;

ds_list_add(global.peasant_list[jobs.unemployed],id);
global.pops++;