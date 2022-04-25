/// @description HUD draw

var _guiw = display_get_gui_width();
var _guih = display_get_gui_height();
draw_set_font(fnt_text); 
var _bar_width = 48;
if pause {
	
	draw_sprite_ext(pause_sprite,0,0,0,_guiw/res_w,_guih/res_h,0,c_white,1);
	
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(_guiw/2-3.5*_bar_width,0,_guiw/2+3.5*_bar_width,global.h,0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	
	var _len = array_length(current_pause_menu);
	var _yy = _guih/2 - _len*54/2;
	draw_set_halign(fa_center);
	if bgames_settings_login_timer>0 { 
		var _yy = _guih/2 - 54*1.5;
		draw_sprite_ext(spr_hud_bar,0,_guiw/2-3*_bar_width,_yy,6,3,0,c_white,1);
		draw_text(_guiw/2,_guih/2-64,"Connecting to service");		
		draw_sprite_ext(spr_loading_icon,0,_guiw/2,_guih/2,1,1,bgames_login_angle,c_white,1);
		}
	else if current_pause_menu == main_options {
		for (var i = 0; i < _len ;i++) {
			draw_sprite_ext(spr_hud_bar,0,_guiw/2-2.5*_bar_width,_yy+54*i,5,1,0,c_white,1);
			draw_text(_guiw/2, _yy+54*i + 16,current_pause_menu[i]);		
			}
		}
	else if current_pause_menu == bgames_settings {
		for (var i = 0; i < _len ;i++) {
			draw_sprite_ext(spr_hud_bar,0,_guiw/2-2.5*_bar_width,_yy+54*i,5,1,0,c_white,1);
			draw_text(_guiw/2, _yy+54*i + 16,current_pause_menu[i]);		
			}
		}
	else if current_pause_menu == bgames_login {
		_yy = _guih/2-56*1.5;
		draw_set_halign(fa_left);
		draw_sprite_ext(spr_hud_bar,bgames_login_selection==0,_guiw/2-3*_bar_width,_yy,6,.75,0,c_white,1);
		draw_text(_guiw/2-3*_bar_width+12,_yy+12,"User:"+bgames_user.user);	
			
		draw_sprite_ext(spr_hud_bar,bgames_login_selection==1,_guiw/2-3*_bar_width,_yy+48,6,.75,0,c_white,1);
		draw_text(_guiw/2-3*_bar_width+12,_yy+48+12,"Password:"+bgames_user.password);	
			
		draw_set_halign(fa_center);
		draw_sprite_ext(spr_hud_bar,0,_guiw/2-3*_bar_width,_yy+96,2.5,.75,0,c_white,1);
		draw_text(_guiw/2-2*_bar_width+12,_yy+96+12,bgames_login[0]);	
			
		draw_sprite_ext(spr_hud_bar,0,_guiw/2+24,_yy+96,2.5,.75,0,c_white,1);
		draw_text(_guiw/2+12+1.5*_bar_width,_yy+96+12,bgames_login[1]);	
		
		if error_message.time>0 {
			draw_set_color(c_red);
			draw_text(_guiw/2,_yy+96+48,error_message.content);
			draw_set_color(c_white);
			}
		draw_set_halign(fa_left);
		}
	else if current_pause_menu == bgames_get_points {
		var _yy = _guih/2 - 160;
		draw_set_halign(fa_left);
		for (var i = 0; i < _len ;i++) {
			draw_sprite_ext(spr_hud_bar,0,_guiw/2-1.5*128+(i mod 3) * 128+16,_yy+128*floor(i/3),2,2,0,c_white,1);
			draw_sprite(spr_points_shop,i,_guiw/2-1.5*128+(i mod 3) * 128+16+24,_yy+128*floor(i/3)+24);
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+8+16,_yy+128*floor(i/3)+12,string(current_pause_menu[i][0])+" tokens");
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+8+16,_yy+128*floor(i/3)+78,string(current_pause_menu[i][1])+" point(s)");
			}
		draw_set_halign(fa_center);
		draw_sprite_ext(spr_hud_bar,0,_guiw/2-3.75*_bar_width,_guih-80,7.5,1,0,c_white,1);
		draw_text(_guiw/2,_guih-80+16,"Go back");	
		}
	else if current_pause_menu == bgames_bonus {
		var _yy = _guih/2 - 160;
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		for (var i = 0; i < _len ;i++) {
			draw_sprite_ext(spr_hud_bar,0,_guiw/2-1.5*128+(i mod 3) * 128+16,_yy+128*floor(i/3),2,2,0,c_white,1);
			//draw_sprite(spr_points_shop,i,_guiw/2-1.5*128+(i mod 3) * 128+16+24,_yy+128*floor(i/3)+24);
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+24,current_pause_menu[i][shop.name]);
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+80,string(bgames_prices[current_pause_menu[i][shop.times_bought]])+" tokens");
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+54,string(current_pause_menu[i][shop.times_bought]+1)+"/"+string(current_pause_menu[i][shop.max_stock]));
			}
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
		draw_sprite_ext(spr_hud_bar,0,_guiw/2-3.75*_bar_width,_guih-80,7.5,1,0,c_white,1);
		draw_text(_guiw/2,_guih-80+16,"Go back");	
		}
	else if current_pause_menu == bgames_payment_method {
		var _yy = _guih/2 - 160;
		_len = ds_list_size(bgames_attributes);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		for (var i = 0; i < _len ;i++) {
			draw_sprite_ext(spr_hud_bar,0,_guiw/2-1.5*128+(i mod 3) * 128+16,_yy+128*floor(i/3),2,2,0,c_white,1);
			//draw_sprite(spr_points_shop,i,_guiw/2-1.5*128+(i mod 3) * 128+16+24,_yy+128*floor(i/3)+24);
			draw_set_color(c_gray);
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+24,bgames_attributes[|i].namecategory);
			draw_set_color(c_white);
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+48,bgames_attributes[|i].nameat);
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+80,"points: "+string(bgames_attributes[|i].data));
			}
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
		draw_sprite_ext(spr_hud_bar,0,_guiw/2-3.75*_bar_width,_guih-80,7.5,1,0,c_white,1);
		draw_text(_guiw/2,_guih-80+16,"Go back");	
		}
	draw_set_halign(fa_left);
	}
	
