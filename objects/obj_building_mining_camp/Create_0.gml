/// @description Insert description here
// You can write your code in this editor

event_inherited();


//get_farm_chunks = function() {
//	ds_list_clear(farm_chunks);
//	for (var i = min_pos; i < max_pos ; i++) {
//		if global.world.chunk_type[i - min_pos] == 1  and !position_meeting(i*64,global.ground_level-8,obj_building_parent)  {
//			//farm chuk
//			farm_chunks[|i - min_pos] = new Farm(i);
//			}
//		}
//	efficiency = ds_list_size(farm_chunks) / max_farm_chunks;
//	}




air_time = 0;

var _pos = floor(x/64);

min_pos = max(0,_pos-2);
max_pos = min(global.world.size,_pos+4);

//rebuild_farm_chunks();
efficiency = 0;
level = 1;
workers = 0;
building_id = buildings.mining_camp;
workers_working = 0;
max_workers = 4;

base_max_hp = 80
max_hp = base_max_hp * (1+global.building_max_hp_percent_bonus);
hp = 0;
hp_per_hit = max_hp/40;

gather = 0;
image_speed = 0;


yscale = 0;

need_to_change_lights = true;

lights[0] = instance_create_layer(x+45,y-sprite_height+133,"Buildings", obj_light_source);
lights[0].radius = 100;
lights[0].image_blend = make_colour_rgb(255, 255, 155);
	
lights[1] = instance_create_layer(x+79,y-sprite_height+133,"Buildings", obj_light_source);
lights[1].radius = 100;
lights[1].image_blend = make_colour_rgb(255, 255, 155);
	
efficiency = 1;

