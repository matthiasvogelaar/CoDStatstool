///scr_process_kill(victim_id, victim_name, attacker_id, attacker_name, weapon, method, hit_loc)
var victim_id = argument0;
var victim_name = argument1;
var attacker_id = argument2;
var attacker_name = argument3;
var weapon = argument4;
var method = argument5;
var hit_loc = argument6;

var victim_data = player_data[? victim_name];
//Checken of het zelfmoord is
if(victim_id == attacker_id || attacker_id < 0)
{
    victim_data[? "suicides"]++;
    return true;
}
//Death toevoegen aan de death lijst
var victim_deaths = victim_data[? "deaths"];
var attacker_number = player_names[? attacker_name];
var attacker_number_string = string(attacker_number);
if(!ds_map_exists(victim_deaths, attacker_number_string))
    ds_map_add(victim_deaths, attacker_number_string, 0);
victim_deaths[? attacker_number_string]++;
    
//En, kill toevoegen aan de kill lijst en de wapen lijst voor de aanvaller
var attacker_data = player_data[? attacker_name];
var attacker_kills = attacker_data[? "kills"];
var victim_number = player_names[? victim_name];
var victim_number_string = string(victim_number);
if(!ds_map_exists(attacker_kills, victim_number_string))
    ds_map_add(attacker_kills, victim_number_string, 0);
attacker_kills[? victim_number_string]++;
//wapen stats afhandelen    
var attacker_weapons = attacker_data[? "weapons"];
weapon = string_lower(weapon);
//weapon string aanpassen
if(string_pos("frag_grenade", weapon) == 1)
    weapon = "frag_grenade";
if(string_pos("smoke_grenade", weapon) == 1)
    weapon = "smoke_grenade";
if(string_pos("mg42_bipod_", weapon) == 1 || string_pos("30cal_prone", weapon) == 1 || string_pos("30cal_stand", weapon) == 1)
    weapon = "mounted mg";
//headshot toekennen
if(method = "MOD_HEAD_SHOT")
    attacker_data[? "headshots"]++;
//wapens stat verhogen
if(method = "MOD_MELEE")
    weapon = "melee";
if(weapon == "none")
    weapon = "other";
var weapon_id = string(scr_get_weapon_id(weapon));
if(!ds_map_exists(attacker_weapons, weapon_id))
    ds_map_add_map(attacker_weapons, weapon_id, ds_map_create());
list = attacker_weapons[? weapon_id];
if(!ds_map_exists(list, string(victim_number)))
    ds_map_add(list, string(victim_number), 0);
list[? string(victim_number)]++;
