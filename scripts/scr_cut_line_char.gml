///scr_cut_line_char(line, char, count)
var line = argument0;
var char = argument1;
var count = argument2;

for(var i = 0; i < count; i++){
    var index = string_pos(char, line);
    if(index < 1)
        return "";
    else if(index == string_length(line))
        return "";
    else
        line = string_copy(line, index+1, string_length(line));
}
return line;
