///scr_prompt_execute(script, arg_count, args)
if(script_exists(argument0)){
    switch(argument1){
        case 0:
            script_execute(argument0);
        break;
        case 1:
            script_execute(argument0, argument2[0]);
        break;
        case 2:
            script_execute(argument0, argument2[0], argument2[1]);
        break;
        case 3:
            script_execute(argument0, argument2[0], argument2[1], argument2[2]);
        break;
        case 4:
            script_execute(argument0, argument2[0], argument2[1], argument2[2], argument2[3]);
        break;
        case 5:
            script_execute(argument0, argument2[0], argument2[1], argument2[2], argument2[3], argument2[4]);
        break;
    }
}
prompt_yes_action = -10;
prompt_yes_ac = -1;
prompt_yes_args = -10;
prompt_no_action = -10;
prompt_no_ac = -1;
prompt_no_args = - 10;
prompt_exists = -1;
