///scr_click_list_scrollbar(list)
var arr = argument0;
if(arr[5] <= 0)
    return true;
if(point_in_rectangle(mouse_x,mouse_y,arr[2] - 15, arr[1] + 16, arr[2]-1, arr[3] - 15))
{
    arr[@ 9] = 1;
}
if(arr[7] == -1 || arr[7] == -2){
    if(arr[7] == -1 && arr[4] > 0){
        arr[@ 4]--;
        arr[@ 9] = 2;
        alarm[0] = 15;
    }
    else if(arr[7] == -2 && arr[4] <= arr[5]-arr[8] ){
        arr[@ 4]++;  
        alarm[0] = 15;
    }
}
