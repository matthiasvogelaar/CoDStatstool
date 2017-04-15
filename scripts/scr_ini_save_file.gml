///scr_ini_save_file()
save_file_directory = scr_get_directory(output_file_name);
ini_open("config.ini");
ini_write_string("main", "save_loc", save_file_directory);
ini_close();
