/// @description Insert description here
// You can write your code in this editor

hp = clamp(hp,0,max_hp);

built = built or (hp==max_hp);

event_inherited();

var _ratio = global.time / global.day_time;

image_index = _ratio>0.75;

if need_to_change_lights {
	for (var i = 0 ; i<array_length(lights); i++) {
		lights[i].radius = image_index*56;
		}
	need_to_change_lights = false;
	}

if global.time = 0 or global.time==floor((global.day_time)*.75) {
	need_to_change_lights = true;
	}

