/// @description Insert description here
// You can write your code in this editor

event_inherited();

level = 1;
workers = 0;
building_id = buildings.tower;
workers_working = 0;
max_workers = 4;

base_max_hp = 80
max_hp = base_max_hp * (1+global.building_max_hp_percent_bonus);
hp = 0;
hp_per_hit = max_hp/40;

image_speed = 0;

base_index  = choose(0,2);

yscale = 0;


need_to_change_lights = true;

	lights[0] = instance_create_layer(x+31,y-sprite_height+43,"Buildings", obj_light_source);
	lights[0].radius = 100;
	lights[0].image_blend = make_colour_rgb(255, 255, 155);
	

