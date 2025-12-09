interaction_code = function() { 
    if state_get("ate_breakfast",0) = false { 
        cutscene_create()
        cutscene_player_canmove(false)
        cutscene_func(fader_fade,[0,1,20])
        cutscene_sleep(20)
        cutscene_audio_play(snd_swallow)
        cutscene_dialogue([
        "* (You ate the food.)",
        "* (You're no longer hungry.)"
        ])
        cutscene_wait_dialogue_finish()
        cutscene_func(state_add,["ate_breakfast",0])
        cutscene_set_variable(inst_1EBAD154,"visible",false)
        cutscene_func(fader_fade, [1,0,20])
        cutscene_player_canmove(true)
        cutscene_play()
    }
    else {
        dialogue_start([
        "* (There was a note next to the food.)",
        "* \"Get well soon.\""
        ])
    }
}

if state_get("ate_breakfast",0) then visible = false