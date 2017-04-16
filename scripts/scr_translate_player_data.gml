///scr_translate_player_data(player_data, player_trans, weapon_trans, hitloc_trans)
var pd = argument0;
var tr_player = argument1;
var tr_weapon = argument2;
var tr_hitloc = argument3;

pd[? "kills"] = scr_translate_map(pd[? "kills"], tr_player);
pd[? "deaths"] = scr_translate_map(pd[? "deaths"], tr_player);
pd[? "headshots"] = scr_translate_map(pd[? "headshots"], tr_player);
pd[? "weapons"] = scr_translate_map_of_maps(pd[? "weapons"], tr_weapon, tr_player);
pd[? "hitloc_receive"] = scr_translate_map_of_maps(pd[? "hitloc_receive"], tr_hitloc, tr_player);
pd[? "hitloc_inflict"] = scr_translate_map_of_maps(pd[? "hitloc_inflict"], tr_hitloc, tr_player);

