///scr_check_prompt_clicks

if( prompt_type == 0 && prompt_button_highlight == 0){
    prompt_exists = false;
}
if( prompt_type == 1 ){
    if(prompt_button_highlight == 0)
        scr_prompt_execute(prompt_yes_action, prompt_yes_ac, prompt_yes_args);
    if(prompt_button_highlight == 1)
        scr_prompt_execute(prompt_no_action, prompt_no_ac, prompt_no_args);
}
