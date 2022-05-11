/// @description Insert description here
// You can write your code in this editor
builders = 0;
max_builders = 2;
built = false;

on_selected = -1;
on_deselected = -1;

var _light = instance_create_layer(x+sprite_width/2,y-16,"Buildings", obj_light_source);

_light.radius = 200;

_light.image_blend = make_colour_rgb(255, 255, 155);

old_hp = 0;
