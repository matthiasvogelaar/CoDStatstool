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
data[@ data_count] = "Headshots: " + string(scr_ds_map_sum(pd[? "headshots"])); data_count++;
temp_map = pd[? "deaths"];
t = scr_ds_map_sum(temp_map);
data[@ data_count] = "Deaths: " + string(t); data_count++;
data[@ data_count] = "Suicides: " + string(pd[? "suicides"]); data_count++;
var hit_rec = scr_ds_map_of_maps_sum(pd[? "hitloc_receive"]);
var hit_inf = scr_ds_map_of_maps_sum(pd[? "hitloc_inflict"]);
data[@ data_count] = "Hits Inflicted: " + string(hit_inf); data_count++;
data[@ data_count] = "Hits Received: " + string(hit_rec); data_count++;
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
var hit_loc_count = ds_map_size(hitloc_names);
//Hits inflicted stats
data[@ data_count] = "--- Hits Inflicted ---"; data_count++;
temp_map = pd[? "hitloc_inflict"];
for(var i = 0; i < hit_loc_count; i++)
{
    var total = 0;
    if(ds_map_exists(temp_map, string(i)))
        total = scr_ds_map_sum(temp_map[? string(i)]);
    total = round( (total / hit_inf)*100);
    data[@ data_count] = "  " + hitloc_names_inverse[| i] + ": " + string(total) + "%"; data_count++;
}

//Hits received stats
data[@ data_count] = "--- Hits Received ---"; data_count++;
temp_map = pd[? "hitloc_receive"];
for(var i = 0; i < hit_loc_count; i++)
{
    var total = 0;
    if(ds_map_exists(temp_map, string(i)))
        total = scr_ds_map_sum(temp_map[? string(i)]);
    total = round( (total / hit_rec)*100 );
    data[@ data_count] = "  " + hitloc_names_inverse[| i] + ": " + string(total) + "%"; data_count++;
}

list[@ 5] = data_count;
list[@ 4] = 0;
