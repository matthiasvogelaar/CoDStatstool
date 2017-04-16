///scr_get_translate_table(translate_table, existing_map, new_list)
var translate_table = argument0;
var existing_map = argument1;
var new_list = argument2;

var size = ds_list_size(new_list);
var new_id_index = ds_map_size(existing_map);
for(var i = 0; i < size; i++)
{
    if(ds_map_exists(existing_map, new_list[| i])){
        translate_table[| i] = existing_map[? new_list[| i]];
    } else {
        translate_table[| i] = new_id_index;
        new_id_index++;
    }
}
