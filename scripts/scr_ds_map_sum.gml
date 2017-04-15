///scr_ds_map_sum(map)
var map = argument0;

var key = ds_map_find_first(map);
var total = 0;
var size = ds_map_size(map);
for(var i = 0; i < size; i++)
{
    total += map[? key];
    key = ds_map_find_next(map, key);
}
return total;
