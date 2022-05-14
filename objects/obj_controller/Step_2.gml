/// @description Insert description here
// You can write your code in this editor

if !pause {
	global.old_time = global.time;
	}

// Update 3D camera
var _cam_w   = camera_get_view_width(camera);
var _cam_h   = camera_get_view_height(camera);
var _cam_x   = camera_get_view_x(camera) + _cam_w / 2;
var _cam_y   = camera_get_view_y(camera) + _cam_h / 2;

view_mat = matrix_build_lookat(_cam_x, _cam_y, cam_dist, _cam_x, _cam_y, 0, 0, 1, 0);
proj_mat = matrix_build_projection_perspective_fov(cam_fov, cam_asp, 3, 30000);

camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);

camera_apply(camera);

