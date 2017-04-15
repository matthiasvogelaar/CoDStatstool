///scr_process_line(line)
var line = argument0;
var temp = "";
//Checken of dit een geldige string is, dus met /( |d){3}:d{2} /begint
if(string_length(line) < 8)
    return false;
temp = string_copy(line,1,7);
for(var i = 0; i < 7; i++)
{
    var c = string_char_at(temp,i+1);
    if( c != " " && c != ":" && string_digits(c) != c){
        return false;
    }
}
//Eerste 8 karakters van de string afslopen
temp = string_char_at(line,8);
if(temp != "D" && temp !="K")
    return false;
line = string_copy(line, 8, string_length(line)-8);
//strip the end spaces and newlines
temp = string_length(line);
while(ord(string_char_at(line, temp)) < 33){
    temp--;
}
line = string_copy(line, 1, temp);
var type, victim_id, victim_name, attacker_id, attacker_name, weapon, method, hit_loc;
//Structuur van zo'n regel:
//[D of K];[? cijfer (0)];[victim id];[victim team];[victim name];[? 0];[attacker id];[attacker team];[attacker name];[weapon];[damage];[type of attack];[hit location]
var backup = line;
type = string_copy(line,1,1);
line = scr_cut_line_char(line,";",2);
victim_id = scr_read_till_char(line, ";"); line = scr_cut_line_char(line, ";",2);
victim_name = scr_read_till_char(line, ";"); line = scr_cut_line_char(line, ";",2);
attacker_id = scr_read_till_char(line, ";"); line = scr_cut_line_char(line, ";",2);
attacker_name = scr_read_till_char(line, ";"); line = scr_cut_line_char(line, ";",1);
weapon = scr_read_till_char(line, ";"); line = scr_cut_line_char(line, ";",2);
method = scr_read_till_char(line, ";"); line = scr_cut_line_char(line, ";",1);
hit_loc = scr_read_till_char(line, ";"); line = scr_cut_line_char(line, ";",1);
/*if(attacker_name == "")
    show_message(backup+
    "t:"+type+"#"+
    "vi:"+victim_id+"#"+
    "vn:"+victim_name+"#"+
    "ai:"+attacker_id+"#"+
    "an:"+attacker_name+"#"+
    "w:"+weapon+"#"+
    "m:"+method+"#"+
    "hl:"+hit_loc+"#"
    );*/
//if(line != "")
//    show_message("Error? [" + line + "]");
//show_message("T/"+type+"/VI/"+victim_id+"/VN/"+victim_name+"/AI/"+attacker_id+"/AN/"+attacker_name+"/W/"+ weapon+"/M/"+method+"/HL/"+hit_loc);
victim_id = real(victim_id);
if(attacker_id != "")
    attacker_id = real(attacker_id);
else
    attacker_id = -1;
//Checken of we geen benodigde data missen om een of andere rede
if(victim_id < 0 || victim_name == "")
    return false;
//Kijken of een van de spelers die hier genoemt worden nog niet in onze player list voorkomen
if(victim_id >= 0 && !ds_map_exists(player_data, victim_name)){
    scr_create_player_record(victim_name);
}
if(attacker_id >= 0 && !ds_map_exists(player_data, attacker_name)){
    scr_create_player_record(attacker_name);
}

if((type == "D" || type== "K") && attacker_id != -1 && attacker_id != victim_id)
    scr_process_hit(victim_id, victim_name, attacker_id, attacker_name, weapon, method, hit_loc);
if(type == "K")
    scr_process_kill(victim_id, victim_name, attacker_id, attacker_name, weapon, method, hit_loc);
