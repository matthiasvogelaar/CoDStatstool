///scr_draw_list(array, data)
var arr = argument0;
var data = argument1;
if(arr[7] < 0 && arr[7] > -3)
    draw_set_color(c_red);
else
    draw_set_color(c_blue);
if(arr[7] < 0 && arr[7] > -5){
    if((arr[7] + 4) % 2 == 1)
        draw_rectangle(arr[2]-16, arr[1], arr[2], arr[1]+16, false)
    if((arr[7] + 4) % 2 == 0)
        draw_rectangle(arr[2]-16, arr[3]-16, arr[2], arr[3], false)
}
draw_set_color(c_white);
draw_rectangle(arr[0], arr[1], arr[2], arr[3], true);
draw_line(arr[2]-16, arr[1], arr[2]-16, arr[3]);
draw_line(arr[2]-16, arr[1]+16, arr[2], arr[1]+16);
draw_triangle(arr[2]-12, arr[1]+12, arr[2]-4, arr[1]+12, arr[2]-8, arr[1]+6, false);
draw_line(arr[2]-16, arr[3]-16, arr[2], arr[3]-16);
draw_triangle(arr[2]-12, arr[3]-12, arr[2]-4, arr[3]-12, arr[2]-8, arr[3]-6, false);
//draw the scroll bar
if(arr[5] > 0){
    var scrollbar_height = arr[3] - arr[1] - sprite_get_height(spr_scrollbar) - 32;
    var pixels_per_line = scrollbar_height / (arr[5] - arr[8] + 1);
    var yy = (arr[4] * pixels_per_line);
    if(arr[4] == arr[5] + 1)
        yy = scrollbar_height;
    draw_sprite(spr_scrollbar,0,arr[2]-15,floor(arr[1]+16+yy));
}
var yy = arr[1] + list_item_height;
draw_set_halign(fa_left);
var index = arr[4];
while(yy <= arr[3] && index < arr[5] && index < array_length_1d(data)){
    if(index == arr[7]){
        draw_set_color(c_red);
        draw_rectangle(arr[0]+1, yy-list_item_height+1, arr[2]-17, yy-1, false);
        draw_set_color(c_white);                
    }
    if(index == arr[6]){
        draw_set_color(c_blue);
        draw_rectangle(arr[0]+1, yy-list_item_height+1, arr[2]-17, yy-1, false);
        draw_set_color(c_white);
    }
    var t = string_replace_all(data[index],"#","\#");
    if(string_length(t) > 30)
        t = string_copy(t, 1, 30) + "..";
    draw_text(arr[0]+4, yy - list_item_height/2, t);
    yy += list_item_height;
    index++;
}

draw_set_halign(fa_center);
