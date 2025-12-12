if menu
{
    ui_dialoguebox_create(30, 30, 620 - 30 - 1, 440 - 30 - 1, WORLD_TYPE.DARK)
    draw_set_font(loc_font("main"))
    draw_set_halign(fa_center)
    if reveal_answer = 0 input_binding_draw(INPUT_VERB.CANCEL, 320, 390, 2, loc("recruits_return_msg")[0], loc("recruits_return_msg")[1])
    
    if array_length(array_panels) == 4
    {
        draw_sprite_ext(panels,array_panels[0],60,60,1,1,0,c_white,1-chosen0*.25)
        draw_sprite_ext(panels,array_panels[1],60+125+10,60,1,1,0,c_white,1-thechosen1*.25)
        draw_sprite_ext(panels,array_panels[2],60+125+125+20,60,1,1,0,c_white,1-chosen2*.25)
        draw_sprite_ext(panels,array_panels[3],60+125+125+125+30,60,1,1,0,c_white,1-chosen3*.25)
        if reveal_answer == 0{
            draw_sprite_ext(spr_soul,0,60+62+(selection*125+selection*10),280,1,1,0,c_red,1)
            draw_sprite(spr_panel_outline,0,60+(selection*125+selection*10),60)
        }
        if array_length(panel_selection) > 0 draw_sprite_ext(panels,panel_selection[0],205,300,0.4,0.4,0,c_white,1)
        if array_length(panel_selection) > 1 draw_sprite_ext(panels,panel_selection[1],265,300,0.4,0.4,0,c_white,1)
        if array_length(panel_selection) > 2 draw_sprite_ext(panels,panel_selection[2],325,300,0.4,0.4,0,c_white,1)
        if array_length(panel_selection) > 3 draw_sprite_ext(panels,panel_selection[3],385,300,0.4,0.4,0,c_white,1)
    }
    if array_length(array_panels) == 1
    {
        draw_sprite(panels,array_panels[0],258,60)
        draw_sprite_ext(spr_soul,0,258,280,1,1,0,c_red,1)
    }
    
    if array_length(array_panels) > 1 and InputPressed(INPUT_VERB.RIGHT)
    {
        selection ++
        audio_play(snd_ui_move)
    }
    if array_length(array_panels) > 1 and InputPressed(INPUT_VERB.LEFT)
    {
        selection --
        audio_play(snd_ui_move)
    }
    
    if selection < 0 selection = array_length(array_panels) - 1
    if selection = array_length(array_panels) selection = 0
    
    if InputPressed(INPUT_VERB.SELECT) and array_length(panel_selection) < array_length(array_panels)
    {
        if !array_contains(panel_selection,array_panels[selection])
        {
            array_push(panel_selection,array_panels[selection])
            audio_play(snd_ui_select)
        }
        else {
        	audio_play(snd_ui_cant_select)
        }
    }
    
    if array_length(panel_selection) == array_length(array_panels) and reveal_answer = 0
    {
        reveal_answer = 1
    }
    
    if reveal_answer > 0
    {
        timer_reveal_answer ++
    }
    
    if reveal_answer == 1 and timer_reveal_answer >= 20
    {
        reveal_answer = 2
        timer_reveal_answer = 0
        audio_play(snd_drumroll)
    }
    
    if reveal_answer == 2 and timer_reveal_answer > 50
    {
        timer_reveal_answer = 0
        if (amount == 1) or (amount == 2 && array_equals(panel_selection,right_answer)) or (amount == 3 && array_equals(panel_selection,right_answer)) or (amount == 4 && array_equals(panel_selection,right_answer))
        {
            audio_play(snd_won)
            reveal_answer = 3
            won = true
        }
        else {
        	audio_play(snd_error)
            reveal_answer = 4
        }
    }
    
    if reveal_answer == 3
    {
        draw_text_transformed_color(320,390,"YOU GOT IT!",2,2,0,c_lime,c_lime,c_lime,c_lime,1)
    }
    
    if reveal_answer == 4
    {
        draw_text_transformed_color(320,390,"WRONG!",2,2,0,c_red,c_red,c_red,c_red,1)
    }

    if reveal_answer = 4 and timer_reveal_answer >= 30
    {
        reveal_answer = 0
        timer_reveal_answer = 0
        panel_selection = []
    }
    
    if reveal_answer = 3 and timer_reveal_answer >= 60
    {
        menu = false
    }
    
    if array_length(panel_selection) == 0 and reveal_answer != 1 and reveal_answer != 2 and reveal_answer != 4 and InputPressed(INPUT_VERB.CANCEL) {
        menu = false
        audio_play(snd_ui_cancel)
    }
    if (array_length(panel_selection) > 0 and reveal_answer != 1 and reveal_answer != 2 and InputPressed(INPUT_VERB.CANCEL)) or (reveal_answer == 4 and InputPressed(INPUT_VERB.CANCEL)) {
        panel_selection = []
        audio_play(snd_ui_cancel)
        reveal_answer = 0
        timer_reveal_answer = 0
    }
    
}