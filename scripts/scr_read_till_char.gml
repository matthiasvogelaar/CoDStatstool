///src_read_till_char(line, char)
var line = argument0;
var char = argument1;

var index = string_pos(char, line);
if(index < 1)
    return line;
if(index == 1)
    return "";
return string_copy(line, 1, index-1);
