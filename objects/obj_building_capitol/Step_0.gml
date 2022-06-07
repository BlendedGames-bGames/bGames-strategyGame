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

if spawn_orders>0 {
	with obj_controller {
		if (current_instance == other.id) {
			render_submenu = true;
			}
		}
	unit_creation_cooldown = min(unit_creation_cooldown+1,unit_creation_cooldown_max);
	
	if unit_creation_cooldown == unit_creation_cooldown_max {
		unit_creation_cooldown = 0;
		spawn_orders--;
		
		instance_create_layer(x+sprite_width/2,global.ground_level,"Units",obj_peasant);
		}
	}
