///scr_delete_player_button

var player_id = list_left[6];
if(player_id < 0 || player_id >= ds_list_size(player_names_inverse)){
    show_message("No valid player selected!");
    return false;
}
var player_name = player_names_inverse[| player_id];

var do_delete = show_question("Are you sure you want to delete the following player?#[ " + player_name + " ]");
if(do_delete){
    scr_delete_player(player_id);
    scr_redo_lists(-1);
}
    
