// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function define_building_info(){
	var _structures;
	_structures[buildings.lumberjack_hut]= {
		name: "Lumberjack's hut",
		desc: "Extracts wood from surrounding area.",
		gold_cost: 0,
		food_cost: 0,
		stone_cost: 10,
		wood_cost: 10,
		cost_per_chunk: false,
		sprite_index: spr_lumberjack_hut,
		object: obj_building_lumberjack_hut,
		length: 2
		};
	_structures[buildings.wall]= {
		name: "Wall",
		desc: "Protects your base and citizens from enemies.",
		gold_cost: 0,
		food_cost: 0,
		stone_cost: 10,
		wood_cost: 10,
		cost_per_chunk: true,
		sprite_index: spr_wall,
		object: obj_building_wall,
		length: 1
		};
	_structures[buildings.town_center]= {
		name: "Capitol",
		desc: "Create citizens and controls your settlement",
		gold_cost: 0,
		food_cost: 0,
		stone_cost: 0,
		wood_cost: 0,
		cost_per_chunk: false,
		sprite_index: spr_base,
		object: obj_building_capitol,
		length: 2
		};
	return _structures;
}