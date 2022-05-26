// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collect_resources(){
	global.wood_weekly = 0;
	with obj_building_lumberjack_hut {
		global.wood_weekly +=gather;
		}
	global.wood+=global.wood_weekly;
	
	global.food_weekly = 0;
	with obj_building_windmill {
		global.food_weekly +=gather;
		}
	global.food+=global.food_weekly;
	
	global.stone_weekly = 0;
	with obj_building_mining_camp {
		global.stone_weekly +=gather;
		}
	global.stone+=global.stone_weekly;
	
	render_resources=true;
}