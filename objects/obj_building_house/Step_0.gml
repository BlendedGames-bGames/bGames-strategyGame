/// @description Insert description here
// You can write your code in this editor


hp = clamp(hp,0,max_hp);

built = built or (hp==max_hp);

event_inherited();

if !built {
	yscale = hp/max_hp;
	}
else {
	yscale = 1;
	}
if built and can_increase_pop_cap {
	global.pop_cap_base+=5;
	can_increase_pop_cap = false;
	obj_controller.render_resources = true;
	}


//light and stuff
var _ratio = global.time / global.day_time;
image_index = base_index+(_ratio>0.75);

if need_to_change_lights {
	for (var i = 0 ; i<array_length(lights); i++) {
		lights[i].radius = (_ratio>0.75)*56*built;
		}
	need_to_change_lights = false;
	}

if global.time = 0 or global.time==floor((global.day_time)*.75) {
	need_to_change_lights = true;
	}


