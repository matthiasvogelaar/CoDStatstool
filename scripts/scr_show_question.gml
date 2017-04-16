///scr_show_question(title, text, script_if_yes, script_if_no, yes_argument_count, yes_argument_array, no_argument_count, no_argument_array)
if(prompt_exists)
    return false;
prompt_exists = true;
prompt_title = argument0;
prompt_text = argument1;
prompt_type = 1;
prompt_yes_action = argument2;
prompt_no_action = argument3;
prompt_yes_ac = argument4;
prompt_yes_args = argument5;
prompt_no_ac = argument6;
prompt_no_args = argument7;
if(!safe_prompts){
    prompt_button_highlight = 0;
    scr_check_prompt_clicks();
}

prompt_height = min(room_height - 64,128 + string_height_ext(prompt_text, 24, prompt_width - 32));
