/// @description Calculate light
// You can write your code in this editor



if surface_exists(surf_lighting) {
	surface_set_target(surf_lighting);
	draw_clear(shadow_color);
	shader_set(shd_lighting);
	//gpu_set_blendmode(bm_zero);
	with obj_light_source {
		if visible {
			shader_set_uniform_f(other.u_vLightCoord,x-other.x+global.w/2,y);
			shader_set_uniform_f(other.u_fLightRadius,radius);
			draw_set_color(image_blend);
			draw_rectangle(0,0,global.w,global.h,false);
			}
		}
	draw_set_color(c_white);
	//gpu_set_blendmode(bm_normal);
	shader_reset();
	surface_reset_target();
	}	
	
	
