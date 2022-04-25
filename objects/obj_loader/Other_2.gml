/// @description Global variables definitions

var res_w=display_get_width();
var res_h=display_get_height();
global.h = 384;
global.w = res_w*global.h/res_h;
display_set_gui_size(global.w,global.h);
view_set_wport(0,res_w);
view_set_hport(0,res_h);
surface_resize(application_surface,res_w,res_h);
camera_set_view_size(view_camera[0],global.w,global.h);
room_goto_next();

global.resource_font = font_add_sprite_ext(spr_resource_font,"ABCDE1234567890+/",1,1);
