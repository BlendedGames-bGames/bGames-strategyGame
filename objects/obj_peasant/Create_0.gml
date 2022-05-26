// @description Insert description here
// You can write your code in this editor

hp = 3;

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

is_busy = false;

//general behaviour varibles
effect_done = false;
target_x = -1;

target_instance = noone;

//lumberjack variables

current_chunk = -1;
current_tree = -1;
current_tree_pos = -1;

//soldier variables
side = 1;
can_attack = true;
attack_cooldown = 0;
clock_offset = irandom(9);
attack_x = 0;
behind_wall = 0;

time_before_going_back_to_pos = 0;

hit_dir = 1;
scared_timer = 0;

spr_walk = spr_peasant_walk;
spr_idle = spr_peasant;
spr_work = spr_builder_work;

ds_list_add(global.peasant_list[jobs.unemployed],id);
global.pops++;

y_rand = irandom(32);
