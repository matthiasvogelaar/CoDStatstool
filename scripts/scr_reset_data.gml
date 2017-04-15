///scr_reset_data()
ds_map_destroy(codstatdata);
//ds_map_destroy(player_data);
ds_map_destroy(player_names);
//ds_list_destroy(player_names_inverse);
player_data = ds_map_create();
player_names = ds_map_create();
player_names_inverse = ds_list_create();

ds_map_destroy(weapon_names);
//ds_list_destroy(weapon_names_inverse);
weapon_names = ds_map_create();
weapon_names_inverse = ds_list_create();

codstatdata = ds_map_create();
ds_map_add_map(codstatdata,"player_data", player_data);
ds_map_add_list(codstatdata,"player_names", player_names_inverse);
ds_map_add_list(codstatdata,"weapon_names", weapon_names_inverse);

is_merging = 0;
scr_reset_lists();
