///scr_fill_list_player_names(list, data)
var list = argument0;
var data =argument1;

list[@ 5] = 0;
for(var i = 0; i < ds_list_size(player_names_inverse); i++)
{
    data[@ i] = player_names_inverse[| i];
    list[@ 5]++;
}
