// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function smoothstep(p){
	return clamp(p * p * (3 - 2 * p),0,1);
}