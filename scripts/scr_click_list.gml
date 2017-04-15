///scr_click_list(list, isLeft)
var list = argument0;
if(list[7] >= 0 && list[7] < list[5]){
    if(argument1 && is_merging == 1 && list[6] >= 0 && list[6] < list[5]){
        is_merging = 0;
        button_merge[5] = 0;
        scr_merge_player(list[6], list[7]);
        return false;
    }
    list[@ 6] = list[7];
    return true;   
}
return false;
