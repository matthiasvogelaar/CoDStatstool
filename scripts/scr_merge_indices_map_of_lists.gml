///scr_shrink_map_of_lists(map, to_Index, from_index)
var map = argument0;
var index1 = argument1;
var index2 = argument2;

var size = ds_map_size(map);

var key = ds_map_find_first(map);
for(var i = 0; i < size; i++)
{
    scr_list_merge_indices(map[? key], index1, index2);
    key = ds_map_find_next(map, key);
}
