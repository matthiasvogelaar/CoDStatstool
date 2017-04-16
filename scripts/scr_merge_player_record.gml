///scr_merge_player_record(player_to_data, player_from_data)
var player_to_data = argument0;
var player_from_data = argument1;

//Merge the kills
scr_merge_map(player_to_data[? "kills"], player_from_data[? "kills"]);
//Merge the deaths
scr_merge_map(player_to_data[? "deaths"], player_from_data[? "deaths"]);
//Merge the headshots
scr_merge_map(player_to_data[? "headshots"], player_from_data[? "headshots"]);
//Merge the weapons
scr_merge_map_of_maps(player_to_data[? "weapons"], player_from_data[? "weapons"]);
//Merge the hits received
scr_merge_map_of_maps(player_to_data[? "hitloc_receive"], player_from_data[? "hitloc_receive"]);
//Merge the hits inflicted
scr_merge_map_of_maps(player_to_data[? "hitloc_inflict"], player_from_data[? "hitloc_inflict"]);
//Merge the other stats
player_to_data[? "suicides"] += player_from_data[? "suicides"];
