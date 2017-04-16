///scr_process_hit(victim_id, victim_name, attacker_id, attacker_name, weapon, method, hit_loc)
var victim_id = argument0;
var victim_name = argument1;
var attacker_id = argument2;
var attacker_name = argument3;
var weapon = argument4;
var method = argument5;
var hit_loc = argument6;

var hitloc_id_string = string( scr_get_hitloc_id(hit_loc));
victim_id = string(scr_get_player_id(victim_name));
attacker_id = string(scr_get_player_id(attacker_name));

//De hit locatie opslaan bij de victim, dus waar hij geraakt is
var victim_data = player_data[? victim_name];
var victim_hitloc = victim_data[? "hitloc_receive"];
if(!ds_map_exists(victim_hitloc, hitloc_id_string))
    ds_map_add_map(victim_hitloc, hitloc_id_string, ds_map_create());
victim_hitloc = victim_hitloc[? hitloc_id_string];
if(!ds_map_exists(victim_hitloc, attacker_id))
    ds_map_add(victim_hitloc, attacker_id, 0);
victim_hitloc[? attacker_id]++;
//De hit locatie opslaan bij de aanvaller, dus waar hij iemand geraakt heeft
var attacker_data = player_data[? attacker_name];
var attacker_hitloc = attacker_data[? "hitloc_inflict"];
if(!ds_map_exists(attacker_hitloc, hitloc_id_string))
    ds_map_add_map(attacker_hitloc, hitloc_id_string, ds_map_create());
attacker_hitloc = attacker_hitloc[? hitloc_id_string];
if(!ds_map_exists(attacker_hitloc, victim_id))
    ds_map_add(attacker_hitloc, victim_id, 0);
attacker_hitloc[? victim_id]++;
