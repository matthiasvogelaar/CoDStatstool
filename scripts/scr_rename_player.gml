///scr_rename_player()
var player_id = list_left[6];
if(player_id < 0 || player_id >= ds_list_size(player_names_inverse)){
    show_message("No valid player selected!");
    return false;
}
var old_player_name = player_names_inverse[| player_id ];
var new_player_name = get_string("Insert a new player name", old_player_name);
if(new_player_name == "" || string_length(new_player_name) < 1){
    show_message("Name may not be empty!");
    return false;
}
//Checken of deze naam al bestaat
if(ds_map_exists(player_data,new_player_name) || ds_map_exists(player_names, new_player_name)){
    show_message("Name already exists!");
    return false;
}

//What to do?
//Speler naar aanpassen in de speler naam mapping en speler naam array
//player_names; player_names_inverse
//----player_names_inverse
player_names_inverse[| player_id ] = new_player_name;

ds_map_delete(player_names, old_player_name);
ds_map_add(player_names, new_player_name,player_id);
//speler naam aanpassen in de player_data map
var player_data_map = player_data[? old_player_name];
ds_map_delete(player_data, old_player_name);
ds_map_add_map(player_data, new_player_name, player_data_map);

//naam aanpassen in beide lijsten
//list_left = index, list_right = 0
list_left_data[ list_left[6] ] = new_player_name;
list_right_data[0] = new_player_name;
