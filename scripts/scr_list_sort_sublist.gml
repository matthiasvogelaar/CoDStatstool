///scr_list_sort_sublist(list_data, from_index)
var list_data = argument0;
var from_index = argument1;

var keys, sort_keys, values, size, index;
keys[0] = "";
sort_keys[0] = "";
values[0] = 0;
size = array_length_1d(list_data);
index = 0;

while(from_index + index < size && string_pos("--- ",list_data[from_index+index]) < 1){
    var line = list_data[from_index+index];
    var pos = string_length(line);
    while(pos > 0 && string_char_at(line, pos) != ":")
        pos--;
    keys[index] = string_copy(line, 1, pos-1);
    sort_keys[index] = string_lower(keys[index]);
    values[index] = real( string_copy(line, pos + 2, string_length(line)));
    index++;
}
size = array_length_1d(keys);
if(scr_is_sorted(values, false)){
    scr_merge_sort_by_keys(sort_keys, values, 0, size, true);
    scr_merge_sort_by_keys(sort_keys, keys, 0, size, true);
}
else{
    scr_merge_sort_sub(values, keys, 0, size, false);
}

for(var i = 0; i < size; i++)
    list_data[@ from_index+i] = keys[i] + ": " + string(values[i]);

