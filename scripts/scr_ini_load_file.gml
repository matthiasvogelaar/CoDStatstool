///scr_ini_save_file()
load_file_directory = scr_get_directory(input_file_name);
ini_open("config.ini");
ini_write_string("main", "load_loc", load_file_directory);
ini_close();
