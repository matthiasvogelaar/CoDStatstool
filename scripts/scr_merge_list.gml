///scr_merge_list(list_to, list_from)
var list_to = argument0;
var list_from = argument1;

var size_from = ds_list_size(list_from);
var size_to = ds_list_size(list_to);
for(var i = 0; i < size_from; i++)
{
    if(i >= size_to)
        ds_list_add(list_to, list_from[| i]);
    else
        list_to[| i] += list_from[| i];      
}
