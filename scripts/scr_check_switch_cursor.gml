///scr_check_switch_cursor(switch_list)
var s_list = argument0;

if(point_in_rectangle(mouse_x, mouse_y, s_list[| 0], s_list[| 1], s_list[| 2], s_list[| 3])){
    s_list[| 5] = 1;
    tooltip_text = s_list[| 6];
}
else{
    s_list[| 5] = 0;
    if(tooltip_text == s_list[| 6])
        tooltip_text = "";    
}
