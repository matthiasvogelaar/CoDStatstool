///scr_delete_player(player_id)
//verwijder de huidig geselecteerde speler
var player_id = argument0;

var player_count = ds_list_size(player_names_inverse);
if(player_id < 0 || player_id >= player_count){
    show_message("An error occured while deleting a player.#Invalid player id!");
}
//Haal de naam en vervangers id en naam op
player_name = player_names_inverse[| player_id];
replacement_id = player_count - 1;
replacement_name = player_names_inverse[| replacement_id ];
//Vervang de te verwijderen naam met de vervanger
player_names[? replacement_name] = player_id;
player_names_inverse[| player_id ] = replacement_name;
//verwijder de player uit de naam/id tabellen
ds_map_delete(player_names, player_name);
ds_list_delete(player_names_inverse, replacement_id);
//verwijder het spelers record van deze speler
ds_map_delete(player_data, player_name);
//loop over alle spelers heen en verwijder alle records die naar de te verwijderen speler wijzen
var key = ds_map_find_first(player_data);
var pid_string = string(player_id); var rid_string = string(replacement_id);
for(var i = 0; i < player_count - 1; i++)
{
    var pb = player_data[? key];
    scr_shrink_map( pb[? "kills"], pid_string, rid_string);
    scr_shrink_map( pb[? "deaths"], pid_string, rid_string);
    scr_shrink_map_of_maps( pb[? "weapons"], pid_string, rid_string);
    scr_shrink_map_of_maps( pb[? "hitloc_inflict"], pid_string, rid_string);
    scr_shrink_map_of_maps( pb[? "hitloc_receive"], pid_string, rid_string);
    key = ds_map_find_next(player_data, key);
}
