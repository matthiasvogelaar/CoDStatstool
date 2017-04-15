///src_get_map_sorted(map, keys, values, getTotals)
var map = argument0;
var keys = argument1;
var values = argument2;
var getTotals = argument3;

var temp, size;
size = ds_map_size(map);
temp = ds_map_find_first(map);
for(var i = 0; i < size; i++)
{
    keys[@ i] = temp;
    values[@ i] = map[? temp];
    if(getTotals){
        var size2 = ds_map_size(values[@ i]);
        var temp2 = ds_map_find_first(values[@ i]);
        var map2 = values[@ i];
        values[@ i] = 0;
        for(var j = 0; j < size2; j++){
            values[@ i] += map2[? temp2];
            temp2 = ds_map_find_next(map2, temp2);
        }
    }
    temp = ds_map_find_next(map, temp);
}

scr_merge_sort_sub(keys, values,0,size, true);
