///scr_delete_player_button

var player_name = list_left_data[ list_left[6]];
var player_id = player_names[? player_name];
if(player_id < 0 || player_id >= ds_list_size(player_names_inverse)){
    scr_show_prompt("Error","No valid player selected!");
    return false;
}
var yes_args;
yes_args[0] = player_id;
scr_show_question("Confirm Action","Are you sure you want to delete the following player?#[ " + player_name + " ]", 
                scr_prompt_delete_yes, -10, 1, yes_args, 0,0);
    
