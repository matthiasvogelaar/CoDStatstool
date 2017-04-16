///scr_shrink_map_of_maps(map, removeIndex, endOfList)
var map = argument0;
var removeKey = argument1;
var replaceKey = argument2;

var size = ds_map_size(map);

var key = ds_map_find_first(map);
for(var i = 0; i < size; i++)
{
    scr_shrink_map(map[? key], removeKey, replaceKey);
    key = ds_map_find_next(map, key);
}