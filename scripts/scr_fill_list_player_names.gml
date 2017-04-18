///scr_fill_list_player_names(list, data)
var list = argument0;
var data =argument1;

list[@ 5] = 0;
var keys, values, size;
size = ds_map_size(player_names);
keys[0] = 0; values[0] = 0;
scr_ds_map_separate(player_names, keys, values);
for(var i = 0; i < size; i++)
    keys[i] = string_lower(keys[i]);
scr_merge_sort_sub(keys, values, 0, size, true);
for(var i = 0; i < size; i++)
{
    data[@ i] = player_names_inverse[| values[i]];
    list[@ 5]++;
}
