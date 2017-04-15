///scr_process_hit(victim_id, victim_name, attacker_id, attacker_name, weapon, method, hit_loc)
var victim_id = argument0;
var victim_name = argument1;
var attacker_id = argument2;
var attacker_name = argument3;
var weapon = argument4;
var method = argument5;
var hit_loc = argument6;

//De hit locatie opslaan bij de victim, dus waar hij geraakt is
var victim_data = player_data[? victim_name];
var victim_hitloc = victim_data[? "hitloc_receive"];
if(!ds_map_exists(victim_hitloc, hit_loc)){
    show_message("New hitloc found! - [" + hit_loc+"]");
    return false;
}
victim_hitloc[? hit_loc]++;
//De hit locatie opslaan bij de aanvaller, dus waar hij iemand geraakt heeft
var attacker_data = player_data[? attacker_name];
var attacker_hitloc = attacker_data[? "hitloc_inflict"];
if(!ds_map_exists(attacker_hitloc, hit_loc)){
    show_message("New hitloc found! - " + hit_loc);
    return false;
}
attacker_hitloc[? hit_loc]++;
