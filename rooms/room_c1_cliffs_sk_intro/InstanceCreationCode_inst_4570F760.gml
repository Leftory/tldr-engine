trigger_code = function(){
    if global.save.PLOT <= 8
    {
        cutscene_create()
        cutscene_player_canmove(false)
        cutscene_party_follow(false)
        cutscene_dialogue([
            "{voice(snd_text_sk)}* Woah! Hold it right there, cowboys!",
            "{char(gary,0)}* C... Cowboys?",
            "{char(none)}{voice(snd_text_sk)}* Yes, cowboys!",
            "{char(fred,0)}* Who's there?",
            "{char(none)}{voice(snd_text_sk)}* Oh, no one really.{br}{resetx}* Just merely YOUR GREATEST ADVERSARY...!",
            "{char(gary,0)}* Huh? Wait...",
        ])
        cutscene_actor_move(o_actor_gary,[
            new actor_movement(160,180,30,,,DIR.UP),
            new actor_movement(180,180,10,,,DIR.RIGHT)
        ],,true,true)
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up)
        cutscene_sleep(10)
        cutscene_dialogue([
            "{char(gary,0)}* Huh."
        ])
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_down)
        cutscene_dialogue([
            "{char(gary,0)}* Fred, it's just a kid.",
            "{char(fred,0)}* Oh.",
            "{char(none)}{voice(snd_text_sk)}* A WHAT?!"
        ])
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up)
        cutscene_set_variable(o_camera,"target",noone)
        cutscene_camera_pan(160,120,35,false,"linear")
        cutscene_actor_move(o_actor_fred,[
            new actor_movement(160,180,25,,,DIR.UP),
            new actor_movement(140,180,10,,,DIR.LEFT)
        ],,true,true)
        cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_up)
        cutscene_audio_play(snd_crickets)
        cutscene_sleep(60)
        cutscene_dialogue([
            "{char(sk,0)}* AHEM."
        ])
        cutscene_func(music_play,[mus_sidekick,0,true])
        cutscene_dialogue([
            "{char(sk,0)}* I... am SIDEKICK!",
            "{char(sk,0)}* SUPER HERO's second-in-command (sidekick),",
            "{char(sk,0)}* And, like I said,",
            "{char(sk,0)}* YOUR GREATEST ADVERSARY!!!",
            "{char(gary,0)}* Excuse me...",
            "{char(gary,0)}* Your name... is \"Sidekick\"?",
            "{char(sk,0)}* Yeah!"
        ])
        cutscene_sleep(20)
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left)
        cutscene_dialogue([
            "{char(gary,0)}* Dude, this is our Lancer."
        ])
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up)
        cutscene_dialogue([
            "{char(gary,0)}* Are you the bad guy?"
        ])
        cutscene_set_variable(o_actor_sk,"sprite_index",spr_sk_down_pose_serious)
        cutscene_dialogue([
            "{char(sk,0)}* WHAT! No!!!",
            "{char(sk,0)}* I'm the GOOD GUY.{br}{resetx}* YOU GUYS are the BAD GUYS.",
            "{char(gary,0)}* Ohhhhhhh.",
            "{char(gary,0)}* That makes no sense."
            ])
        cutscene_set_variable(o_actor_sk,"sprite_index",spr_sk_down_pose)
        cutscene_dialogue([
            "{char(sk,0)}* 'Course it makes sense!",
            "{char(sk,0)}* I'm the SIDEKICK to SUPER HERO...",
            "{char(sk,0)}* (the greatest hero of this world!){mini(So I guess I'm not your GREATEST adversary.\nMaybe SECOND greatest?,sk,0)}",
            "{char(sk,0)}* And YOU GUYS are here to stop us...",
            "{char(sk,0)}* Therefore, you're the BAD GUYS.",
            "{char(sk,0)}* And we're gonna KICK YOUR BUTTS!!!"
        ])
        cutscene_sleep(20)
        cutscene_dialogue("{char(gary,0)}* Okay. I see the confusion.")
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left)
        cutscene_dialogue([
            "{char(gary,0)}* (Fred, how do we explain this to him?)",
            "{char(none)}{choice(`We're the\ngood guys`,`We're the\nbad guys`)}"
        ],"{e}")
        cutscene_func(function() {
    		if global.temp_choice == 0 {
                cutscene_create()
                cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up)
        
                cutscene_dialogue([
                    "{char(gary,0)}* Yeah. You've got this all mixed up.",
                    "{char(sk,0)}* No I don't! Stop trying to TRICK ME!",
                    "{char(gary,0)}* We--{c}{char(sk,0)}* Nuh uh! Not another word, Gary!"
            ])
                cutscene_play()
            }
            else {
               	cutscene_create()
                cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_serious)
        
                cutscene_dialogue([
                    "{char(gary,0)}* What?!",
                    "{char(gary,0)}* You can't just say that, Fred!"])
                cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up)
                cutscene_dialogue([
                    "{char(sk,0)}* Uh huh. See! At least SOMEONE here knows their place.",
                    "{char(sk,0)}* Looking at you, Gary..."
                ])
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
        cutscene_dialogue([
            "{char(gary,0)}* Oh shit he knows my name.",
            "{char(sk,0)}* Of course! You'd do well to keep tabs on your foes.",
            "{char(sk,0)}* Anyway... Like I said, we're gonna stop you,",
            "{char(sk,0)}* And kick your sorry little BUTTS!",
            "{char(gary,0)}* Can you not say \"ass\"?",
            "{char(sk,0)}* Woah! Nope!",
            "{char(gary,0)}* That's okay. I respect the hustle.",
            "{char(gary,0)}* Alright, so what? You gonna fight us? We'll see you around?",
            "{char(sk,0)}* Erm... No! I'm not gonna fight you JUST YET...",
            "{char(sk,0)}* I've actually gotta prep. You know how it is.",
            "{char(sk,0)}* But YES, you'll see me around!",
            "{char(sk,0)}* Alright, see ya, BAD GUYS!"
        ])
        cutscene_func(music_fade,[0,0,60])
        cutscene_actor_move(o_actor_sk, new actor_movement(160,0,60,,,DIR.UP),,true)
        cutscene_sleep(30)
        cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_right)
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left)
        cutscene_dialogue([
            "{char(gary,0)}* I like him!",
            "{char(gary,0)}* Seems like a reverse Lancer situation.",
            "{char(gary,0)}* Also, wait. Just realized. No Legend...?",
            "{char(gary,0)}* Very odd... What do you think?",
            "{char(fred,0)}* I don't know. Let's move on.{mini(`Yeah, okay`.,gary,0)}"
        ])
        cutscene_func(camera_unpan,[get_leader(),30])
        cutscene_set_variable(o_actor_fred,"s_override",false)
        cutscene_set_variable(o_actor_gary,"s_override",false)
        cutscene_sleep(30)
        cutscene_player_canmove(true)
        cutscene_party_follow(true)
        cutscene_party_interpolate()
        cutscene_func(function(){
            o_actor_sk._sk = 1
            global.save.PLOT = 9
        })
        cutscene_play()
           }
}

if global.save.PLOT > 8 o_actor_sk.y = 0