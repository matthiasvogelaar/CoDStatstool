///scr_map_merge_keys(map, key_to, key_from)
var map = argument0;
var key_to = argument1;
var key_from = argument2;

if(!ds_map_exists(map, key_from))
    return true;
if(!ds_map_exists(map, key_to))
    ds_map_add(map, key_to, 0);
map[? key_to] += map[? key_from];
