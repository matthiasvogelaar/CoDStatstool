///scr_fill_list_player_data(list, list_data, player_id)
var list = argument0;
var data = argument1;
var player_id = argument2;

var pd = player_data[? player_names_inverse[| player_id]];

var t, temp_map, temp_num, data_count;
data_count = 0;
data[@ data_count] = player_names_inverse[| player_id]; data_count++;

//Base Stats
temp_map = pd[? "kills"];
t = scr_ds_map_sum(temp_map);
data[@ data_count] = "Kills: " + string(t); data_count++;
data[@ data_count] = "Headshots: " + string(pd[? "headshots"]); data_count++;
temp_map = pd[? "deaths"];
t = scr_ds_map_sum(temp_map);
data[@ data_count] = "Deaths: " + string(t); data_count++;
data[@ data_count] = "Suicides: " + string(pd[? "suicides"]); data_count++;

//Kills uitgebreid
data[@ data_count] = "--- Kills ---"; data_count++;
var player_count = ds_list_size(player_names_inverse);
temp_map = pd[? "kills"];
temp_num = ds_map_size(temp_map);
var keys, values;
keys[0] = ""; values[0] = 0;
scr_ds_map_separate(temp_map, keys, values);
for(var i = 0; i < temp_num; i++)
    keys[i] = player_names_inverse[| real(keys[i]) ];
scr_merge_sort_sub(keys, values,0,temp_num, true);
for(var i = 0; i < temp_num; i++){
    if( values[i] == 0) continue;
    data[@ data_count] = "  " + keys[i] + ": " + string(values[i]); data_count++;
}

//Deaths uitgebreid
data[@ data_count] = "--- Deaths ---"; data_count++;
temp_map = pd[? "deaths"];
temp_num = ds_map_size(temp_map);
keys = ""; values = ""; keys[0] = ""; values[0] = 0;
scr_ds_map_separate(temp_map, keys, values);
for(var i = 0; i < temp_num; i++)
    keys[i] = player_names_inverse[| real(keys[i]) ];
scr_merge_sort_sub(keys, values,0,temp_num, true);
for(var i = 0; i < temp_num; i++){
    if( values[i] == 0) continue;
    data[@ data_count] = "  " + keys[i] + ": " + string(values[i]); data_count++;
}

//Wapen stats
data[@ data_count] = "--- Weapons ---"; data_count++;
keys = ""; values = ""; keys[0] = ""; values[0] = 0;
scr_ds_map_separate(pd[? "weapons"], keys, values);
temp_num = ds_map_size(pd[? "weapons"]);
for(var i = 0; i < temp_num; i++){
    keys[i] = scr_get_weapon_name(keys[i]);
    values[i] = scr_ds_map_sum(values[i]);
}
scr_merge_sort_sub(keys, values, 0, temp_num, true);
for(var i = 0; i < temp_num; i++)
{
    if( values[i] == 0) continue;
    data[@ data_count] = "  " + keys[i] + ": " + string(values[i]); data_count++;
}

//Hits inflicted stats
data[@ data_count] = "--- Hits Inflicted ---"; data_count++;
ta_1 = ""; ta_2 = "";
ta_1[0] = "";
ta_2[0] = 0;
scr_get_map_sorted(pd[? "hitloc_inflict"], ta_1, ta_2, false);
temp_num = array_length_1d(ta_1);
for(var i = 0; i < temp_num; i++)
{
    data[@ data_count] = "  " + ta_1[i] + ": " + string(ta_2[i]); data_count++;
}

//Hits received stats
data[@ data_count] = "--- Hits Received ---"; data_count++;
ta_1 = ""; ta_2 = "";
ta_1[0] = "";
ta_2[0] = 0;
scr_get_map_sorted(pd[? "hitloc_receive"], ta_1, ta_2, false);
temp_num = array_length_1d(ta_1);
for(var i = 0; i < temp_num; i++)
{
    data[@ data_count] = "  " + ta_1[i] + ": " + string(ta_2[i]); data_count++;
}
list[@ 5] = data_count;
list[@ 4] = 0;
