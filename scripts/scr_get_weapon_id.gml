///scr_get_weapon_id(weapon)
var weapon = argument0;

if(weapon == "none")
    weapon = "other";

if(ds_map_exists(weapon_names, weapon))
    return weapon_names[? weapon];
var weapon_count = ds_map_size(weapon_names);
weapon_names_inverse[| weapon_count ] = weapon;
ds_map_add(weapon_names, weapon, weapon_count);
return weapon_count;
