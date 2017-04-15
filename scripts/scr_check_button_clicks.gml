///scr_check_button_clicks()
if(processing != 0)
    return false;
    
var key = ds_map_find_first(button_data);
for(var i = 0; i < button_count; i++)
{
    var data = button_data[? key];
    if(data[| 6] >= 0 && data[| 5 ] != 0){
        current_tab = data[| 6];
        is_merging = 0;
        ds_list_replace(button_data[? "data_merge"],5,0);
    } else if(current_tab == -1-data[| 6] && data[| 5] != 0)
        scr_button_actions(key, data[| 5]);
    key = ds_map_find_next(button_data, key);
}
