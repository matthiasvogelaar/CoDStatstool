///scr_draw_switch(switch_list)
var s_list = argument0;

var x1 = s_list[| 0];
var y1 = s_list[| 1];
var x2 = s_list[| 2];
var y2 = s_list[| 3];
var enabled = s_list[| 4];

draw_set_color(c_white);
draw_rectangle(x1, y1, x2, y2 ,0);
var center = floor((x2 - x1) / 2);
if(!enabled){
    draw_set_color(c_red);
    draw_rectangle(x1+center, y1+2, x2-2, y2-2, 0);
}
else {
    draw_set_color(c_green);
    draw_rectangle(x1+2, y1+2, x1+center, y2-2, 0);
}

draw_set_color(c_black);
draw_rectangle(x1+1, y1+1, x2-1, y2-1, 1);

