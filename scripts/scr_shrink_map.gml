///scr_shrink_map(list, remove_index, replace_index)
var map = argument0;
var removeKey = argument1;
var replaceKey = argument2;

if(ds_map_exists(map, removeKey))
    ds_map_delete(map, removeKey);
if(!ds_map_exists(map, replaceKey))
    return true;
var value = map[? replaceKey];
ds_map_delete(map, replaceKey);
ds_map_add(map, removeKey, value);
