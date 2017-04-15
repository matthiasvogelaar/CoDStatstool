///scr_list_merge_indices(list, to_index, from_index)
var list = argument0;
var index1 = argument1;
var index2 = argument2;

var size = ds_list_size(list);
if(index1 >= size && index2 >= size)
    return true;

while(ds_list_size(list) <= index1)
    ds_list_add(list, 0);
if(index2 < ds_list_size(list))
    list[| index1] += list[| index2];
