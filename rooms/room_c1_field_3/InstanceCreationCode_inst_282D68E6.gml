trigger_code = function(){
    if global.save.PLOT <= 11
    {
        global.save.PLOT = 12
        cutscene_create()
        cutscene_player_canmove(false)
        cutscene_party_follow(false)
        cutscene_set_variable(o_actor_sk,"s_override",true)
        cutscene_actor_move(o_actor_fred, new actor_movement(130,120,30,,,DIR.RIGHT),,false,true)
        cutscene_actor_move(o_actor_gary, new actor_movement(130,160,30,,,DIR.RIGHT),,false,true)
        cutscene_set_variable(o_camera,"target",noone)
        cutscene_func(music_fade,[0,0,30])
        cutscene_camera_pan(200,120,30,true,"linear")
        cutscene_func(music_play,[mus_sidekick,0,true])
        cutscene_dialogue([
            "{char(sk,0)}* Ah! There you are, you Cruel Villains!",
            "{char(gary,0)}* Again! We aren't villains!",
            "{char(sk,0)}* Tsk, how manipulative of you...",
            "{f_ex(0)}* How far do you think you can bend the truth?!",
            "{f_ex(0)}* I, Sidekick, will do everything in my power to stop you.",
            "{f_ex(0)}* Until you find yourselves in the depths of our {col(y)}Rogues Gallery{col(w)}!"
        ])
        cutscene_sleep(30)
        cutscene_dialogue([
            "{char(gary,0)}* Uh... {col(y)}Rogues Gallery{col(w)}?",
            "{char(sk,0)}* Yep!",
            "{char(gary,0)}* What exactly do you mean by that...?"
        ])
        cutscene_set_variable(o_actor_sk,"sprite_index",spr_sk_down_pose_serious)
        cutscene_sleep(20)
        cutscene_dialogue([
            "{char(sk,0)}* Wait, you don't know what the {col(y)}Rogues Gallery{col(w)} is?!",
            "{char(gary,0)}* Nope.",
            "{f_ex(0)}* Like, I know it's a hero's roster of villains...",
            "{f_ex(0)}* But like, why would we be in the depths of {col(y)}it{col(w)}?",
            "{char(sk,0)}* Oh my God dude. This is embarrassing.",
            "{f_ex(0)}* Fred, you know what I'm talking about, right?",
            "{char(fred,0)}* ... No.",
            "{char(sk,0)}* ...",
            "{f_ex(0)}* Hoooookay, let me explain!{br}{resetx}* The {col(y)}Rogues Gallery{col(w)} is...",
        ])
        cutscene_set_variable(o_actor_sk,"sprite_index",spr_sk_down_pose)
        cutscene_dialogue([
            "{char(sk,0)}* ... an actual place! In our headquarters!",
            "{f_ex(0)}* It's where we keep all the bad guys!",
            "{char(gary,0)}* Ohhhhhhh. Is it a gallery-themed prison?",
            "{char(sk,0)}* Yes, exactly, you get it!",
            "{char(gary,0)}* Dude, that actually sounds awesome.",
            "{char(sk,0)}* Well, it is. And you'll see it soon enough!",
            "{char(gary,0)}* I can't wait."
        ])
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up)
        cutscene_dialogue([
            "{char(gary,0)}* What do you think, Fred? Isn't it awesome?",
            "{char(none)}{choice(`Awesome`,`Not awesome`)}"
            ],"{e}")
        cutscene_func(function(){
            if global.temp_choice = 0
            {
                cutscene_create()
                cutscene_dialogue([
                    "{char(fred,0)}* I guess it's kinda cool.{mini(Yeah!,gary,0)}",
                    "{f_ex(0)}* But we're not going."
                ])
                cutscene_play()
            }
            else {
            	cutscene_create()
                cutscene_dialogue([
                    "{char(fred,0)}* We're not going to jail."
                ])
                cutscene_play()
            }
        })
        cutscene_sleep(2)
        cutscene_wait_until(function() { 
    		return !instance_exists(o_ui_dialogue) 
    	})
        cutscene_set_variable(o_actor_sk,"sprite_index",spr_sk_down_pose_serious)
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_right)
        cutscene_dialogue([
            "{char(sk,0)}* Why not?!",
            "{char(fred,0)}* We're not bad guys.",
            "{char(sk,0)}* You literally are!",
            "{char(gary,0)}* (At this point, let's just say we are so we get to see it!)"
        ])
        cutscene_set_variable(o_actor_sk,"sprite_index",spr_sk_down_pose)
        cutscene_dialogue([
            "{char(sk,0)}* Well, WHATEVER.",
            "{f_ex(0)}* I would catch you guys right now, but I'm kinda busy,",
            "{f_ex(0)}* Being a cool-butt superhero (sidekick) and saving people,",
            "{f_ex(0)}* So I'll deal with you later! There's a Tomorrow to Save!",
            "{f_ex(0)}* Err, that's actually not my catchphrase. Sorry.",
            "{f_ex(0)}* SIDEKICK, TO THE RESCUE!"
        ])
        cutscene_func(music_fade,[0,0,45])
        cutscene_actor_move(o_actor_sk,new actor_movement(380,140,45,,,DIR.RIGHT),,true)
        cutscene_func(instance_destroy,[o_actor_sk])
        cutscene_camera_pan(get_leader().x,get_leader().y,30,true,anime_curve.linear)
        cutscene_set_variable(o_camera,"target",get_leader())
        cutscene_set_variable(o_actor_fred,"s_override",false)
        cutscene_set_variable(o_actor_gary,"s_override",false)
        cutscene_player_canmove(true)
        cutscene_party_follow(true)
        cutscene_party_interpolate()
        cutscene_func(music_play,[mus_fora,0,true])
        cutscene_play()
    }
}

if global.save.PLOT > 11 instance_destroy(o_actor_sk)