/// @description Insert description here
// You can write your code in this editor
ds_list_destroy(global.peasant_list[jobs.unemployed]);
ds_list_destroy(global.peasant_list[jobs.builder]);
ds_list_destroy(global.peasant_list[jobs.miner]);
ds_list_destroy(global.peasant_list[jobs.lumberjack]);
ds_list_destroy(global.peasant_list[jobs.farmer]);
ds_list_destroy(global.peasant_list[jobs.soldier]);
ds_list_destroy(global.peasant_list[jobs.soldier_left]);
ds_list_destroy(global.peasant_list[jobs.soldier_right]);
//ds_list_destroy(bgames_attributes);
surface_free(surf_menu);
surface_free(surf_submenu);
surface_free(surf_resources);
//surface_free(surf_parallax);
surface_free(surf_pause);
surface_free(surf_lighting);
surface_free(surf_water);
surface_free(surf_entities);
surface_free(surf_shaded_entities);
surface_free(surf_rendered_water);
