///scr_merge_map_of_maps(map_to, map_from)
var map_to = argument0;
var map_from = argument1;

var size_from = ds_map_size(map_from);

var key = ds_map_find_first(map_from);
for(var i = 0; i < size_from; i++)
{
    if(!ds_map_exists(map_to, key)){
        ds_map_add_map(map_to, key, ds_map_create());
        ds_map_copy( map_to[? key], map_from[? key]);
    } else
        scr_merge_map(map_to[? key], map_from[? key]);
    key = ds_map_find_next(map_from, key);
}
