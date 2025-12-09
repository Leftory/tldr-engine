interaction_code = function(){
    if global.save.PLOT <= 5
    {
    if item_get_equipped(item_w_lightsword)
    {
        cutscene_create()
        cutscene_dialogue("* (You cleaved the dummy with the blade.)")
        cutscene_audio_play(snd_attack)
        cutscene_func(screen_shake,[10,5])
        cutscene_func(function(){global.save.PLOT = 6})
        cutscene_func(instance_destroy,[inst_gate])
        cutscene_play()
    }
    else if state_get("got_lightsword",0) and !item_get_equipped(item_w_lightsword) {
    	if !state_get("knows_dummy_has_to_die",0)
        {
        dialogue_start([
            "* (You feel like this dummy is here for a reason.)",
            "* (You've got something to hit it with.){br}{resetx}* (Why not equip it?)"
        ])
        state_add("knows_dummy_has_to_die",0)
        }
        else {
        	dialogue_start([
            "* (You've got something to hit it with.){br}{resetx}* (Why not equip it?)"
        ])
        }
        
    }
    else {
    	if !state_get("knows_dummy_has_to_die",0)
        {
        dialogue_start([
            "* (You feel like this dummy is here for a reason.)",
            "* (Maybe if you had something to hit it with...)"
        ])
        state_add("knows_dummy_has_to_die",0)
        }
        else {
        	dialogue_start([
            "* (You need something to hit this dummy with.)"
        ])
        }
    }
    }
    else if global.save.PLOT = 6{
        dialogue_start([
            "* (You considered further abusing the dummy...)",
            "* (But it's time to move forward.)"
            ])
    }
}

if global.save.PLOT >= 6 instance_destroy(inst_gate)