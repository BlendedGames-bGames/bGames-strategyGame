/// @description Insert description here
// You can write your code in this editor

event_inherited();

//area defined as the walkable space of the player's units

building_id = buildings.town_center;


base_max_hp = 32;
max_hp = base_max_hp * (1+global.building_max_hp_percent_bonus);
hp = max_hp;

hp_per_hit = max_hp/40;

image_speed = 0;

lights[0] = instance_create_layer(x+56,y-sprite_height+167,"Buildings", obj_light_source);
lights[0].radius = 100;
lights[0].image_blend = make_colour_rgb(255, 255, 155);

lights[1] = instance_create_layer(x+94,y-sprite_height+167,"Buildings", obj_light_source);
lights[1].radius = 100;
lights[1].image_blend = make_colour_rgb(255, 255, 155);

lights[2] = instance_create_layer(x+288,y-sprite_height+167,"Buildings", obj_light_source);
lights[2].radius = 100;
lights[2].image_blend = make_colour_rgb(255, 255, 155);

lights[3] = instance_create_layer(x+325,y-sprite_height+167,"Buildings", obj_light_source);
lights[3].radius = 100;
lights[3].image_blend = make_colour_rgb(255, 255, 155);

lights[4] = instance_create_layer(x+231,y-sprite_height+60,"Buildings", obj_light_source);
lights[4].radius = 100;
lights[4].image_blend = make_colour_rgb(255, 255, 155);

lights[5] = instance_create_layer(x+151,y-sprite_height+60,"Buildings", obj_light_source);
lights[5].radius = 200;
lights[5].image_blend = make_colour_rgb(255, 255, 155);

lights[6] = instance_create_layer(x+247,y-sprite_height+60,"Buildings", obj_light_source);
lights[6].radius = 200;
lights[6].image_blend = make_colour_rgb(255, 255, 155);

lights[7] = instance_create_layer(x+135,y-sprite_height+60,"Buildings", obj_light_source);
lights[7].radius = 200;
lights[7].image_blend = make_colour_rgb(255, 255, 155);

need_to_change_lights = true;

spawn_orders = 0;

unit_creation_cooldown = 0;
unit_creation_cooldown_max = room_speed * 10;
unit_cost = 25;
unit_cost_increase = 5;

