///scr_merge_json(new_data)

var new_data = argument0;

if( !scr_ds_list_compare(new_data[? "player_names"], player_names_inverse) ||
    !scr_ds_list_compare(new_data[? "weapon_names"], weapon_names_inverse) ||
    !scr_ds_list_compare(new_data[? "hitloc_names"], hitloc_names_inverse)
) {
    //if needed, translate all the new id's to existing ones
    var tr_hitloc = ds_list_create();
    var tr_player = ds_list_create();
    var tr_weapon = ds_list_create();
    //get all the translate tables
    scr_get_translate_table(tr_player, player_names, new_data[? "player_names"]);
    scr_get_translate_table(tr_weapon, weapon_names, new_data[? "weapon_names"])
    scr_get_translate_table(tr_hitloc, hitloc_names, new_data[? "hitloc_names"])
    //translate all the player records
    var new_player_data = new_data[? "player_data"];
    var key = ds_map_find_first(new_player_data);
    var size = ds_map_size(new_player_data);
    for(var i = 0; i < size; i++){
        scr_translate_player_data(new_player_data[? key], tr_player, tr_weapon, tr_hitloc);
        key = ds_map_find_next(new_player_data, key);   
    }
    
}
//update the weapon/player/hitloc name mappings
scr_translate_name_data(player_names, player_names_inverse, new_data[? "player_names"], tr_player);
scr_translate_name_data(weapon_names, weapon_names_inverse, new_data[? "weapon_names"], tr_weapon);
scr_translate_name_data(hitloc_names, hitloc_names_inverse, new_data[? "hitloc_names"], tr_hitloc);
//merge the data
//player records
var key = ds_map_find_first(new_player_data);
var size = ds_map_size(new_player_data)
for(var i = 0; i < size; i++){
    if(!ds_map_exists(player_data, key))
        scr_create_player_record(key);
    scr_merge_player_record(player_data[? key], new_player_data[? key]);
    key = ds_map_find_next(new_player_data, key);
}
//cleanup
ds_list_destroy(tr_player);
ds_list_destroy(tr_weapon);
ds_list_destroy(tr_hitloc);
