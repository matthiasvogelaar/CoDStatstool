///scr_create_player_record(playername)
if(ds_map_exists(player_data, argument0))
    return false;
//add its name to the list
var size = ds_map_size(player_names);
ds_map_add(player_names, argument0, size);
player_names_inverse[| size] = argument0;

var container = ds_map_create();
ds_map_add_map(container, "kills", ds_map_create());
ds_map_add_map(container, "deaths", ds_map_create());
ds_map_add(container, "suicides", 0);
ds_map_add(container, "headshots",0);
scr_create_hitloc_record(container,"hitloc_inflict");
scr_create_hitloc_record(container,"hitloc_receive");
scr_create_weapon_record(container,"weapons");
ds_map_add_map(player_data, argument0, container);
