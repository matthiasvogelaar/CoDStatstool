///scr_redo_lists(player_index)
var player_index = argument0;
var list_offset = list_left[4];
scr_reset_lists();
scr_fill_list_player_names(list_left, list_left_data);
if(player_index >= 0 && player_index < ds_map_size(player_names_inverse)){
    list_left[4] = min(max(list_left[5]-list_left[8]+1,0), list_offset);
    list_left[6] = player_index;
    scr_fill_list_player_data(list_right, list_right_data, player_index);
}
