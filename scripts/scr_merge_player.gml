///scr_merge_player(player_to_id, player_from_id)
//voegt twee spelers samen
var player_to = argument0;
var player_from = argument1;

var player_count = ds_list_size(player_names_inverse);
// TEST
//save the kills and deaths and weapon totals
var test_arr;
for(var i = 0; i < player_count; i++){
    var t = 0;
    var pd = player_data[? player_names_inverse[| i]];
    var temp_map = pd[? "kills"];
    t = scr_ds_map_sum(temp_map);
    test_arr[i,0] = t
    t = 0;
    temp_map = pd[? "deaths"];
    t = scr_ds_map_sum(temp_map);
    test_arr[i,1] = t;
    temp_map = pd[? "weapons"];
    t = scr_ds_map_of_maps_sum(temp_map);
    test_arr[i,2] = t;
    temp_map = pd[? "hitloc_receive"];
    t = scr_ds_map_of_maps_sum(temp_map);
    test_arr[i,3] = t;
    temp_map = pd[? "hitloc_inflict"];
    t = scr_ds_map_of_maps_sum(temp_map);
    test_arr[i,4] = t;
}

//Data checken
if(player_to == player_from){
    is_merging = false;
    return false;
}

if(player_to < 0 || player_from < 0 || player_to >= player_count || player_from >= player_count){
    show_message("Invalid players selected");
    is_merging = false;
    return false;
}
//Bevestinging vragen
if!(show_question("Are you sure you want to merge the following players?#[ "+
            player_names_inverse[| player_to]+ " ] and [ " + player_names_inverse[| player_from] + " ]#"+
            "All data will be stored in [ " + player_names_inverse[| player_to] + " ]"))
{
    is_merging = false;
    button_merge[5] = 0;
    return false;        
}

//Start het mergen maar
//Merge de twee spelers
var player_to_name = player_names_inverse[| player_to];
var player_from_name = player_names_inverse[| player_from];

var player_to_data = player_data[? player_to_name];
var player_from_data = player_data[? player_from_name];

//Merge the kills
scr_merge_map(player_to_data[? "kills"], player_from_data[? "kills"]);
//Merge the deaths
scr_merge_map(player_to_data[? "deaths"], player_from_data[? "deaths"]);
//Merge the weapons
scr_merge_map_of_maps(player_to_data[? "weapons"], player_from_data[? "weapons"]);
//Merge the hits received
scr_merge_map_of_maps(player_to_data[? "hitloc_receive"], player_from_data[? "hitloc_receive"]);
//Merge the hits inflicted
scr_merge_map_of_maps(player_to_data[? "hitloc_inflict"], player_from_data[? "hitloc_inflict"]);
//Merge the other stats
player_to_data[? "suicides"] += player_from_data[? "suicides"];
player_to_data[? "headshots"] += player_from_data[? "headshots"];

//Over alle andere spelers heenlopen om daar de stats van de te mergen
var player_key = ds_map_find_first(player_data);
var player_to_string = string(player_to);
var player_from_string = string(player_from);
for(var i = 0; i < player_count; i++)
{
    var pd = player_data[? player_key];
    scr_map_merge_keys(pd[? "kills"], player_to_string, player_from_string);
    scr_map_merge_keys(pd[?  "deaths"], player_to_string, player_from_string);
    scr_map_of_maps_merge_keys(pd[? "weapons"], player_to_string, player_from_string);
    scr_map_of_maps_merge_keys(pd[? "hitloc_receive"], player_to_string, player_from_string);
    scr_map_of_maps_merge_keys(pd[? "hitloc_inflict"], player_to_string, player_from_string);
    
    player_key = ds_map_find_next(player_data, player_key);
}

//Oude record verwijderen
scr_delete_player(player_from);

scr_redo_lists(player_to);

// TEST
//KIJKT OF DE KILLS EN DEATHS NOG STEEDS OVEREEN KOMEN
for(var i = 0; i < 5; i++){
    test_arr[player_to, i] += test_arr[player_from, i];
    test_arr[player_from, i] = test_arr[player_count-1,i];
}
for(var i = 0; i < player_count-1; i++){
    var pd = player_data[? player_names_inverse[| i]];
    var keys;
    keys[0] = "kills";keys[1] = "deaths";keys[2] = "weapons";keys[3] = "hitloc_receive";keys[4] =  "hitloc_inflict";
    for(var j = 0; j < 5; j++)
    {
        var t = 0;
        var temp_map = pd[? keys[j]];
        if(j < 2)
            t = scr_ds_map_sum(temp_map);
        else
            t = scr_ds_map_of_maps_sum(temp_map);
        if(test_arr[i,j] != t)
            show_message("An error occurred during the merge.#" + keys[j]+ " mismatch for " + player_names_inverse[| i]);
    }
} 
