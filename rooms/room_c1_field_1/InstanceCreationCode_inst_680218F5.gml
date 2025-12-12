trigger_code = function(){
    cutscene_create()
    cutscene_player_canmove(false)
    cutscene_set_variable(get_leader(),"dir",DIR.RIGHT)
    cutscene_actor_move(o_actor_e_fig, new actor_movement(500,100,0),,true,true)
    cutscene_set_variable(o_actor_e_fig,"sprite_index",spr_fig_hurt)
    cutscene_audio_play(snd_jump)
    cutscene_animate(100,50,20,anime_curve.bounce_in,o_actor_e_fig,"y")
    cutscene_sleep(20)
    cutscene_set_variable(o_actor_e_fig,"custom_depth",-2200)
    cutscene_animate(50,180,30,anime_curve.cubic_in,o_actor_e_fig,"y")
    cutscene_sleep(30)
    cutscene_audio_play(snd_wing)
    cutscene_set_variable(o_actor_e_fig,"sprite_index",spr_fig_landed)
    cutscene_sleep(15)
    cutscene_set_variable(o_actor_e_fig,"custom_depth",undefined)
    cutscene_set_variable(o_actor_e_fig,"s_override",false)
    cutscene_set_variable(o_actor_e_fig,"sprite_index",spr_fig)
    cutscene_set_variable(o_actor_e_fig,"image_speed",1)
    cutscene_func(function(){
        if global.save.PLOT <= 10
        {
            enc_start(new enc_set_1fig())
            global.save.PLOT = 11
        }
        else {
        	enc_start(new enc_set_1fig_repeat())
        }
    })
    cutscene_player_canmove(true)
    cutscene_set_variable(inst_47322B28,"fought_fig",1)
    cutscene_set_variable(inst_47322B28,"interacted",0)
    cutscene_play() 
}