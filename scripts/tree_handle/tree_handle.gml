// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tree_handle(){
	var _size = ds_list_size(forest_chunk_to_animate);
	for (var i = 0; i<_size;i++) {
		var _pos = forest_chunk_to_animate[|i];
		if !is_undefined(_pos) {
			var _trees_being_animated = 0;
			var _trees = 0;
			for (var j = 0; j< 3; j++) {
				var _tree = global.world.forest_tree[_pos][j];
				
				_trees+=(_tree!=-1);
				
				if _tree!=-1 and _tree.image_angle!=0 {
					_trees_being_animated++;
					
					if _tree.hp == 0 {
						global.world.forest_tree[_pos][j] = -1;
						global.wood+=50;
						obj_controller.render_resources = true;
						}
					else {
						_tree.image_angle -= sign(_tree.image_angle)*0.5;
						}
					}
				}
			if _trees_being_animated == 0 {
				ds_list_delete(forest_chunk_to_animate,i);
				global.world.forest_needs_to_be_animated[_pos] = false;
				if _trees == 0 {
					global.world.chunk_type[_pos] = 1;
					
					//lumberjack huts need to know if their forest area has been cut
					with obj_building_lumberjack_hut {
						get_forest_chunks();
						}
					with obj_building_windmill {
						rebuild_farm_chunks();
						}
					
					}
				}
			}
		}
	}