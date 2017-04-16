///scr_translate_map_of_maps(map, trans_map, trans_submaps)
var map = argument0;
var trans_map = argument1;
var trans_submaps = argument2;

var t_map = ds_map_create();
var size = ds_map_size(map);
var key = ds_map_find_first(map);

for(var i = 0; i < size; i++)
{
    var r_key = real(key);
    var n_key = string(trans_map[| r_key]);
    var sub_map = scr_translate_map(map[? key], trans_submaps);
    ds_map_add_map(t_map, n_key, sub_map);
    key = ds_map_find_next(map, key);
}
ds_map_destroy(map);

return t_map;
