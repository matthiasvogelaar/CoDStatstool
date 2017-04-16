///scr_translate_map(map, translate_list)
var map = argument0;
var trans = argument1;

var t_map = ds_map_create();
var size = ds_map_size(map);
var key = ds_map_find_first(map);

for(var i = 0; i < size; i++)
{
    var r_key = real(key);
    var n_key = string(trans[| r_key]);
    ds_map_add(t_map, n_key, map[? key]);
    key = ds_map_find_next(map, key);
}
ds_map_destroy(map);

return t_map;
