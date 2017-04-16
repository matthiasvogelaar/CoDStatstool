///scr_translate_name_data(primary, inverse, new_data, translation)
var primary = argument0;
var inverse = argument1;
var new_data = argument2;
var translation = argument3;

var size = ds_list_size(new_data);
var new_value_index = ds_list_size(inverse);
for(var i = 0; i < size; i++){
    if( translation[| i] < new_value_index)
        continue;
    inverse[| translation[| i]] = new_data[| i];
    ds_map_add(primary, new_data[| i], translation[| i]);
}
