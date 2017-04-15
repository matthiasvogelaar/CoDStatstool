///src_list_remove_last_element(list)
var list = argument0;

var arr;
var size = ds_list_size(list) - 1;
for(var i = 0; i < size; i++)
    arr[i] = list[| i];
ds_list_clear(list);
for(var i = 0; i < size; i++)
    list[| i] = arr[i];
