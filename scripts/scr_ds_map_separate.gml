///scr_ds_map_separate(map, keys_array, values_array)
var map = argument0;
var keys = argument1;
var values = argument2;

var key = ds_map_find_first(map);
var size = ds_map_size(map);
for(var i = 0; i < size; i++){
    keys[@ i] = key;
    values[@ i] = map[? key];
    key = ds_map_find_next(map, key);
}
return size;
