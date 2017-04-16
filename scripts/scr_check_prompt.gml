///scr_check_prompt()

if(!prompt_exists)
    return false;
var center_x = room_width / 2;
var center_y = room_height / 2;
if(prompt_type == 0){
    if(point_in_rectangle(mouse_x, mouse_y, center_x - 32, center_y + (prompt_height/2) - 48, center_x + 32, center_y + (prompt_height/2) - 16))
        prompt_button_highlight = 0;
    else
        prompt_button_highlight = -1;
} else if(prompt_type == 1){
    var x1 = floor(center_x - prompt_width / 2);
    var x2 = floor(center_x + prompt_width / 2);
    var y2 = floor(center_y + prompt_height/ 2);
    if(point_in_rectangle(mouse_x, mouse_y,x1 + 64, y2 - 48, x1 + 128, y2 - 16))
        prompt_button_highlight = 0;
    else if(point_in_rectangle(mouse_x, mouse_y, x2 - 128, y2 - 48, x2 - 64, y2 - 16))
        prompt_button_highlight = 1;
    else
        prompt_button_highlight = -1;
}
else
    prompt_button_highlight = -1;
