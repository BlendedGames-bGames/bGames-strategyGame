/// @description Insert description here
// You can write your code in this editor
image_angle_speed+=0.05;
image_angle+=image_angle_dir * image_angle_speed;

image_angle = clamp (image_angle,-90,90);

if abs(image_angle) == 90 {

	image_alpha-=0.01;
	}
	
if image_alpha == 0 {
	instance_destroy();
	}
