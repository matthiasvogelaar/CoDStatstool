///scr_merge_sort_by_keys_lower(keys, values,from,to, ascending)
var list = argument0;
var values = argument1;
var from = argument2;
var to = argument3;
var asc = argument4;

var sort_list;
sort_list[0] = 1;
for(var i = from; i < to; i++)
    sort_list[i] = string_lower(list[i]);
    
scr_merge_sort_sub(sort_list, values, from, to, asc);
