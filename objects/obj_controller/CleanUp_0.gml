/// @description Insert description here
// You can write your code in this editor
ds_list_destroy(global.peasant_list[jobs.unemployed]);
ds_list_destroy(global.peasant_list[jobs.builder]);
ds_list_destroy(global.peasant_list[jobs.miner]);
ds_list_destroy(global.peasant_list[jobs.lumberjack]);
ds_list_destroy(global.peasant_list[jobs.farmer]);
ds_list_destroy(global.peasant_list[jobs.soldier]);
ds_list_destroy(global.building_in_need);
ds_list_destroy(bgames_attributes);
surface_free(surf_menu);
surface_free(surf_submenu);
