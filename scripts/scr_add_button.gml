///scr_add_button(name,x1,y1,x2,y2,label, tab, isTabButton)
var name = argument0;
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;
var label = argument5;
var tab = argument6;
var isTabButton = argument7;

var button_list = ds_list_create();
button_list[| 0] = x1; button_list[| 1] = y1;
button_list[| 2] = x2; button_list[| 3] = y2;
button_list[| 4] = label;
button_list[| 5] = 0;
button_list[| 6] = tab;
if(!isTabButton)
    button_list[| 6] = -1 - tab;
ds_map_add_list(button_data, name, button_list);
button_count++;
