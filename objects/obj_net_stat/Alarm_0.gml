/// @description Insert description here
// You can write your code in this editor
if times == 0 {
	game_end();
	}
var _str = "id_player=0"+
			"&id_attributes=0"+
			"&new_data=0";
request_time = get_timer();

get = http_post_string(dimensions_post_service+"/spend_attribute/",_str);
alarm[0] = room_speed*1;
times--;
