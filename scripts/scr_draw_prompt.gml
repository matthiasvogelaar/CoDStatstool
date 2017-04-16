///scr_draw_prompt()

if(!prompt_exists)
    return false
    
draw_set_color(c_black);
var center_x = room_width/2;
var center_y = room_height/2;

var x1 = floor(center_x - prompt_width/2);
var y1 = floor(center_y - prompt_height/2);
var x2 = floor(center_x + prompt_width/2);
var y2 = floor(center_y + prompt_height/2);
draw_rectangle(x1,y1,x2,y2,0);
draw_set_color(c_white)
draw_rectangle(x1,y1,x2,y2,1);
draw_rectangle(x1,y1,x2,y1+32,0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext(x1 + 16, y1 + 64, prompt_text, 24, prompt_width - 32);
draw_set_valign(fa_center);
draw_set_color(c_black);
draw_text(x1+8, y1+16, prompt_title);
draw_rectangle(x1+1,y2-64,x2-1,y2-1,0);
draw_set_halign(fa_center);
if(prompt_type == 0)
    scr_draw_button(center_x - 32, y2 - 48, center_x + 32, y2 - 16, "ok", prompt_button_highlight == 0, -1);
else{
    scr_draw_button(x1 + 64, y2 - 48, x1 + 128, y2 - 16, "yes", prompt_button_highlight == 0, -1);
    scr_draw_button(x2 - 128, y2 - 48, x2 - 64, y2 - 16, "no", prompt_button_highlight == 1, -1);
}
    

