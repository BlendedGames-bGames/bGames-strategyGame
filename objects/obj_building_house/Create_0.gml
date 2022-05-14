/// @description Insert description here
// You can write your code in this editor

event_inherited();

level = 1;
workers = 0;
building_id = buildings.house;
workers_working = 0;
max_workers = 4;

base_max_hp = 80
max_hp = base_max_hp * (1+global.building_max_hp_percent_bonus);
hp = 0;
hp_per_hit = max_hp/40;

image_speed = 0;

base_index  = choose(0,2);

yscale = 0;

can_increase_pop_cap = true;
need_to_change_lights = true;
if base_index == 0 {
	lights[0] = instance_create_layer(x+44,y-sprite_height+102,"Buildings", obj_light_source);
	lights[0].radius = 100;
	lights[0].image_blend = make_colour_rgb(255, 255, 155);
	
	lights[1] = instance_create_layer(x+52,y-sprite_height+102,"Buildings", obj_light_source);
	lights[1].radius = 100;
	lights[1].image_blend = make_colour_rgb(255, 255, 155);
	
	lights[2] = instance_create_layer(x+81,y-sprite_height+73,"Buildings", obj_light_source);
	lights[2].radius = 100;
	lights[2].image_blend = make_colour_rgb(255, 255, 155);
	}
else if base_index == 2 {
	lights[0] = instance_create_layer(x+44,y-sprite_height+101,"Buildings", obj_light_source);
	lights[0].radius = 100;
	lights[0].image_blend = make_colour_rgb(255, 255, 155);
	
	lights[1] = instance_create_layer(x+52,y-sprite_height+101,"Buildings", obj_light_source);
	lights[1].radius = 100;
	lights[1].image_blend = make_colour_rgb(255, 255, 155);
	
	lights[2] = instance_create_layer(x+81,y-sprite_height+71,"Buildings", obj_light_source);
	lights[2].radius = 100;
	lights[2].image_blend = make_colour_rgb(255, 255, 155);
	}
