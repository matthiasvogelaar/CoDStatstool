///scr_check_buttons()

var key = ds_map_find_first(button_data);
for(var i = 0; i < button_count; i++)
{
    var data = button_data[? key];
    if(data[| 6] >= 0 || current_tab = -1-data[| 6])
        scr_check_button_cursor(data);
    key = ds_map_find_next(button_data, key);
}
