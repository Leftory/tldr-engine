trigger_code = function(){
    if global.save.PLOT <= 9
    {
        cutscene_create()
        cutscene_player_canmove(false)
        cutscene_party_follow(false)
        cutscene_func(party_set_state,["gary","serious"])
        cutscene_actor_move(o_actor_gary,new actor_movement(300,190,40,,,DIR.RIGHT),,true,true)
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up_serious)
        cutscene_dialogue([
            "{char(gary,0)}* ...",
            "{char(gary,0)}* Wow..."
        ])
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_serious)
        cutscene_dialogue([
            "{char(gary,0)}* So this is what the Dark World looks like.",
            "{char(gary,0)}* ..."
        ])
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left)
        cutscene_func(party_set_state,["gary",""])
        cutscene_dialogue([
            "{char(gary,0)}* I like it.{br}{resetx}* I really like it!"
        ])
        cutscene_set_variable(o_actor_gary,"s_override",false)
        cutscene_player_canmove(true)
        cutscene_party_follow(true)
        cutscene_party_interpolate()
        cutscene_func(function(){global.save.PLOT = 10})
        cutscene_play()
    }
}