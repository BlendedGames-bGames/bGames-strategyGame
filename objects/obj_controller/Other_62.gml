/// @description Insert description here
// You can write your code in this editor
if bgames_settings_login_timer>0 {
	show_debug_message(json_encode(async_load));
	if ds_map_find_value(async_load, "id") == get {
		if request_type = request.login {
			if ds_map_find_value(async_load, "status") == 0 {
				var _result = ds_map_find_value(async_load, "result");
				
				try {
					bgames_user.id = real(_result);
					current_pause_menu = bgames_settings;
					bgames_user_has_logon = true;
						
					}
				catch(_err) {
					show_debug_message(_err.message);
					error_message.content="Couldn't log in."
					error_message.time = room_speed*3;
					}
					
				}
			else {
				error_message.content="Service unavailable"
				error_message.time = room_speed*3;
				}
			}
		}
	request_type = -1;
	bgames_settings_login_timer = 0;
	}
