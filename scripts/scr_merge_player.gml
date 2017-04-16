///scr_merge_player(player_to_id, player_from_id)
//voegt twee spelers samen
var player_to = argument0;
var player_from = argument1;

var player_count = ds_list_size(player_names_inverse);

//Data checken
if(player_to == player_from){
    is_merging = false;
    return false;
}

if(player_to < 0 || player_from < 0 || player_to >= player_count || player_from >= player_count){
    scr_show_prompt("Error","Invalid players selected");
    is_merging = false;
    return false;
}
//Bevestinging vragen
var yes_args;
yes_args[0] = player_to;
yes_args[1] = player_from;
scr_show_question("Confirm Action","Are you sure you want to merge the following players?#[ "+
            player_names_inverse[| player_to]+ " ] and [ " + player_names_inverse[| player_from] + " ]#"+
            "All data will be stored in#[ " + player_names_inverse[| player_to] + " ]",
            scr_merge_player_action, scr_prompt_merge_no,2, yes_args, 0, 0);
