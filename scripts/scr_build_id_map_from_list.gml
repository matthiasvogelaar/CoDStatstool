///scr_build_id_map_from_list(id_list, id_map)
var id_list = argument0;
var id_map = argument1;

var size = ds_list_size(id_list);
for(var i = 0; i < size; i++)
    ds_map_add(id_map, id_list[| i], i);
