/// @description 3D camera control

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
//if view_mat!=-1 {
//	camera_vector = screen_to_world(0,0,view_mat,proj_mat);
//	view_world_coord = screen_vector_to_plane(camera_vector[3],camera_vector[4],camera_vector[5],camera_vector[0],camera_vector[1],camera_vector[2]+800,0,0,0,0,0,1);
//	//view_width=abs(view_world_coord[0] - camera_vector[3]);
//	//view_height=abs(view_world_coord[1] - camera_vector[4]);
//	}
