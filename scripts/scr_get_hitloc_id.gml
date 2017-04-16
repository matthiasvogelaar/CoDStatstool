///scr_get_hitloc_id(hitloc_name)
var hitloc = argument0;

if(ds_map_exists(hitloc_names, hitloc))
    return hitloc_names[? hitloc];
var hitloc_count = ds_map_size(hitloc_names);
hitloc_names_inverse[| hitloc_count ] = hitloc;
ds_map_add(hitloc_names, hitloc, hitloc_count);
return hitloc_count;
