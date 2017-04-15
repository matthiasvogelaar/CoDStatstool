///scr_get_directory(filename)
var filename = argument0;
var ret = "";
var pos = string_pos("\", filename);
while(pos > 0){
    ret = ret + string_copy(filename, 1, pos);
    filename = string_copy(filename, pos+1, string_length(filename));
    pos = string_pos("\", filename);
}
return ret;
