///scr_merge_map_of_maps(map, key_to, key_from)
var map = argument0;
var key_to = argument1;
var key_from = argument2;

var size = ds_map_size(map);
var key = ds_map_find_first(map);
for(var i = 0; i < size; i++)
{
    scr_map_merge_keys( map[? key], key_to, key_from );
    key = ds_map_find_next(map, key);
}
