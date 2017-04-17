///scr_read_json(new)
var is_new = argument0;
scr_reset_lists();
//get the file
scr_select_load_file("JSON (*.json)|*.json");
if(input_file_name == "")
    return false;
input_file_handle = file_text_open_read(input_file_name);
if(input_file_handle == -1)
{
    scr_show_prompt("Error","Could not open file - " + input_file_name + " ");
    scr_fill_list_player_names(list_left, list_left_data);
    return false;
}
else {
    scr_ini_load_file();
}
//read the data
var json_data = "";
while(!file_text_eof(input_file_handle))
    json_data += file_text_readln(input_file_handle);
var jd = json_decode(json_data);
if(!ds_exists(jd, ds_type_map)){
    scr_show_prompt("Error","An error occurred when trying to parse the following file:#" + input_file_name);
    scr_fill_list_player_names(list_left, list_left_data);
    return false;
}
//if new, replace
if(is_new){
    ds_map_destroy(codstatdata);
    player_data = jd[? "player_data"];
    player_names_inverse = jd[? "player_names"];
    weapon_names_inverse = jd[? "weapon_names"];
    hitloc_names_inverse = jd[? "hitloc_names"];
    codstatdata = jd;
    ds_map_destroy(weapon_names);
    weapon_names = ds_map_create();
    scr_build_id_map_from_list(weapon_names_inverse, weapon_names);
    ds_map_destroy(player_names);
    player_names = ds_map_create();
    scr_build_id_map_from_list(player_names_inverse, player_names);
    ds_map_destroy(hitloc_names);
    hitloc_names = ds_map_create();
    scr_build_id_map_from_list(hitloc_names_inverse, hitloc_names);
} else {
    scr_merge_json(jd);
    ds_map_destroy(jd);
}
//update the lists
scr_fill_list_player_names(list_left, list_left_data);
