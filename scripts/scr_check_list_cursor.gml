///scr_check_list_cursor(array)
var arr = argument0;
if(point_in_rectangle(mouse_x, mouse_y, arr[0], arr[1], arr[2], arr[3]))
{
    if(mouse_x < arr[2] - 16)
    {
        var k = floor((mouse_y - arr[1])/list_item_height);
        arr[@ 7] = arr[4] + floor((mouse_y - arr[1])/list_item_height);
        if(arr[7] >= arr[5])
            arr[@ 7] = -10;
    } else if( point_in_rectangle(mouse_x, mouse_y, arr[2]-16, arr[1], arr[2], arr[1]+16))
        arr[@ 7] = -1;
    else if( point_in_rectangle(mouse_x, mouse_y, arr[2]-16, arr[3]-16, arr[2], arr[3]))
        arr[@ 7] = -2;
    else
        arr[@ 7] = -10;
}
else arr[@ 7] = -10;
