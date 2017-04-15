///scr_create_hitloc_record(container, name)
var hitlocrec = ds_map_create();
ds_map_add(hitlocrec,"head",0);
ds_map_add(hitlocrec,"left_arm_lower",0);
ds_map_add(hitlocrec,"left_arm_upper",0);
ds_map_add(hitlocrec,"left_foot",0);
ds_map_add(hitlocrec,"left_hand",0);
ds_map_add(hitlocrec,"left_leg_lower",0);
ds_map_add(hitlocrec,"left_leg_upper",0);
ds_map_add(hitlocrec,"neck",0);
ds_map_add(hitlocrec,"none",0);
ds_map_add(hitlocrec,"right_arm_lower",0);
ds_map_add(hitlocrec,"right_arm_upper",0);
ds_map_add(hitlocrec,"right_foot",0);
ds_map_add(hitlocrec,"right_hand",0);
ds_map_add(hitlocrec,"right_leg_lower",0);
ds_map_add(hitlocrec,"right_leg_upper",0);
ds_map_add(hitlocrec,"torso_lower",0);
ds_map_add(hitlocrec,"torso_upper",0);

ds_map_add_map(argument0, argument1, hitlocrec);

