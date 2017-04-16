///scr_show_prompt(title, text)
if(prompt_exists)
    return false;
prompt_exists = true;
prompt_title = argument0;
prompt_text = argument1;
prompt_type = 0;

prompt_height = min(room_height - 64,128 + string_height_ext(prompt_text, 24, prompt_width - 32));
