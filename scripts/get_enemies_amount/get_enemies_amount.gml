// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_enemies_amount(day){
	var _val = 4;
	
	switch (day) {
		case 1:
			_val = 4;
			break;
		case 2:
			_val = 6;
			break;
		case 3:
			_val = 10;
			break;
		case 4:
			_val = 16;
			break;
		case 5: 
			_val = 26;
			break;
		case 6:
			_val = 18;
			break;
		case 7:
			_val = 26;
			break;
		case 8:
			_val = 30;
			break;
		case 9:
			_val = 42;
			break;
		case 10: 
			_val = 60;
			break;
		default:
			_val = day * 5 + 4;
		}
	
	return _val;
}