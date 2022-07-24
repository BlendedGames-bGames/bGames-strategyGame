/// @description HUD draw

var _guiw = display_get_gui_width();
var _guih = display_get_gui_height();
draw_set_font(fnt_small); 
var _bar_width = 48;

//draw_surface_ext(surf_water,0,0,.5,.25,0,c_white,1)

if pause {
	
	draw_sprite_ext(pause_sprite,0,0,0,_guiw/res_w,_guih/res_h,0,c_white,1);
	
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0,64,_guiw,global.h-64,0);
	//draw_rectangle(_guiw/2-3.5*_bar_width,0,_guiw/2+3.5*_bar_width,global.h,0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	
	var _len = array_length(current_pause_menu);
	var _yy = _guih/2 - _len*54/2;
	draw_set_halign(fa_center);
	if bgames_settings_request_timer>0 { 
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
		draw_text(_guiw/2-3*_bar_width+12,_yy+48+12,"Password:"+string_repeat("*",string_length(bgames_user.password)));	
			
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
	else if current_pause_menu == bgames_bonus {
		var _yy = _guih/2 - 160;
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		for (var i = 0; i < _len ;i++) {
			draw_sprite_ext(spr_hud_bar,0,_guiw/2-1.5*128+(i mod 3) * 128+16,_yy+128*floor(i/3),2,2,0,c_white,1);
			//draw_sprite(spr_points_shop,i,_guiw/2-1.5*128+(i mod 3) * 128+16+24,_yy+128*floor(i/3)+24);
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+24,current_pause_menu[i][shop.name]);
			var _str;
			if bgames_bonus[i][shop.times_bought]<bgames_bonus[i][shop.max_stock] {
				_str = string(bgames_prices[current_pause_menu[i][shop.times_bought]])+" point(s)";
				}
			else {
				_str = "Maxed";
			}
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+80,_str);
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+54,string(current_pause_menu[i][shop.times_bought])+"/"+string(current_pause_menu[i][shop.max_stock]));
			}
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
		draw_sprite_ext(spr_hud_bar,0,_guiw/2-3.75*_bar_width,_guih-80,7.5,1,0,c_white,1);
		draw_text(_guiw/2,_guih-80+16,"Go back");	
		}
	else if current_pause_menu == bgames_payment_method {
		var _yy = _guih/2 - 160;
		_len = array_length(bgames_attributes);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		for (var i = 0; i < _len ;i++) {
			draw_sprite_ext(spr_hud_bar,0,_guiw/2-1.5*128+(i mod 3) * 128+16,_yy+128*floor(i/3),2,2,0,c_white,1);
			//draw_sprite(spr_points_shop,i,_guiw/2-1.5*128+(i mod 3) * 128+16+24,_yy+128*floor(i/3)+24);
			draw_set_color(c_gray);
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+24,bgames_attributes[i].name);
			draw_set_color(c_white);
			draw_text(_guiw/2-1.5*128+(i mod 3) * 128+16 + 48,_yy+128*floor(i/3)+80,"points: "+string(bgames_attributes[i].data));
			}
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
		draw_sprite_ext(spr_hud_bar,0,_guiw/2-3.75*_bar_width,_guih-80,7.5,1,0,c_white,1);
		draw_text(_guiw/2,_guih-80+16,"Go back");	
		}
	else if current_pause_menu == tutorial_intro {
		_yy = _guih/2-56*1.5;
		
		draw_set_halign(fa_center);
		draw_text(_guiw/2,_yy+64,"Do you want to start with the tutorial?");	
		draw_sprite_ext(spr_hud_bar,0,_guiw/2-3*_bar_width,_yy+96,2.5,.75,0,c_white,1);
		draw_text(_guiw/2-2*_bar_width+12,_yy+96+12,tutorial_intro[0]);	
			
		draw_sprite_ext(spr_hud_bar,0,_guiw/2+24,_yy+96,2.5,.75,0,c_white,1);
		draw_text(_guiw/2+12+1.5*_bar_width,_yy+96+12,tutorial_intro[1]);	
		
		draw_set_halign(fa_left);
		}
		else if current_pause_menu == lost_menu {
		_yy = _guih/2-56*1.5;
		
		draw_set_halign(fa_center);
		draw_set_font(fnt_text);
		draw_text(_guiw/2,_yy,"You lost your Capitol\nDays Played: "+string(global.day));	
		draw_set_font(fnt_small);
		draw_sprite_ext(spr_hud_bar,0,_guiw/2-3*_bar_width,_yy+96,2.5,.75,0,c_white,1);
		draw_text(_guiw/2-2*_bar_width+12,_yy+96+12,lost_menu[0]);	
			
		draw_sprite_ext(spr_hud_bar,0,_guiw/2+24,_yy+96,2.5,.75,0,c_white,1);
		draw_text(_guiw/2+12+1.5*_bar_width,_yy+96+12,lost_menu[1]);	
		
		draw_set_halign(fa_left);
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
	
	if !surface_exists(surf_lighting) {
		surf_lighting = surface_create(global.w,global.h);
		}	
	
	
	//Drawing resources
	if render_resources {
		surface_set_target(surf_resources);
		draw_clear_alpha(c_black,0);
		draw_set_font(global.resource_font);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		//draw_text(_guiw/2 - 96 * 2.5 + 16 , 18,"A"+string(global.gold)+"+"+string(global.gold_weekly));
		draw_text(_guiw/2 - 96 * 2 + 16 , 18,"B"+string(floor(global.wood))+"+"+string(floor(global.wood_weekly)));
		draw_text(_guiw/2 - 96 * 1 + 16 , 18,"C"+string(floor(global.stone))+"+"+string(floor(global.stone_weekly)));
		draw_text(_guiw/2 + 96 * 0 + 16 , 18,"D"+string(floor(global.food))+"+"+string(floor(global.food_weekly)));
		draw_text(_guiw/2 + 96 * 1 + 16 , 18,"E"+string(global.pops)+"/"+string(global.pop_cap));
		render_resources = false;
		draw_set_font(fnt_small); 
		surface_reset_target();
		}
	
	//Drawing menu options

	if render_menu {
	
		surface_set_target(surf_menu);
		draw_clear_alpha(c_black,0);
	
		draw_sprite(spr_hud_bar,0,24,24);
		draw_sprite(spr_config_icon,0,32,32);
		
		draw_sprite(spr_hud_bar,0,global.w-24-48,24);
		var _user_exists = (bgames_user.id!=-1);
		draw_sprite(spr_config_icon,1+(_user_exists),global.w-24-48+8,32);
		if _user_exists {
			draw_set_font(global.resource_font);
			draw_sprite_ext(spr_hud_bar,0,global.w-24-48*2,24+16,32/48,32/48,0,c_white,1);
			draw_sprite(spr_hud_icon,19+bgames_stat_open,global.w-24-48*2+16,24+32);
			if bgames_stat_open {
				_len = array_length(bgames_attributes);
				for (var i = 0; i < _len ;i++) {
					draw_text(_guiw/2-_len/2*48+48*i,48,string_char_at("FGHIJK",i+1)+string(bgames_attributes[i].data));
					}
				
				
				}
			draw_set_font(fnt_small); 
			}
		draw_text(032,room_height-80-16,"Days: "+string(global.day));
		//draw_sprite_ext(spr_hud_bar,0,_guiw/2-33,room_height-80,66/_bar_width,1,0,c_white,1);
		draw_sprite(spr_hud_center,1,0,room_height-80);
		draw_set_halign(fa_center);
		draw_sprite_ext(spr_hud_bar,current_menu==menu.job,32,room_height-80,64/_bar_width,1,0,c_white,1);
		draw_sprite_ext(spr_hud_icon,0,32+32,room_height-80+12,1,1,0,c_white,1);
		draw_text(32+32,room_height-80+24,"Jobs");

		draw_sprite_ext(spr_hud_bar,current_menu==menu.build,32+64,room_height-80,64/_bar_width,1,0,c_white,1);
		draw_sprite_ext(spr_hud_icon,7,32+64+32,room_height-80+12,1,1,0,c_white,1);
		draw_text(32+64+32,room_height-80+24,"Build");

		draw_sprite_ext(spr_hud_bar,current_menu==menu.demolish,32+64*2,room_height-80,64/_bar_width,1,0,c_white,1);
		draw_sprite_ext(spr_hud_icon,6,32+64*2+32,room_height-80+12,1,1,0,c_white,1);
		draw_text(32+64*2+32,room_height-80+24,"Demolish");
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
				draw_set_halign(fa_center);
				draw_standard_button_ext(spr_hud_icon,18,"Production\nBuildings",global.w-33-64,room_height-80,64/48,1);
				draw_standard_button_ext(spr_hud_icon,7,"Civillian\nBuildings",global.w-33-64*2,room_height-80,64/48,1);
				draw_standard_button_ext(spr_hud_icon,1,"Military\nBuildings",global.w-33-64*3,room_height-80,64/48,1)
				
				}
			else if current_submenu==submenu.resource_buildings {
				draw_set_halign(fa_center);
				draw_standard_button(spr_hud_icon,8,"Cancel",global.w-33-_bar_width,room_height-80);
				draw_set_halign(fa_left);
				draw_building_buttons(resource_buildings);
				
				}
			else if current_submenu==submenu.civilian_buildings {
				draw_set_halign(fa_center);
				draw_standard_button(spr_hud_icon,8,"Cancel",global.w-33-_bar_width,room_height-80);
				draw_set_halign(fa_left);
				draw_building_buttons(civilian_buildings);
				
				}
			else if current_submenu==submenu.defensive_buildings {
				draw_set_halign(fa_center);
				draw_standard_button(spr_hud_icon,8,"Cancel",global.w-33-_bar_width,room_height-80);
				draw_set_halign(fa_left);
				draw_building_buttons(defensive_buildings);
				
				}
			else if current_submenu==submenu.build_mode {
				draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width*7,room_height-80,5,1,0,c_white,1);
				draw_set_halign(fa_center);
				draw_standard_button(spr_hud_icon,8,"Cancel",global.w-33-_bar_width,room_height-80);
				draw_standard_button(spr_hud_icon,9,"Build",global.w-33-_bar_width*2,room_height-80);
				draw_set_halign(fa_left);
				draw_text_ext(global.w-33-_bar_width*7+8,room_height-76,global.building_data[selected_building].desc,12,_bar_width*6);
				
				
				var _struct = global.building_data[selected_building];
				var _pos = 32;
				draw_set_font(fnt_small);
				draw_set_valign(fa_bottom);
				draw_text(global.w-33-_bar_width*7+8,room_height-72+22+20,"Cost:");
				if _struct.wood_cost>0 {
					draw_sprite(spr_resource_font,1,global.w-33-_bar_width*7+8+_pos,room_height-72+22);
					draw_text(global.w-33-_bar_width*7+8+_pos+16,room_height-72+22+20,string(_struct.wood_cost));
					_pos+=48;
					}
				if _struct.stone_cost>0 {
					draw_sprite(spr_resource_font,2,global.w-33-_bar_width*7+8+_pos,room_height-72+22);
					draw_text(global.w-33-_bar_width*7+8+_pos+16,room_height-72+22+20,string(_struct.stone_cost));
					_pos+=48;
					}
				//if _struct.gold_cost>0 {
				//	draw_sprite(spr_resource_font,0,global.w-33-_bar_width*7+8+_pos,room_height-72+22);
				//	draw_text(global.w-33-_bar_width*7+8+_pos+16,room_height-72+22+20,string(_struct.gold_cost));
				//	_pos+=48;
				//	}
				draw_set_valign(fa_top);
				draw_set_font(fnt_small);
				
				}
			}
		else if current_menu == menu.structure and instance_exists(current_instance) {
			draw_sprite(spr_hud_center,1,global.w,room_height-80);
			draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width*5,room_height-80,5,1,0,c_white,1);
			draw_set_halign(fa_left);
			var _title = global.building_data[current_instance.building_id].name;
		
			var _content = "";
			if (!current_instance.built) {
				_content+="unfinished";
				}
			else {
				_content+=(string(current_instance.hp)+"/"+string(current_instance.max_hp));
				}
			draw_text(global.w-33-_bar_width*5+6,room_height-80+3,_title+" ("+_content+")");
			
			if !current_instance.built {
				draw_set_halign(fa_center);
				draw_standard_button(spr_hud_icon,8,"Destroy",global.w-33-_bar_width,room_height-80);
				draw_set_halign(fa_left);
				}
			if current_instance.built {
				if current_instance.object_index == obj_building_lumberjack_hut {
					//chop tress button
					//draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width*2,room_height-80,1,1,0,c_white,1);
					var _exists =  (current_instance.cut_zone!=noone);
					var _index = 14 + _exists;
					var _text = "Cancel\nZone";
					if !_exists {
						_text = "Set\nZone";
						}
					//draw_sprite(spr_hud_skills_icon,_index,global.w-33-_bar_width*2,room_height-80);
					draw_set_halign(fa_center);
					draw_standard_button(spr_hud_icon,_index,_text,global.w-33-_bar_width,room_height-80);
					draw_set_halign(fa_left);
					draw_text(global.w-33-_bar_width*5+6,room_height-80+28,"Workers: "+string(current_instance.workers)+"/"+string(current_instance.max_workers) + "    Effectivity: "+string(current_instance.efficiency*100)+"%");
					}
				else if current_instance.object_index == obj_building_windmill or current_instance.object_index == obj_building_mining_camp {
					draw_text(global.w-33-_bar_width*5+6,room_height-80+28,"Workers: "+string(current_instance.workers)+"/"+string(current_instance.max_workers) + "    Effectivity: "+string(current_instance.efficiency*100)+"%");
					}
				else if current_instance.object_index == obj_building_watchtower {
					draw_set_halign(fa_center);
					draw_standard_button(spr_hud_icon,12+current_instance.open,!current_instance.open ? "Open" : "Close",global.w-33-_bar_width,room_height-80);
					draw_set_halign(fa_left);
					draw_text(global.w-33-_bar_width*5+6,room_height-80+28,"Archers: "+string(current_instance.slots)+"/"+string(current_instance.max_slots));
					}
				else if current_instance.object_index == obj_building_capitol {
					draw_set_halign(fa_center);
					//draw_standard_button_ext(spr_hud_icon,17,"Create\nCitizen",global.w-33-_bar_width*1.25,room_height-80,1.25,1);
					draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width,room_height-80,1,1,0,c_white,1);
					draw_sprite_ext(spr_hud_skills_icon,6,global.w-33-_bar_width,room_height-80,1,1,0,c_white,1);
					draw_set_halign(fa_left);
					
					if current_instance.spawn_orders>0 {
						var _additional = "";
						if current_instance.spawn_orders>1 {
							_additional = "("+string(current_instance.spawn_orders)+" left)";
							}
						draw_text(global.w-33-_bar_width*5+6,room_height-80+28,"Progress: "+string(floor(current_instance.unit_creation_cooldown*100/current_instance.unit_creation_cooldown_max))+"% "+_additional);
						}
					var _pos = 0;
					if (current_instance.unit_cost-global.food)>0 or (global.pops+current_instance.spawn_orders)>=global.pop_cap {

						gpu_set_colorwriteenable(true,true,true,false);
						draw_sprite_ext(spr_hud_bar,3,global.w-33-_bar_width,room_height-80,1,1,0,c_white,1);
						gpu_set_colorwriteenable(true,true,true,true);
						draw_set_color(c_red);
						if (current_instance.unit_cost-global.food)>0 {
							draw_sprite(spr_resource_font,3,global.w-33-_bar_width+8,room_height-80+_pos+8);
							draw_text(global.w-33-_bar_width+24,room_height-80+_pos+8,string(max(0,current_instance.unit_cost-global.food)));
							_pos+=16;
							}
						if (global.pops+current_instance.spawn_orders)>=global.pop_cap {
							draw_sprite(spr_resource_font,4,global.w-33-_bar_width+8,room_height-80+_pos+8);
							draw_text(global.w-33-_bar_width+24,room_height-80+_pos+8,string(global.pops+current_instance.spawn_orders));
							_pos+=16;
							}
						draw_set_color(c_white);
						}
					}
				}	
				
			}
		else if current_menu = menu.place_lumberjack_zone {
			draw_sprite(spr_hud_center,1,global.w,room_height-80);
			draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width*7,room_height-80,5,1,0,c_white,1);
			
			draw_text(global.w-33-_bar_width*7+6,room_height-80+3,"Select the area \nto cut trees");
			
			draw_set_halign(fa_center);
			draw_standard_button(spr_hud_icon,8,"Cancel",global.w-33-_bar_width,room_height-80);
			draw_standard_button(spr_hud_icon,9,"Build",global.w-33-_bar_width*2,room_height-80);
			draw_standard_button(spr_hud_icon,10,"Bigger",global.w-33-_bar_width*3,room_height-80);
			draw_standard_button(spr_hud_icon,11,"Smaller",global.w-33-_bar_width*4,room_height-80);
			draw_set_halign(fa_left);
			
			}
		else if current_menu = menu.demolish {
			draw_sprite(spr_hud_center,1,global.w,room_height-80);
			draw_sprite_ext(spr_hud_bar,0,global.w-33-_bar_width*5,room_height-80,5,1,0,c_white,1);
			if instance_exists(current_instance) and current_instance.object_index != obj_building_capitol{
				draw_set_halign(fa_center);
				draw_standard_button(spr_hud_icon,8,"Cancel",global.w-33-_bar_width,room_height-80);
				draw_standard_button(spr_hud_icon,9,"Destroy",global.w-33-_bar_width*2,room_height-80);
				draw_set_halign(fa_left);
				}
			else {
				draw_text(global.w-33-_bar_width*5+6,room_height-80+3,"Select the building\nto be demolished.");
				}
			
			} 
		surface_reset_target()
	
		render_submenu = false;
		}
		
		
	draw_sprite_ext(spr_unknown_border,0,(min_camera_chunk-1)*64-x+global.w/2,0,1,5,0,c_white,1);
	draw_sprite_ext(spr_unknown_border,0,(max_camera_chunk+1)*64-x+global.w/2,0,-1,5,0,c_white,1);	
		
	draw_surface_ext(surf_menu,0,global.h,1,-1,0,c_white,1);
	draw_surface_ext(surf_submenu,0,global.h,1,-1,0,c_white,1);
	draw_surface_ext(surf_resources,0,128,1,-1,0,c_white,1);
	
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
	//draw_sprite_ext(spr_minimap_bar,0,32+(min_camera_chunk/(global.world.size)*(_guiw-64)),_guih-18,(((max_camera_chunk-min_camera_chunk)/global.world.size)*(_guiw-64))/72,1,0,c_white,1);
	//draw_sprite_ext(spr_minimap_camera,0,32+(x/(global.world.size*64)*(_guiw-64)),_guih-18,1,1,0,c_white,1);
	//draw_rectangle(32,_guih-24,_guiw-32,_guih-8,1);
	draw_sprite_ext(spr_minimap_bar_new,0,minimap.orig_x,_guih-24,minimap.orig_scale,1,0,c_white,1);
	with obj_building_parent {
		draw_line_width(32+(x/(global.world.size*64)*(_guiw-64)),_guih-16,32+((x+sprite_width)/(global.world.size*64)*(_guiw-64)),_guih-16,1);
		}
	draw_sprite_ext(spr_minimap_bar_new,1,minimap.view_x,_guih-24,minimap.view_xscale,1,0,c_white,1);
	
	}
	
draw_set_halign(fa_left);
draw_set_valign(fa_top);


		
	
	


