///scr_ds_map_of_maps_sum(map)
var map = argument0;

var size = ds_map_size(map);
var key = ds_map_find_first(map);
var total = 0;
for(var i = 0; i < size; i++){
    total += scr_ds_map_sum( map[? key]);
    key = ds_map_find_next(map, key);
}
