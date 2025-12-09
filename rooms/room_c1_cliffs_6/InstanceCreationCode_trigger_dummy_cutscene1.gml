trigger_code = function(){
    if global.save.PLOT <= 7
    {
        cutscene_create()
        cutscene_player_canmove(false)
        cutscene_party_follow(false)
        cutscene_actor_move(o_actor_gary, new actor_movement(160,130,30,,,DIR.RIGHT),,false,true)
        cutscene_dialogue([
            "{char(gary,0)}* Hey, look! It's a training dummy!",
            "{char(gary,0)}* This is the perfect time to test our abilities!",
            "{char(gary,0)}* Let's FIGHT it!"
        ])
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left)
        cutscene_dialogue([
            "{char(gary,0)}* What do ya say?!",
            "{char(none)}{choice(`Let's fight`, `Let's not`)}"
        ],"{e}")
        cutscene_func(function() {
    		if global.temp_choice == 0 {
                cutscene_create()
                cutscene_dialogue([
                    "{char(gary,0)}* Alright! Let's do this!"
            ])
                cutscene_func(enc_start,[new enc_set_dummy()])
                cutscene_play()
            }
            else {
               	cutscene_create()
                cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_serious)
                cutscene_dialogue([
                    "{char(fred,0)}* Now's not the time.",
                    "{char(gary,0)}* Aww!!! Come on!!!",
                    "{char(none)}{choice(`Fine`, `Let's not`)}"
        ],"{e}")
        cutscene_func(function() {
    		if global.temp_choice == 0 {
                cutscene_create()
                cutscene_dialogue([
                    "{char(gary,0)}* Yay! Let's do this!"
            ])
                cutscene_func(enc_start,[new enc_set_dummy()])
                cutscene_dialogue([
                    "{char(gary,0)}* Man, our first battle!{br}{resetx}* That was awesome!"
                ])
                cutscene_play()
            }
            else {
               	cutscene_create()
                cutscene_dialogue([
                    "{char(fred,0)}* Really. No.",
                    "{char(gary,0)}* ... Fine.{mini(Party pooper.,gary,0)}"
            ])
                cutscene_play()
            }
}) 
                cutscene_play()
            }
})
    cutscene_sleep(2)
    cutscene_wait_until(function() {
        return !instance_exists(o_ui_dialogue)
    })
    cutscene_sleep(2)
    cutscene_wait_until(function() {
        return !instance_exists(o_ui_dialogue)
    })
        cutscene_set_variable(o_actor_fred,"s_override",false)
        cutscene_set_variable(o_actor_gary,"s_override",false)
        cutscene_party_follow(true)
        cutscene_party_interpolate()
        cutscene_player_canmove(true)
        cutscene_func(function(){
            if instance_exists(o_actor_e_dummy) instance_destroy(o_actor_e_dummy)
            inst = instance_create(o_ow_interactable,200,140)
            inst.sprite_index = spr_mannequin_left
            inst.interaction_code = function(){
        if interacted = 0
        {
            dialogue_start([
            "{char(gary,0)}* ... Party pooper."
        ])
        }
        else {
        	dialogue_start([
            "{char(gary,0)}* You heard me!"
        ])
        }
    }
            global.save.PLOT = 8
        })
        cutscene_play()
    }
}

if global.save.PLOT > 7{
    instance_destroy(o_actor_e_dummy)
    inst = instance_create(o_ow_interactable,200,140)
    inst.sprite_index = spr_mannequin_left
    inst.interaction_code = function(){
        if interacted = 0
        {
            dialogue_start([
            "{char(gary,0)}* ... Party pooper."
        ])
        }
        else {
        	dialogue_start([
            "{char(gary,0)}* You heard me!"
        ])
        }
    }
}