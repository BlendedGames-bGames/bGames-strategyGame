// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generate_world(_size){
	
	var _world = {
		size: _size
		}
	
	// set up background
	_sprite_width = sprite_get_width(spr_mountain);
	_world.background = {
		sprite_size : [_sprite_width,_sprite_width*.9,_sprite_width*0.8,_sprite_width*0.7],
		mountain_repeats: [4,7,10,16]
		}
	
	//set up ground
	for (var i=0;i<_size;i++) {
		
		_world.wall_sprite[i] = noone;
		_world.wall_y[i] = 0;
		_world.chunk_sprite[i]=spr_ground;
		_world.chunk_type[i]=2; //0 baldío, 1 pradera, 2 bosque, 3 rio, 4 concrete
		_world.forest_bg_index[i]=irandom_range(0,12);
		_world.forest_bg_index2[i]=irandom_range(0,12);
		_world.forest_tree_amount[i]=0;
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
	
	var _meadows = irandom(_size/32);
	
	repeat(_meadows) {
		var _meadow_start = irandom(_size);
		var _meadow_size = irandom_range(5,15);
		for (var i = 0; i<_meadow_size;i++) {
			_world.chunk_type[clamp(_meadow_start+i,0,_size)]=1;
			}
		}
	
	//generate trees
	for (var i=0;i<_size;i++) {
		if _world.chunk_type[i]==2 {
			_world.forest_tree_amount[i]=irandom_range(1,3);
			for (var j=0;j<_world.forest_tree_amount[i];j++) {
				_world.forest_tree[i][j] = new Tree(irandom_range(8,56),choose(1,-1));
				}
			}
		}
	
	
	
	return _world;
}