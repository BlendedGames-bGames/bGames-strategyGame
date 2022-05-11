/// @description Insert description here
// You can write your event_inherited();


event_inherited();


level = 1;
workers = 0;
building_id = buildings.wall;
workers_working = 0;
max_workers = 4;

hp = 0;
max_hp = 32;

image_speed = 0;
yscale = 0;
hp_per_hit = max_hp/40;


nearest_wall=obj_building_capitol;

pos = x/64;
current_wall_pos = pos;
right_side = (global.base.x < x); //defines whether it's in the righe or left side of the map.

finished_placing_background_walls = false;

can_call_wall_function = true;
