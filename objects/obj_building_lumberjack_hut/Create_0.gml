/// @description Insert description here
// You can write your code in this editor

event_inherited();

level = 1;

building_id = buildings.lumberjack_hut;
workers = 0;
workers_working = 0;
max_workers = 4;

hp = 0;
max_hp = 240;


image_speed = 0;
yscale = 0;
hp_per_hit = max_hp/40;

max_forest_chunks = 6;
var _pos = floor(x/64);

var _min = max(0,_pos-2);
var _max = min(global.world.size,_pos+4);

forest_chunks = ds_list_create();

for (var i = _min; i < _max ; i++) {
	if global.world.chunk_type[i] == 2 {
		ds_list_add(forest_chunks,i);
		}
	}

efficienty = ds_list_size(forest_chunks) / max_forest_chunks;

gather = 0;



