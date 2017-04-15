///scr_load_settings()
ini_open("config.ini");
ini_write_string("main", "load_loc", load_file_directory);
ini_write_string("main", "save_loc", save_file_directory);
ini_close();
