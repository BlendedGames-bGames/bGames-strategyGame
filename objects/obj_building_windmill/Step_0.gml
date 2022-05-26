/// @description Insert description here
// You can write your code in this editor

air_time = (air_time+1) mod 360;

hp = clamp(hp,0,max_hp);

built = built or (hp==max_hp);

event_inherited();

if !built {
	yscale = hp/max_hp;
	}
else {
	if need_to_create_farms {
		rebuild_farm_chunks();
		need_to_create_farms = false;
		}
	yscale = 1;
	}


gather = workers_working * efficiency * global.daily_food_gather;


//light and stuff
var _ratio = global.time / global.day_time;
image_index = (_ratio>0.75);

if need_to_change_lights {
	for (var i = 0 ; i<array_length(lights); i++) {
		lights[i].radius = (_ratio>0.75)*56*built;
		}
	need_to_change_lights = false;
	}

if global.time = 0 or global.time==floor((global.day_time)*.75) {
	need_to_change_lights = true;
	}

visible = in_range(x,obj_controller.x-global.w/2-64*2,obj_controller.x+global.w/2+64*5);


