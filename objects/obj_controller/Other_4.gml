/// @description Camera Config
res_w=display_get_width();
res_h=display_get_height();

view_set_wport(0,res_w);
view_set_hport(0,res_h);
surface_resize(application_surface,res_w,res_h);
camera_set_view_size(view_camera[0],global.w,global.h);
window_set_size(res_w,res_h);