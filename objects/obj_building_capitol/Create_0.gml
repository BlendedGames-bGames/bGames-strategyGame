/// @description Insert description here
// You can write your code in this editor

event_inherited();

//area defined as the walkable space of the player's units

building_id = buildings.town_center;


base_max_hp = 120;
max_hp = base_max_hp * (1+global.building_max_hp_percent_bonus);
hp = max_hp;

hp_per_hit = max_hp/40;


