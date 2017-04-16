///scr_button_actions(button_name, button_highlight_state)
var name = argument0;
var state = argument1;
switch(name){
    case "data_rename":
        scr_rename_player();
    break;
    case "data_delete":
        scr_delete_player_button();
    break;
    case "data_merge":
        if(state == 1){
            is_merging = 1;
            ds_list_replace(button_data[? "data_merge"], 5, 2);
        } else if state == 3 {
            ds_list_replace(button_data[? "data_merge"], 5, 0);
            is_merging = 0;
        }
    break;
    case "write_readable":
        output_format = 0;
        processing = 4;
    break;
    case "write_json":
        output_format = 1;
        processing = 4;
    break;
    case "read_log_new":
        scr_reset_data();
    case "read_log_add":
        scr_reset_lists();
        scr_select_load_file();
        processing = 1;
    break;
}
