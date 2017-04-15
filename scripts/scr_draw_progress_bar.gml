///scr_draw_progress_bar(x1,y1,x2,y2,current,max, text, draw_perc)
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var current = argument4;
var limit = argument5;
var text = argument6;
var draw_perc = argument7;

var range = x2-x1-2;
var val = floor(min((current / limit)*range,range));

draw_set_color(c_gray);
draw_rectangle(x1, y1, x2, y2, 1);
if(val > 0){
    draw_set_color(c_red);
    draw_rectangle(x1+1,y1+1,x1+1+val,y2-1, 0);
}

draw_set_color(c_white);
var xx = (x2 - x1)/2;
var yy = (y2 - y1)/2;
if(draw_perc){
    var p = 0;
    if(limit != 0)
        p = min(100, floor((current / limit)*100));
    text = text + " - " + string(p) + "%";
}
draw_text(x1 + xx, y1 + yy, text);

