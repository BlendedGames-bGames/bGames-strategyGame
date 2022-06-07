// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generate_world(_size){
	randomize();
	var _world = {
		size: _size
		}
	
	// set up background
	_sprite_width = sprite_get_width(spr_mountain);
	_world.background = {
		sprite_size : [_sprite_width,_sprite_width*.9,_sprite_width*0.8,_sprite_width*0.7],
		mountain_repeats: [3,4,7,8]
		}
	
	//set up ground
	for (var i=0;i<_size;i++) {
		
		_world.wall_sprite[i] = noone; //sprite used for background walls
		_world.wall_y[i] = 0; //the Y coordinate of the background walls
		_world.chunk_index[i]=0; //the ground's sprite
		_world.chunk_type[i]=2; //0 baldío, 1 pradera, 2 bosque, 3 rio, 4 stone
		_world.forest_bg_index[i]=irandom_range(0,12); //image index of the background forest image 1
		_world.forest_bg_index2[i]=irandom_range(0,12); //image index of the background forest image 2
		_world.forest_tree_amount[i]=0; // how many tress the chunk has
		_world.forest_needs_to_be_animated[i] = false; //flag to check if the chunk need to have his trees animated.
		for (var j=0;j<3;j++) {
			_world.forest_tree[i][j]=-1;
			}
		}
	
	//make the center of the map a meadow
	var _center = _size/2;
	for (var i = 0; i<12;i++) {
		_world.chunk_type[_center-6+i]=1;
		}
	
	//generate random meadow locations
	
	var _meadows = _size/32;
	
	repeat(_meadows) {
		var _meadow_start = irandom(_size);
		var _meadow_size = irandom_range(5,15);
		for (var i = 0; i<_meadow_size;i++) {
			_world.chunk_type[clamp(_meadow_start+i,0,_size)]=1;
			}
		}
	
	
	//generate random stone 
	
	var _deposits =  floor(_size/42);
	var _start = _size/2;
	var _pos_bonus = 0;
	var _can_place = true;
	var _side = -1
	var _deposit_start = _start;
	while (_deposits>0 and in_range(_deposit_start,0,_size-4)) {
		_can_place = (irandom(1)+_side/_start)>.5;
		_deposit_start = _start + (_pos_bonus+20)*_side;

		if _can_place {
			for (var i = 0; i<4;i++) {
				_world.chunk_type[clamp(_deposit_start+i,0,_size)]=4;
				_world.chunk_index[clamp(_deposit_start+i,0,_size)]=3;
				}
			instance_create_layer((_deposit_start)*64,global.ground_level,"Buildings",obj_quarry);
			_deposits--;
			}
		if _side == 1 {
			_pos_bonus+=10;
			_side = -1;
			}
		else {
			_side = 1;
			}
		
		
		
		}
	
	
	//placing rivers
	var _rivers =  _size/42;
	
	while (_rivers>0) {
		
		var _river_size = irandom_range(3,8);
		var _river_start = choose(irandom_range(_size/2+2,_size-_river_size), irandom(_size/2-2-_river_size));
		while !(in_range(_river_start,0,_size-_river_size)) {
			_river_size = irandom_range(3,8);
			_river_start = irandom(_size-_river_size);
			}
		
		var _can_place = true;
		for (var i = 0; i<_river_size;i++) {
			if _world.chunk_type[_river_start+i] >2 {
				_can_place = false;
				break;
				} 
			}
		if _can_place {
			_rivers--;
			for (var i = 0; i<_river_size;i++) {
				_world.chunk_type[clamp(_river_start+i,0,_size)]=3;
				if i == 0 {
					_world.chunk_index[clamp(_river_start+i,0,_size)]=4;
					}
				else if i == _river_size-1 {
					_world.chunk_index[clamp(_river_start+i,0,_size)]=6;
					}
				else {
					_world.chunk_index[clamp(_river_start+i,0,_size)]=5;
					}
				}
			}
		}
	
	//generate trees
	for (var i=0;i<_size;i++) {
		if _world.chunk_type[i]==2 {
			_world.forest_tree_amount[i]=irandom_range(1,3);
			var _pos = 0;
			repeat ( _world.forest_tree_amount[i]) {
				_world.forest_tree[i][_pos] = new Tree(irandom_range(8,56),choose(1,-1));
				_pos++;
				}
			}
		}
	
	
	
	return _world;
}