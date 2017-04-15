///scr_draw_button(x1, y1, x2, y2, text, highlight, tab_index)
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var text = argument4;

draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(x1,y1,x2,y2,true);
if(argument5 == 0 && current_tab == argument6){
    draw_set_color(c_blue);
    draw_rectangle(x1+1,y1+1, x2-1, y2-1, false);
    draw_set_color(c_white);
}
if(argument5 > 0){
    if(argument5 == 1)
        draw_set_color(c_red);
    if(argument5 == 2)
        draw_set_color(c_blue);
    if(argument5 == 3)
        draw_set_color(c_green);
    draw_rectangle(x1+1,y1+1, x2-1, y2-1, false);
    draw_set_color(c_white);
}
draw_text(x1+((x2-x1)/2), y1+((y2-y1)/2), text);
