///scr_click_list(list, isLeft)
var list = argument0;
if(list[7] >= 0 && list[7] < list[5]){
    if(argument1 && is_merging == 1 && list[6] >= 0 && list[6] < list[5]){
        is_merging = 0;
        ds_list_replace(button_data[? "data_merge"],5,0); 
        scr_merge_player(player_names[? list_left_data[ list[6]]], 
                         player_names[? list_left_data[ list[7]]]);
        return false;
    }
    if(!argument1 && string_pos("--- ",list_right_data[ list[7]]) == 1)
        scr_list_sort_sublist(list_right_data, list[7]+1);
    list[@ 6] = list[7];
    return true;   
}
return false;
