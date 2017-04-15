///scr_translate_and_print_map(output, map, translate_list, prefix, sub_maps, incr_prog_cur)
var output = argument0;
var map = argument1;
var translate_list = argument2;
var prefix = argument3;
var sub_maps = argument4;
var incr = argument5;

//map id's vertalen
var size = ds_map_size(map);
var keys, values;
keys[0] = 0; values[0] = 0;
scr_ds_map_separate(map, keys, values);
for(var i = 0; i < size; i++)
    keys[i] = translate_list[| real(keys[i])]; 
//arrays sorteren
scr_merge_sort_sub(keys, values, 0, size, true);
//en printen maar
for(var i = 0; i < size; i++)
{
    var print_val = string(values[i]);
    if(sub_maps)
        print_val = string(scr_ds_map_sum(values[i]));
    FS_file_text_write_string(output, prefix + keys[i] + ";" + print_val);
    FS_file_text_writeln(output);
    if(incr)
        prog_cur++;
}

