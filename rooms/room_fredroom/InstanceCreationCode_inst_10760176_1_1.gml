interaction_code = function() { 
    cutscene_create()
    cutscene_player_canmove(false)
    if !state_get("pointless_lamp",0)
    {
        cutscene_dialogue([
            "* (It's your nightstand.)",
            "* (The lamp is off.){br}{resetx}* (Turn it on?)",
            "{choice(`Yes`, `No`)}"
            ], "{e}")
        cutscene_func(function() {
    		if global.temp_choice == 0 {
                cutscene_create()
                cutscene_audio_play(snd_noise)
                cutscene_dialogue("* (You turned on the lamp...)")
                cutscene_wait_dialogue_finish()
                cutscene_sleep(60)
                cutscene_dialogue("* (Pointless.)")
                cutscene_func(state_add,["pointless_lamp",0])
                cutscene_wait_dialogue_finish()
                cutscene_audio_play(snd_noise)
                cutscene_dialogue("* (You turned the lamp back off.)")
                cutscene_wait_dialogue_finish()
                cutscene_player_canmove(true)
                cutscene_play()
            }
            else {
               	cutscene_create()
                cutscene_dialogue("* (Thank God.)")
                cutscene_wait_dialogue_finish()
                cutscene_player_canmove(true)
                cutscene_play()
            }
})
    }
    else {
    	cutscene_dialogue([
            "* (It's your nightstand.)",
            "* (The lamp is off.){br}{resetx}* (It's pointless to turn it on.)"
            ])
        cutscene_player_canmove(true)
    }
    cutscene_play()
    }