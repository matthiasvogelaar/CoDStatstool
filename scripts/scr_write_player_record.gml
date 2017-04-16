///scr_write_player_record(playername)
var map, size, index;
var playername = argument0;
var data = player_data[? playername];
var player_count = ds_map_size(player_names);
var temp;
//writ the start, plus player name
FS_file_text_write_string(output_file_handle, "------------------------------------"); FS_file_text_writeln(output_file_handle);
FS_file_text_write_string(output_file_handle, playername+""); FS_file_text_writeln(output_file_handle);
//write the plain stats
FS_file_text_write_string(output_file_handle, "headshots;" + string(scr_ds_map_sum(data[? "headshots"]))+""); FS_file_text_writeln(output_file_handle);
FS_file_text_write_string(output_file_handle, "suicides;" + string(data[? "suicides"])+""); FS_file_text_writeln(output_file_handle);
prog_cur += 2;
//write the kills
map = data[? "kills"];
FS_file_text_write_string(output_file_handle, "kills;" + string(scr_ds_map_sum(map))); FS_file_text_writeln(output_file_handle);
scr_translate_and_print_map(output_file_handle, map, player_names_inverse, "    ", false, true);
//write the deaths
map = data[? "deaths"];
FS_file_text_write_string(output_file_handle, "deaths;" + string(scr_ds_map_sum(map))); FS_file_text_writeln(output_file_handle);
scr_translate_and_print_map(output_file_handle, map, player_names_inverse, "    ", false, true);
//write the weapon stats
map = data[? "weapons"];
FS_file_text_write_string(output_file_handle, "weapons;"); FS_file_text_writeln(output_file_handle);
scr_translate_and_print_map(output_file_handle, map, weapon_names_inverse, "    ", true, true);
//write the hits inflicted
map = data[? "hitloc_inflict"];
FS_file_text_write_string(output_file_handle, "hitloc_inflict;" + string(scr_ds_map_sum(map))); FS_file_text_writeln(output_file_handle);
scr_translate_and_print_map(output_file_handle, map, hitloc_names_inverse, "    ", true, true);
//write the hits received
map = data[? "hitloc_receive"];
FS_file_text_write_string(output_file_handle, "hitloc_receive;" + string(scr_ds_map_sum(map))); FS_file_text_writeln(output_file_handle);
scr_translate_and_print_map(output_file_handle, map, hitloc_names_inverse, "    ", false, true);
