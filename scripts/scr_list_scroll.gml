///scr_list_scroll(list)
var arr = argument0;
if(arr[5] <= 0)
    return true;
if(arr[9] == 1){
    var yy = max(arr[1]+32, min(mouse_y,arr[3]-32)) - (arr[1]+32);

    var scrollbar_height = arr[3] - arr[1] - 32 - sprite_get_height(spr_scrollbar);
    var pixels_per_line = scrollbar_height / (arr[5] - arr[8] + 1);
    arr[@ 4] = floor( yy / pixels_per_line );
}
if(arr[9] == 3){
    if(arr[7] == -1 && arr[4] > 0){
        arr[@ 4]--;
        //arr[@ 9] = 2;
        //alarm[0] = 5;
    }
    else if(arr[7] == -2 && arr[4] <= arr[5]-arr[8] ){
        arr[@ 4]++;  
        //alarm[0] = 5;
    }
}
