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
room_goto_next();

global.resource_font = font_add_sprite_ext(spr_resource_font,"ABCDE1234567890+/",1,1);

global.day_time = 6*60*60//minutos*segundos*ticks;