else {
	//draw_text(32,80,"Gold: "+string(global.gold)+" +"+string(global.gold_weekly)+"\n"+
	//				"Wood: "+string(global.wood)+" +"+string(global.wood_weekly)+"\n"+
	//				"Stone: "+string(global.stone)+" +"+string(global.stone_weekly)+"\n"+
	//				"Food: "+string(global.food)+" +"+string(global.food_weekly)+"\n"+
	//				"Pops: "+string(global.pops)+"/"+string(global.pop_cap)
	//		 )

	if !surface_exists(surf_menu) {
		surf_menu = surface_create(_guiw,_guih);
		render_menu = true;
		}
	if !surface_exists(surf_submenu) {
		surf_submenu = surface_create(_guiw,_guih);
		render_submenu = true;
		}
	if !surface_exists(surf_resources) {
		surf_resources = surface_create(_guiw,128);
		render_resources = true;
		}
	
	//Drawing resources
	if render_resources {
		surface_set_target(surf_resources);
		draw_clear_alpha(c_black,0);
		draw_set_font(global.resource_font);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(_guiw/2 - 96 * 2.5 + 16 , 18,"A"+string(global.gold)+"+"+string(global.gold_weekly));
		draw_text(_guiw/2 - 96 * 1.5 + 16 , 18,"B"+string(global.wood)+"+"+string(global.wood_weekly));
		draw_text(_guiw/2 - 96 * .5 + 16 , 18, "C"+string(global.stone)+"+"+string(global.stone_weekly));
		draw_text(_guiw/2 + 96 * .5 + 16 , 18,"D"+string(global.food)+"+"+string(global.food_weekly));
		draw_text(_guiw/2 + 96 * 1.5 + 16 , 18,"E"+string(global.pops)+"/"+string(global.pop_cap));
		render_resources = false;
		draw_set_font(fnt_text); 
		surface_reset_target();
		}
	
	//Drawing menu options

	if render_menu {
	
		surface_set_target(surf_menu);
		draw_clear_alpha(c_black,0);
	
		draw_sprite(spr_hud_bar,0,24,24);
		draw_sprite(spr_config_icon,0,32,32);
	
		//draw_sprite_ext(spr_hud_bar,0,_guiw/2-33,room_height-80,66/_bar_width,1,0,c_white,1);
		draw_sprite(spr_hud_center,1,0,room_height-80);
		draw_set_halign(fa_center);
		draw_sprite_ext(spr_hud_bar,current_menu==menu.job,32,room_height-80,72/_bar_width,1,0,c_white,1);
		draw_sprite_ext(spr_hud_icon,0,32+36,room_height-80+12,1,1,0,c_white,1);
		draw_text(32+36,room_height-80+24,"Jobs");

		draw_sprite_ext(spr_hud_bar,current_menu==menu.build,32+72,room_height-80,72/_bar_width,1,0,c_white,1);
		draw_sprite_ext(spr_hud_icon,7,32+72+36,room_height-80+12,1,1,0,c_white,1);
		draw_text(32+72+36,room_height-80+24,"Build");

		draw_sprite_ext(spr_hud_bar,current_menu==menu.combat,32+72*2,room_height-80,72/_bar_width,1,0,c_white,1);
		draw_sprite_ext(spr_hud_icon,6,32+72*2+36,room_height-80+12,1,1,0,c_white,1);
		draw_text(32+72*2+36,room_height-80+24,"Combat");
		draw_set_halign(fa_left);

		surface_reset_target();
	
		render_menu = false;
	
		}

	//Drawing submenu options
	if render_submenu {
	
		surface_set_target(surf_submenu);
	
		draw_clear_alpha(c_black,0);
		//draw_sprite_ext(spr_hud_icon,0,_guiw/2+33+32,room_height-80+12,1,1,0,c_white,1);
		if current_menu == menu.job {
			draw_sprite(spr_hud_center,1,global.w,room_height-80);
		
			//free pops
			draw_sprite_ext(spr_hud_bar,0,global.w-33-64,room_height-80,64/_bar_width,1,0,c_white,1);
			draw_pop(global.peasant_list[jobs.unemployed], global.w-33-64,room_height-80, 64, _bar_width);
			draw_sprite(spr_hud_icon,0,global.w-33-32,room_height-80+12);
			for (var k = 1; k < 6; k++) {
				draw_sprite_ext(spr_hud_bar,0,global.w-33-64-_bar_width*k,room_height-80,1,1,0,c_white,1);
				draw_pop(global.peasant_list[k], global.w-33-64-_bar_width*k,room_height-80, _bar_width, _bar_width);
				draw_sprite(spr_hud_icon,k,global.w-33-64-_bar_width*k+24,room_height-80+12);
				}
			}
		else if current_menu == menu.build {
			draw_sprite(spr_hud_center,1,global.w,room_height-80);
			if current_submenu==submenu.none {
				for (var k = 0; k < 8; k++) {
					draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width*(k+1),room_height-80,1,1,0,c_white,1);
					draw_sprite_ext(spr_hud_building_icon,k,global.w-33-_bar_width*(k+1),room_height-80,1,1,0,c_white,1);
					}
				}
			else {
				draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width*7,room_height-80,5,1,0,c_white,1);
				
				draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width,room_height-80,1,1,0,c_white,1);
				draw_sprite(spr_hud_icon,8,global.w-33-_bar_width+24,room_height-80+12);
			
				draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width*2,room_height-80,1,1,0,c_white,1);
				draw_sprite(spr_hud_icon,9,global.w-33-_bar_width*2+24,room_height-80+12);
			
				draw_set_halign(fa_center);
				draw_text(global.w-33-_bar_width+24,room_height-80+24,"Cancel");
				draw_text(global.w-33-_bar_width*2+24,room_height-80+24,"Build");
				draw_set_halign(fa_left);
				draw_text_ext(global.w-33-_bar_width*7+8,room_height-72,global.building_data[selected_building].desc,9,_bar_width*6);
				}
			}
		else if current_menu == menu.structure {
			draw_sprite(spr_hud_center,1,global.w,room_height-80);
			draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width*7,room_height-80,7,1,0,c_white,1);
			draw_set_halign(fa_left);
			var _title = global.building_data[current_instance.building_id].name;
		
			var _content = "";
			if (!current_instance.built) {
				_content+="unfinished";
				}
			else {
				_content+=(string(current_instance.hp)+"/"+string(current_instance.max_hp));
				}
			
			
			draw_text(global.w-33-_bar_width*7+6,room_height-80+3,_title+" ("+_content+")");
			
			if !current_instance.built {
				draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width,room_height-80,1,1,0,c_white,1);
				draw_sprite(spr_hud_icon,8,global.w-33-_bar_width+24,room_height-80+12);
				draw_set_halign(fa_center);
				draw_text(global.w-33-_bar_width+24,room_height-80+24,"Cancel");
				draw_set_halign(fa_left);
			}
			else {
				if current_instance.object_index == obj_building_lumberjack_hut {
					draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width,room_height-80,1,1,0,c_white,1);
					draw_sprite(spr_hud_building_icon,0,global.w-33-_bar_width,room_height-80);
					draw_text(global.w-33-_bar_width*7+6,room_height-80+28,"Workers: "+string(current_instance.workers)+"/"+string(current_instance.max_workers) + "    Effectivity: "+string(current_instance.efficienty*100)+"%");
					}
				}
			}
		surface_reset_target()
	
		render_submenu = false;
		}
	draw_surface(surf_menu,0,0);
	draw_surface(surf_submenu,0,0);	
	draw_surface(surf_resources,0,0);	
	
	if current_submenu == submenu.moving_peasant {
		if selected_job == 0 {
			draw_sprite_ext(spr_hud_bar,2,global.w-33-64,room_height-80,64/_bar_width,1,0,c_white,1);
			}
		else {
			draw_sprite_ext(spr_hud_bar,2,global.w-33-64-_bar_width*selected_job,room_height-80,1,1,0,c_white,1);
			}
		draw_sprite_ext(spr_hud_circle_generic,0,global.w-33-64-_bar_width*target_job+24+8*(target_job==0),room_height-120,1,1,0,c_white,1);
		draw_sprite_ext(spr_hud_icon,target_job,global.w-33-64-_bar_width*target_job+24+8*(target_job==0),room_height-120,1,1,0,c_white,1)
		}	
	
	if show_min_button {
		draw_sprite(spr_hud_bar,0,24,_guih/2-24);
		draw_sprite_ext(spr_hud_skills_icon,0,24,_guih/2-24,1,1,0,c_white,1-.5*exploration_active[0]);
		
		if exploration_active[explore.left_side] {
			var _xx = 0;
			repeat(units_going_to_explore[explore.left_side]) {
				draw_sprite(spr_pop_icon,0,24+18+_xx,_guih/2+20);
				_xx+=18;
				}
			draw_set_halign(fa_center);
			draw_text(48,_guih/2-8,string(floor(exploration_progress[explore.left_side]*100/exploration_progress_target))+"%");
			draw_set_valign(fa_middle);
			}
		}
	else if show_max_button {
		draw_sprite(spr_hud_bar,0,_guiw-72,_guih/2-24);
		draw_sprite_ext(spr_hud_skills_icon,0,_guiw-72,_guih/2-24,1,1,0,c_white,1-.5*exploration_active[1]);
		if exploration_active[explore.right_side] {
			var _xx = 0;
			repeat(units_going_to_explore[explore.right_side]) {
				draw_sprite(spr_pop_icon,0,_guiw-72+18+_xx,_guih/2+20);
				_xx+=18;
				}
			draw_set_halign(fa_center);
			draw_text(_guiw-72+24,_guih/2-8,string(floor(exploration_progress[explore.right_side]*100/exploration_progress_target))+"%");
			draw_set_valign(fa_middle);
			}
		}
	//draw_minimap
	var _ratio = (((global.w/64)/global.world.size)*(_guiw-64))/72
	draw_sprite_ext(spr_minimap_bar,0,32+(min_camera_chunk/(global.world.size)*(_guiw-64)),_guih-18,(((max_camera_chunk-min_camera_chunk)/global.world.size)*(_guiw-64))/72,1,0,c_white,1);
	draw_sprite_ext(spr_minimap_camera,0,32+(x/(global.world.size*64)*(_guiw-64)),_guih-18,1,1,0,c_white,1);
	}
	
draw_set_halign(fa_left);
draw_set_valign(fa_top);