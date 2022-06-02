/// @description Global variables definitions

global.res_w=display_get_width();
global.res_h=display_get_height();
global.h = 384;
global.w = global.res_w*global.h/global.res_h;
display_set_gui_size(global.w,global.h);
view_set_wport(0,global.res_w);
view_set_hport(0,global.res_h);
surface_resize(application_surface,global.res_w,global.res_h);
camera_set_view_size(view_camera[0],global.w,global.h);


global.resource_font = font_add_sprite_ext(spr_resource_font,"ABCDE1234567890+/",1,1);

global.day_time = 5*60*60//minutos*segundos*ticks;
global.job_endtime = 0.65; // [0,1]
global.night_attack_time = 0.75;

ini_open("options.ini");
//read the values from the ini and assign them to your game variables
global.sfx_volume=ini_read_real("settings", "sfx_volume",1);
global.music_volume=ini_read_real("settings", "music_volume",1);
global.fullscreen=ini_read_real("settings", "fullscreen_mode",false);
//ALWAYS close your ini once you are done with reading/writing
ini_close();
window_set_fullscreen(global.fullscreen);
audio_group_load(SFX);
audio_group_load(Music);
audio_group_set_gain(SFX,global.sfx_volume,0);
audio_group_set_gain(Music,global.music_volume,0);
audio_debug(1);

room_goto_next();
