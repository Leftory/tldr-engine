trigger_code = function(){
    cutscene_create()
    cutscene_player_canmove(false)
    cutscene_func(music_fade,[0,0,30])
    cutscene_func(party_set_state,["gary", "light_serious"])
    cutscene_dialogue([
        "{char(gary,0)}* Hey... what's that?"
    ])
    cutscene_set_variable(o_camera, "target", noone)
    cutscene_camera_pan(60,280,30,true,"ease_in_out")
    cutscene_sleep(30)
    cutscene_dialogue([
        "{char(fred,0)}* ...?",
        "{char(gary,0)}* Is that a..."
    ])
    cutscene_actor_move(o_actor_hare, [
        new actor_movement(46,200,30,, DIR.UP),
        new actor_movement(225,200,60,, DIR.RIGHT)
    ],,false)
    cutscene_sleep(30)
    cutscene_dialogue([
        "{char(gary,0)}* Hey! It's hopping away!",
        "{char(gary,0)}* C'mon! We gotta catch it!",
        "{char(fred,0)}* What...?"
    ])
    cutscene_func(camera_unpan,[get_leader(),30,"ease_in_out"])
    cutscene_sleep(30)
    cutscene_player_canmove(true)
    cutscene_set_variable(o_actor_hare,"visible",false)
    cutscene_wait_until(function()
    {
        return o_actor_fred.y <= 280
    })
    cutscene_player_canmove(false)
    cutscene_dialogue([
        "{char(gary,0)}* It went into the amphitheatre classroom...!"
    ])
    cutscene_party_follow(false)
    cutscene_actor_move(o_actor_gary, [
        new actor_movement(o_actor_gary.x,240,30,,, DIR.UP),
        new actor_movement(160,240,30,,, DIR.RIGHT),
        new actor_movement(160,240,0,, DIR.LEFT)
    ],,false)
    cutscene_actor_move(o_actor_fred, [
        new actor_movement(o_actor_fred.x,220,30,,, DIR.UP)
    ],,false)
    cutscene_sleep(65)
    cutscene_set_variable(o_actor_fred,"s_override",true)
    cutscene_set_variable(o_actor_gary,"s_override",true)
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_right_light)
    cutscene_sleep(10)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_light_serious)
    cutscene_sleep(30)
    cutscene_dialogue([
        "{char(gary,0)}* You coming??",
        "{char(fred,0)}* I...{br}{resetx}* No...",
        "{char(gary,0)}* Dude, come on!{br}{resetx}* This is no time to be a party pooper!",
        "{char(fred,0)}* ..."
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_light)
    cutscene_dialogue("{char(fred,0)}* Fine.")
    cutscene_actor_move(o_actor_gary, [
        new actor_movement(260,220,30,,, DIR.RIGHT),
        new actor_movement(260,220,0,,, DIR.UP)
    ],,false)
    cutscene_actor_move(o_actor_fred, [
        new actor_movement(220,220,30,,, DIR.RIGHT),
        new actor_movement(220,220,0,,, DIR.UP)
    ],,false)
    cutscene_set_variable(o_camera, "target", noone)
    cutscene_camera_pan(240,200,30,true,"linear")
    cutscene_set_variable(o_actor_fred,"s_override",true)
    cutscene_set_variable(o_actor_gary,"s_override",true)
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_up_light)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up_light_serious)
    cutscene_sleep(30)
    cutscene_dialogue([
        "{char(gary,0)}* ..."
    ])
    cutscene_actor_move(o_actor_gary, [
        new actor_movement(240,200,30,,, DIR.UP)
    ],,true)
    cutscene_sleep(30)
    cutscene_audio_play(snd_locker)
    cutscene_set_variable(o_prop,"image_index",1)
    cutscene_sleep(60)
    cutscene_set_variable(o_actor_gary,"s_override",true)
    cutscene_set_variable(o_actor_fred,"s_override",true)
    cutscene_func(music_play,[mus_the_dark_door,0,true,1,1])
    cutscene_dialogue([
        "{char(gary,0)}* ...!"
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_light_serious)
    cutscene_dialogue([
        "{char(gary,0)}* D... Dude...",
        "{char(gary,0)}* Isn't it, like..."
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up_light_serious)
    cutscene_dialogue([
        "{char(gary,0)}* R-Really dark in there???",
        "{char(gary,0)}* It's almost like...",
        "{char(fred,0)}* ..."
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_light_serious)
    cutscene_dialogue([
        "{char(gary,0)}* Dude.",
        "{char(gary,0)}* This is like DELTARUNE, right?",
        "{char(gary,0)}* Wh-What if there's a... a...",
        "{char(fred,0)}* A Dark World?",
        "{char(gary,0)}* Yeah!",
        "{char(fred,0)}* ...",
        "{char(fred,0)}* Be serious."
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up_light_serious)
    cutscene_dialogue("{char(gary,0)}* Fine, I'll go in!")
    cutscene_set_variable(o_actor_gary,"fadeout",true)
    cutscene_actor_move(o_actor_gary, [
        new actor_movement(240,175,35,,, DIR.UP)
    ],,true)
    cutscene_sleep(60)
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_left_light)
    cutscene_sleep(20)
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_right_light)
    cutscene_sleep(30)
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_up_light)
    cutscene_dialogue("{char(fred,0)}* Oh, God damn it.")
    cutscene_actor_move(o_actor_fred, [
        new actor_movement(240,180,30,,, DIR.UP)
    ],,false)
    cutscene_func(fader_fade,[0,1,30])
    cutscene_sleep(30)
    cutscene_func(room_goto,[room_amphitheatre_dw])
    cutscene_play()
}