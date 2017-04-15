///scr_load_settings()
ini_open("config.ini");
load_file_directory = ini_read_string("main", "load_loc", program_directory);
save_file_directory = ini_read_string("main", "save_loc", program_directory);
ini_close();
