/// @description Insert description here
// You can write your code in this editor

event_inherited();

get_forest_chunks = function() {
	ds_list_clear(forest_chunks);
	for (var i = min_pos; i < max_pos ; i++) {
		if global.world.chunk_type[i] == 2 {
			ds_list_add(forest_chunks,i);
			}
		}
	efficienty = ds_list_size(forest_chunks) / max_forest_chunks;
	}


on_selected = function() {
	with cut_zone { 
		visible=true;
		}
	}
	
on_deselected = function() {
	with cut_zone { 
		visible=false;
		}
	}



level = 1;

building_id = buildings.lumberjack_hut;
workers = 0;
workers_working = 0;
max_workers = 4;


base_max_hp = 80;
max_hp = base_max_hp * (1+global.building_max_hp_percent_bonus);
hp = 0;

image_speed = 0;
yscale = 0;
hp_per_hit = max_hp/40;

max_forest_chunks = 6;
var _pos = floor(x/64);

min_pos = max(0,_pos-2);
max_pos = min(global.world.size,_pos+4);

forest_chunks = ds_list_create();
get_forest_chunks();




gather = 0;

cut_zone = noone;



	
	
