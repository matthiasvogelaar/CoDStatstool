///scr_check_button_cursor(list)
if(point_in_rectangle(mouse_x, mouse_y, argument0[| 0], argument0[| 1], argument0[| 2], argument0[| 3])){
    if(argument0[| 5] > 1)
        argument0[| 5] = 3;
    else
        argument0[| 5] = 1;
}
else if(argument0[| 5] == 1 || argument0[| 5] == 3)
    argument0[| 5]--;
