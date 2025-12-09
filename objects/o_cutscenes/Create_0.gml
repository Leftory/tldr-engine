player_x = 0
player_y = 0

// CHAPTER 1


// Intro

if room == room_calling
{
    cutscene_create()
    cutscene_func(flash_fade,[0,1,0,c_black])
    cutscene_audio_play(snd_fountain_make)
    cutscene_sleep(360)
    cutscene_audio_play(mus_calling,0,1,0.9)
    cutscene_func(instance_create,[o_soul_blurry,160,160])
    cutscene_func(flash_fade,[1,0,60,c_black])
    cutscene_sleep(165)
    cutscene_func(function(){
        text_typer_create([
        "Did you{br}hear that?{s(180)}{c}You've got{br}a mission.{s(180)}{c}It's time{br}{s(20)}to go back."
        ]
    , 130, 160, 0, "{preset(god_text)}{can_skip(false)}","",{ gui: true })
    })
    cutscene_sleep(570)
    cutscene_func(flash_fade,[0,1,60,c_white])
    cutscene_sleep(60)
    cutscene_func(flash_fade,[1,0,0])
    cutscene_func(room_goto,[room_fredroom])
    cutscene_play()
}

if room == room_fredroom
{
    if global.save.PLOT = 0 {
        cutscene_create()
        cutscene_player_canmove(false)
        cutscene_set_variable(o_actor_fred,"x",280)
        cutscene_set_variable(o_actor_fred,"y",102)
        cutscene_set_variable(o_actor_fred,"s_override", true)
        cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_right_light)
        cutscene_sleep(120)
        cutscene_audio_play(snd_wing)
        cutscene_animate(5, 0, 5, "linear", o_actor_fred, "shake")
        cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_down_light)
        cutscene_sleep(60)
        cutscene_func(cg,[spr_cg_fredwakeup1])
        cutscene_sleep(30)
        cutscene_dialogue([
            "* (You are Fred Jhermstad.)",
            "* (You are 17 years old and currently attending Perd Cooper Academy.)",
            "* (You have been too sick to go to school the past few days.)",
            "* (But today, you feel better... somewhat.)"
        ])
        cutscene_wait_dialogue_finish()
        cutscene_func(cg,[spr_cg_fredwakeup2])
        cutscene_sleep(20)
        cutscene_dialogue("* (It's time to go to school. You're late.)")
        cutscene_func(cg,[spr_cg_fredwakeup3])
        cutscene_sleep(70)
        cutscene_func(cg_destroy)
        cutscene_set_variable(o_actor_fred,"x",250)
        cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_left_light)
        cutscene_sleep(40)
        cutscene_actor_move(o_actor_fred, new actor_movement(250, 188, 50,,, DIR.DOWN),,true)
        cutscene_sleep(10)
        cutscene_func(fader_fade,[0,1,20])
        cutscene_sleep(30)
        cutscene_dialogue("* (You quickly change and get ready.)")
        cutscene_func(fader_fade,[1,0,20])
        cutscene_sleep(30)
        cutscene_dialogue("* (It's time to go.)")
        cutscene_player_canmove(true)
        cutscene_set_variable(o_actor_fred,"s_override", false)
        cutscene_func(global.save.PLOT ++)
        cutscene_play()
}
}

if room == room_fredoutside
{
    cutscene_create()
    cutscene_func(flash_fade,[0,1,0,c_black])
    cutscene_sleep(30)
    cutscene_audio_play(snd_escaped)
    cutscene_sleep(60)
    cutscene_set_variable(o_fredbus,"x",0)
    cutscene_audio_play(snd_fredbus)
    cutscene_func(flash_fade,[1,0,60,c_black])
    cutscene_sleep(60)
    cutscene_set_variable(o_fredbus,"lp",1)
    cutscene_sleep(150)
    cutscene_set_variable(o_fredbus,"lp",2)
    cutscene_sleep(90)
    cutscene_func(flash_fade,[0,1,60,c_black])
    cutscene_sleep(90)
    cutscene_func(flash_fade,[1,0,0,c_black])
    cutscene_func(room_goto,[room_school_outside])
    cutscene_play()
}

if room == room_school_outside
{
    cutscene_create()
    cutscene_func(fader_fade,[1,0,20])
    cutscene_player_canmove(false)
    cutscene_sleep(30)
    cutscene_actor_move(o_actor_fred, new actor_movement(160, 192, 90,,, DIR.LEFT),,true)
    cutscene_actor_move(o_actor_fred, new actor_movement(160,90,60,,,DIR.UP),,false)
    cutscene_sleep(30)
    cutscene_func(flash_fade,[0,1,30,c_black])
    cutscene_sleep(60)
    cutscene_audio_play(snd_escaped)
    cutscene_sleep(30)
    cutscene_func(flash_fade,[1,0,0,c_black])
    cutscene_func(room_goto,[room_school_3f_hallway])
    cutscene_play()
}

if room == room_school_3f_hallway
{
    if global.save.PLOT <= 1{
        cutscene_create()
        cutscene_player_canmove(false)
        cutscene_func(fader_fade,[1,0,20])
        cutscene_set_variable(o_camera, "target", cam_classroom32)
        cutscene_sleep(30)
        cutscene_actor_move(o_actor_fred, new actor_movement(580,200,90,, DIR.LEFT),,true)
        cutscene_set_variable(o_actor_fred,"s_override",true)
        cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_up_light)
        cutscene_sleep(30)
        cutscene_actor_move(o_actor_fred, new actor_movement(580,140,60,,DIR.UP),,false)
        cutscene_sleep(30)
        cutscene_func(fader_fade,[0,1,30])
        cutscene_sleep(60)
        cutscene_func(function(){global.save.PLOT = 2})
        cutscene_func(room_goto,[room_school_3f_ourclassroom])
        cutscene_play()
    }
    if global.save.PLOT = 2{
        cutscene_create()
        cutscene_set_variable(o_actor_fred,"x",580)
        cutscene_set_variable(o_actor_fred,"y",150)
        cutscene_func(music_fade,[0,0,60])
        cutscene_player_canmove(false)
        cutscene_func(instance_create,[o_actor_tom,660,180])
        cutscene_func(instance_create,[o_actor_haley,660,200])
        cutscene_actor_move(o_actor_tom,[
            new actor_movement(800,180,59,,, DIR.RIGHT)
        ],,false)
        cutscene_actor_move(o_actor_haley,[
            new actor_movement(800,200,59,,, DIR.RIGHT)
        ],,false)
        cutscene_actor_move(o_actor_fred,[
            new actor_movement(580,200,30,,, DIR.DOWN,true)
        ],,true,false)
        cutscene_set_variable(o_actor_fred,"dir",DIR.RIGHT)
        cutscene_sleep(30)
        cutscene_func(instance_destroy,[o_actor_tom])
        cutscene_func(instance_destroy,[o_actor_haley])
        cutscene_player_canmove(true)
        cutscene_wait_until(function(){
            return o_actor_fred.x >= 676
        })
        cutscene_player_canmove(false)
        cutscene_audio_play(snd_locker)
        cutscene_func(screen_shake,[5,5])
        cutscene_sleep(45)
        cutscene_set_variable(o_camera, "target", noone)
        cutscene_set_variable(o_actor_fred,"s_override",true)
        cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_left_light)
        cutscene_func(instance_create,[o_soul_blurry,580,0])
        cutscene_set_variable(o_soul_blurry,"visible",false)
        cutscene_func(camera_unpan,[cam_classroom32,60])
        cutscene_sleep(75)
        cutscene_func(fader_fade,[0,1,30])
        cutscene_sleep(40)
        cutscene_func(function(){o_actor_fred.y -= 999})
        cutscene_dialogue([
            "{voice(snd_text_gary)}* Hang on, Fred!"
        ])
        cutscene_func(cg,[spr_cg_gary,true])
        cutscene_sleep(1)
        cutscene_func(fader_fade,[1,0,30])
        cutscene_func(music_play,[mus_gary,0,true,1,1])
        cutscene_sleep(30)
        cutscene_dialogue([
            "{char(gary,0)}* Can't get rid of me that easy.",
            "{char(fred,0)}* ... Not now, Gary.",
            "{char(gary,0)}* Come on!",
            "{char(fred,0)}* What do you want?",
            "{char(gary,0)}* I want you to come with us on the subway.",
            "{char(fred,0)}* ... Pass.",
            "{char(gary,0)}* Come ooooooon!!!!!!!",
            "{char(fred,0)}* Why do you want me to come so badly?",
            "{char(fred,0)}* I already said no.",
            "{char(gary,0)}* I don't want to be alone!",
            "{char(gary,0)}* You can fix that. C'mon.",
            "{char(fred,0)}* It's literally like five stations.{s(5)}{br}{resetx}* You can handle it.",
            "{char(gary,0)}* Nope!",
            "{char(gary,0)}* ... Y'know, Charlie also goes on the subway...",
            "{char(gary,0)}* Doesn't that make you want to go?!",
            "{char(fred,0)}* For the last time, Charlie and I are just friends.",
            "{char(gary,0)}* Suuuuuuure. Sure, Fred."
        ])
        cutscene_func(cg_destroy,[10])
        cutscene_func(instance_create,[o_actor_gary,580,150])
        cutscene_set_variable(o_actor_gary,"s_override",true)
        cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_right_light)
        cutscene_set_variable(o_actor_gary,"image_speed",0)
        cutscene_func(function(){o_actor_fred.y += 999})
        cutscene_sleep(20)
        cutscene_dialogue([
            "{char(gary,0)}* So, you coming or what?",
            "{char(fred,0)}* No.",
            "{char(gary,0)}* Sigh. I'll convince you on the way there."
        ])
        cutscene_func(function() {
        var inst = o_actor_gary.id
        
        array_push(global.party_names, "gary")
        party_member_create("gary", true, inst.x, inst.y)
        o_actor_gary.sprite_index = spr_gary_down_light
        instance_destroy(inst)
    })
        cutscene_party_follow(false)
        cutscene_func(function(){
            cutscene_create()
            cutscene_actor_move(o_actor_gary,[
            new actor_movement(710,o_cutscenes.player_y,60,,, DIR.RIGHT),
            new actor_movement(710,o_cutscenes.player_y,0,,, DIR.LEFT)
            ]
            ,,false)
            cutscene_play()
        })
        cutscene_func(camera_unpan,[get_leader(), 60])
        cutscene_sleep(70)
        cutscene_dialogue([
            "{char(fred,0)}* What are you doing?",
            "{char(gary,0)}* Gary joined the party!",
            "{char(none)}* (Gary joined the party.)",
            "{char(fred,0)}* ...",
            "{char(fred,0)}* (He is so annoying.)"
        ])
        cutscene_party_follow(true)
        cutscene_party_interpolate()
        cutscene_player_canmove(true)
        cutscene_set_variable(o_actor_fred,"s_override",false)
        cutscene_set_variable(class32_interact,"interacted",0)
        cutscene_set_variable(class31_interact,"interacted",0)
        cutscene_set_variable(class33_interact,"interacted",0)
        cutscene_set_variable(o_trigger,"interacted",0)
        cutscene_func(function(){global.save.PLOT = 3})
        cutscene_play()
    }
}

if room == room_school_3f_ourclassroom
{
    cutscene_create()
    cutscene_func(fader_fade,[0,1,0])
    cutscene_player_canmove(false)
    cutscene_set_variable(o_actor_fred,"y",0)
    cutscene_set_variable(o_actor_fred,"s_override",true)
    cutscene_set_variable(o_actor_tom,"s_override",true)
    cutscene_set_variable(o_actor_alex,"s_override",true)
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_right_light)
    cutscene_set_variable(o_actor_alex,"sprite_index",spr_alex_right_light)
    cutscene_audio_play(snd_dooropen)
    cutscene_sleep(30)
    cutscene_func(cg,[spr_cg_ourclassroom_ch1,true])
    cutscene_sleep(1)
    cutscene_func(fader_fade,[1,0,30])
    cutscene_sleep(60)
    cutscene_dialogue(["* Ah, Jhermstad.{br}{resetx}* We weren't expecting you.",
    "* Go on then, have a seat."])
    cutscene_set_variable(o_actor_fred,"x",160)
    cutscene_set_variable(o_actor_fred,"y",290)
    cutscene_set_variable(o_actor_fred,"dir",DIR.UP)
    cutscene_audio_play(snd_doorclose)
    cutscene_func(cg_destroy,[30])
    cutscene_sleep(30)
    cutscene_func(music_play,[mus_ex_city,0,true,1,1])
    cutscene_actor_move(o_actor_fred, new actor_movement(160,270,10,, DIR.UP),,true)
    cutscene_actor_move(o_actor_fred, new actor_movement(215,270,27,, DIR.RIGHT),,true)
    cutscene_actor_move(o_actor_fred, new actor_movement(215,150,60,, DIR.UP),,true)
    cutscene_actor_move(o_actor_fred, new actor_movement(100,150,50,, DIR.LEFT),,true)
    cutscene_actor_move(o_actor_fred, new actor_movement(100,140,5,, DIR.UP),,true)
    cutscene_actor_move(o_actor_fred, new actor_movement(100,140,0,, DIR.RIGHT),,true)
    cutscene_sleep(30)
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_left_light)
    cutscene_dialogue([
        "{char(tom,0)}* yo, fred. we didn't think you were coming.",
        "{char(tom,0)}* feel better?",
    "{char(none)}{choice(`Yes`, `No`)}"
            ], "{e}")
    cutscene_func(function() {
    		if global.temp_choice == 0 {
                cutscene_create()
                cutscene_dialogue([
                    "{char(fred,0)}* Yes.",
                    "{char(tom,0)}* good."
            ])
                cutscene_play()
            }
            else {
               	cutscene_create()
                cutscene_dialogue([
                    "{char(fred,0)}* No.",
                    "{char(tom,0)}* then why the hell'd you come here?{br}{resetx}* weirdo...",
                    "{char(tom,0)}* whatever."
            ])
                cutscene_play()
            }
})
    cutscene_sleep(2)
    cutscene_wait_until(function() {
        return !instance_exists(o_ui_dialogue)
    })
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_right_light)
    cutscene_sleep(90)
    cutscene_audio_play(snd_noise)
    cutscene_animate(5,0,5,"linear",o_actor_fred,"shake")
    cutscene_sleep(60)
    cutscene_func(fader_fade,[0,1,30])
    cutscene_sleep(40)
    cutscene_dialogue([
        "* (The class goes on as usual.)",
        "* (You fall asleep, as usual.)"
    ])
    cutscene_func(music_fade, [0, 0,30])
    cutscene_sleep(30)
    cutscene_func(music_pause,[0])
    cutscene_sleep(90)
    cutscene_audio_play(snd_bump)
    cutscene_sleep(60)
    cutscene_audio_play(snd_noise)
    cutscene_sleep(30)
    cutscene_audio_play(snd_noise)
    cutscene_sleep(30)
    cutscene_audio_play(snd_noise)
    cutscene_dialogue([
        "{voice(snd_text_tom)}* wake up, dumbass!"
    ])
    cutscene_func(instance_destroy,[inst_charlie])
    cutscene_func(instance_destroy,[inst_haley])
    cutscene_actor_move(o_actor_tom, new actor_movement(130,150,0,, DIR.LEFT),,true)
    cutscene_actor_move(o_actor_alex, new actor_movement(190,150,0,, DIR.DOWN),,true)
    cutscene_set_variable(o_actor_fred,"s_override",true)
    cutscene_set_variable(o_actor_tom,"s_override",true)
    cutscene_set_variable(o_actor_alex,"s_override",true)
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_left_light)
    cutscene_func(fader_fade,[1,0,30])
    cutscene_func(music_resume,[0])
    cutscene_func(music_fade, [0, 1,30])
    cutscene_sleep(45)
    cutscene_dialogue([
        "{char(tom,0)}* jeez...",
        "{char(tom,0)}* falling asleep in class? again?"
    ])
    cutscene_actor_move(o_actor_alex, new actor_movement(160,150,20,, DIR.LEFT),,false)
    cutscene_set_variable(o_actor_alex,"s_override",true)
    cutscene_dialogue([
        "{char(alex,0)}* Don't bother him, Tom."
    ])
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_right_light)
    cutscene_dialogue([
        "{char(tom,0)}* i literally didn't do anything."
    ])
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_left_light)
    cutscene_dialogue([
        "{char(fred,0)}* It's okay."
    ],,false)
    cutscene_actor_move(o_actor_fred, new actor_movement(100,152,20,, DIR.DOWN),,true)
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_right_light)
    cutscene_set_variable(o_actor_fred,"image_speed",0)
    cutscene_set_variable(o_actor_fred,"image_index",0)
    cutscene_set_variable(o_actor_fred,"s_override",true)
    cutscene_wait_dialogue_finish()
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_right_light)
    cutscene_dialogue([
        "{char(alex,0)}* IS everything okay, Fred...?",
        "{char(alex,0)}* You look a bit... paler than usual."
        ])
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_left_light)
    cutscene_dialogue([
        "{char(fred,0)}* I'm fine.",
        "{char(fred,0)}* Really."
    ])
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_down_light)
    cutscene_dialogue("{char(fred,0)}* Just didn't get enough sleep last night.")
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_down_light)
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_right_light)
    cutscene_dialogue("{char(alex,0)}* Alright...")
    cutscene_set_variable(o_actor_alex,"s_override",true)
    cutscene_set_variable(o_actor_alex,"sprite_index",spr_alex_down_light)
    cutscene_dialogue("{char(alex,0)}* ...")
    cutscene_set_variable(o_actor_alex,"sprite_index",spr_alex_left_light)
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_right_light)
    cutscene_dialogue([
        "{char(alex,0)}* Um, Fred...",
        "{char(alex,0)}* If you ever feel like... I don't know...",
        "{char(alex,0)}* Just... we're... here for you, okay?"
        ])
    cutscene_sleep(60)
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_left_light)
    cutscene_dialogue([
        "{char(tom,0)}* yeah."
    ])
    cutscene_sleep(20)
    cutscene_dialogue([
        "{char(tom,0)}* especially charlie."
    ])
    cutscene_set_variable(o_actor_alex,"sprite_index",spr_alex_laughing_light)
    cutscene_set_variable(o_actor_alex,"image_speed",1)
    cutscene_dialogue([
        "{char(alex,0)}* Pffft. Right."
    ])
    cutscene_sleep(30)
    cutscene_set_variable(o_actor_alex,"sprite_index",spr_alex_left_light)
    cutscene_set_variable(o_actor_alex,"image_speed",0)
    cutscene_dialogue([
        "{char(fred,0)}* ...",
        "{char(fred,0)}* Thanks."
    ])
    cutscene_sleep(60)
    cutscene_set_variable(o_actor_tom,"sprite_index",spr_tom_right_light)
    cutscene_dialogue([
        "{char(tom,0)}* okay, let's get out of here.",
        "{char(alex,0)}* Oh yeah. I think Haley's waiting for you outside."
    ])
    cutscene_actor_move(o_actor_alex,[
        new actor_movement(215,150,20,, DIR.RIGHT),
        new actor_movement(215,270,40,, DIR.DOWN),
        new actor_movement(160,270,20,, DIR.LEFT),
        new actor_movement(160,350,30,, DIR.DOWN)
        ],,false)
    cutscene_actor_move(o_actor_tom,[
        new actor_movement(215,150,40,, DIR.RIGHT),
        new actor_movement(215,270,40,, DIR.DOWN),
        new actor_movement(160,270,20,, DIR.LEFT),
        new actor_movement(160,350,30,, DIR.DOWN)
        ],,false)
    cutscene_sleep(60)
    cutscene_set_variable(o_actor_fred,"s_override",false)
    cutscene_player_canmove(true)
    cutscene_play()
}

if room == room_amphitheatre_dw
{
    party_set_state("gary","light_serious")
    cutscene_create()
    cutscene_func(fader_fade,[1,0,180])
    cutscene_set_variable(o_actor_fred,"dir",DIR.RIGHT)
    cutscene_party_follow(false)
    cutscene_actor_move(o_actor_gary, new actor_movement(100,120,0,, DIR.RIGHT),,false,true)
    cutscene_player_canmove(false)
    cutscene_sleep(30)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_light_serious)
    cutscene_dialogue([
        "{char(gary,0)}* Hey.{br}{resetx}* Watch your step..."
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_right_light_serious)
    cutscene_dialogue([
        "{char(gary,0)}* It's so dark... This definitely isn't normal, Fred.",
        "{char(gary,0)}* But... I think I see something down there..."
        ])
    cutscene_actor_move(o_actor_gary, new actor_movement(190,210,90,, DIR.RIGHT),,false,true)
    cutscene_player_canmove(true)
    cutscene_wait_until(function(){return o_actor_fred.x >= 160})
    cutscene_player_canmove(false)
    cutscene_dialogue([
        "{char(gary,0)}* ...",
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_light_serious)
    cutscene_dialogue([
        "{char(gary,0)}* Um... Fred?",
        "{char(fred,0)}* Yeah...?"
    ])
    cutscene_sleep(10)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_right_light_serious)
    cutscene_sleep(10)
    cutscene_dialogue([
        "{char(gary,0)}* Um... Nothing."
    ])
    cutscene_actor_move(o_actor_gary, new actor_movement(330,350,60,, DIR.RIGHT),,false,true)
    cutscene_player_canmove(true)
    cutscene_wait_until(function(){return o_actor_fred.x >= 300})
    cutscene_player_canmove(false)
    cutscene_dialogue([
        "{char(gary,0)}* .......",
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_light_serious)
    cutscene_dialogue([
        "{char(gary,0)}* I'm getting... a really bad feeling about this.",
        "{char(fred,0)}* ...",
        "{char(fred,0)}* Actually... me too.",
        "{char(gary,0)}* As much as I like DELTARUNE... I am NOT dealing with this.",
        "{char(gary,0)}* Let's go back outside."
    ])
    cutscene_actor_move(o_actor_fred,[
        new actor_movement(150,170,56,, DIR.LEFT),
        new actor_movement(70,90,34,, DIR.LEFT)
        ],,false,true)
    cutscene_actor_move(o_actor_gary,[
        new actor_movement(200,220,56,, DIR.LEFT),
        new actor_movement(120,140,34,, DIR.LEFT)
        ],,false,true)
    cutscene_sleep(90)
    cutscene_audio_play(snd_locker)
    cutscene_func(music_stop,[0])
    cutscene_set_variable(o_prop,"visible",false)
    cutscene_func(screen_shake,[10,10])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_light_shocked)
    cutscene_sleep(30)
    cutscene_dialogue([
        "{char(gary,0)}* !!!",
        "{char(gary,0)}* Th-The door..."
    ])
    cutscene_sleep(30)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_down_light)
    cutscene_dialogue([
        "{char(gary,0)}* A-Ah... It's okay...",
        "{char(gary,0)}* I bet it's just... Tom playing a p-prank on us, right?",
        "{char(gary,0)}* C-Classic Tom..."
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_down_light_serious)
    cutscene_dialogue([
        "{char(gary,0)}* ..."
    ])
    cutscene_actor_move(o_actor_gary,[
        new actor_movement(90,110,34,, DIR.LEFT)
        ],,false,true)
    cutscene_dialogue([
        "{char(gary,0)}* H-Hey, Tom??{br}{resetx}* Please let us out!!!",
        "{char(gary,0)}* Pl{c}"
    ],,false)
    cutscene_wait_dialogue_boxes(2)
    cutscene_func(instance_destroy,[o_ui_dialogue])
    cutscene_func(instance_destroy,[o_text_face])
    cutscene_func(screen_shake,[10,30])
    cutscene_func(music_play,[snd_water_weird,0,true,1,random_range(0.7,1.3)])
    cutscene_wait_until(function(){return o_actor_gary.x=90})
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_sleep(10)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_audio_play(snd_wing)
    cutscene_sleep(10)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_audio_play(snd_wing)
    cutscene_sleep(10)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_audio_play(snd_wing)
    cutscene_set_variable(o_actor_gary,"slide_y",2)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_slip_light_shocked)
    cutscene_sleep(5)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_set_variable(o_actor_gary,"slide_y",0)
    cutscene_animate(10,0,10,"linear",o_actor_gary,"shake")
    cutscene_audio_play(snd_wing)
    cutscene_sleep(10)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_dialogue([
        "{char(gary,0)}* A-Ah! Fred!!!{br}{resetx}* The floor, it's--"
    ])
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_right_light)
    cutscene_dialogue([
        "{char(fred,0)}* Let go--",
        "{char(gary,0)}* Do you really think now's a good time to tell me to let go?!"
    ])
    cutscene_audio_play(snd_wing)
    cutscene_animate(10,0,5,"linear",o_actor_gary,"shake")
    cutscene_sleep(5)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_audio_play(snd_wing)
    cutscene_animate(10,0,10,"linear",o_actor_gary,"shake")
    cutscene_sleep(10)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_animate(10,0,10,"linear",o_actor_gary,"shake")
    cutscene_set_variable(o_actor_gary,"slide_y",3)
    cutscene_set_variable(o_actor_gary,"slide_x",3)
    cutscene_audio_play(snd_fall)
    cutscene_dialogue([
        "{char(gary,0)}* FRED!!!"
    ])
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_sleep(60)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_func(instance_destroy,[o_actor_gary])
    cutscene_func(function(){
        global.party_names = ["fred"]
    })
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_left_light)
    cutscene_audio_play(snd_wing)
    cutscene_sleep(10)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_audio_play(snd_wing)
    cutscene_set_variable(o_actor_fred,"slide_y",-1)
    cutscene_set_variable(o_actor_fred,"slide_x",-1)
    cutscene_sleep(5)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_set_variable(o_actor_fred,"slide_y",0)
    cutscene_set_variable(o_actor_fred,"slide_x",0)
    cutscene_sleep(5)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_audio_play(snd_wing)
    cutscene_set_variable(o_actor_fred,"slide_y",-1)
    cutscene_set_variable(o_actor_fred,"slide_x",-1)
    cutscene_sleep(5)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_set_variable(o_actor_fred,"slide_y",0)
    cutscene_set_variable(o_actor_fred,"slide_x",0)
    cutscene_sleep(5)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_audio_play(snd_wing)
    cutscene_set_variable(o_actor_fred,"slide_y",-1)
    cutscene_set_variable(o_actor_fred,"slide_x",-1)
    cutscene_sleep(5)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_set_variable(o_actor_fred,"slide_y",0)
    cutscene_set_variable(o_actor_fred,"slide_x",0)
    cutscene_sleep(5)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_audio_play(snd_wing)
    cutscene_set_variable(o_actor_fred,"slide_y",-1)
    cutscene_set_variable(o_actor_fred,"slide_x",-1)
    cutscene_sleep(10)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_set_variable(o_actor_fred,"slide_y",0)
    cutscene_set_variable(o_actor_fred,"slide_x",0)
    cutscene_sleep(30)
    cutscene_func(function(){
        audio_sound_pitch(snd_water_weird,random_range(0.7,1.3))
    })
    cutscene_audio_play(snd_dooropen)
    cutscene_set_variable(o_prop,"visible",true)
    cutscene_sleep(30)
    cutscene_func(cg,[spr_cg_strangefigure])
    cutscene_sleep(10)
    cutscene_func(music_fade,[0,0,30])
    cutscene_sleep(35)
    cutscene_dialogue([
        "{char(fred,0)}* ...?!"
    ],,true)
    cutscene_audio_play(snd_wing)
    cutscene_func(screen_shake,[5,5])
    cutscene_sleep(5)
    cutscene_audio_play(snd_wing)
    cutscene_func(screen_shake,[5,5])
    cutscene_sleep(5)
    cutscene_audio_play(snd_wing)
    cutscene_func(screen_shake,[5,5])
    cutscene_audio_play(snd_fall)
    cutscene_set_variable(o_cutscene_cg,"slide_y",-10)
    cutscene_func(instance_destroy,[o_actor_fred])
    cutscene_func(instance_destroy,[o_prop])
    cutscene_sleep(60)
    cutscene_audio_play(snd_fall)
    cutscene_sleep(60)
    cutscene_audio_play(snd_hurt)
    cutscene_sleep(150)
    cutscene_func(function(){global.go_to_dw = 1})
    cutscene_func(room_goto,[room_intro])
    cutscene_play()
}


// Cliffs

if room == room_c1_cliffs_start and global.save.PLOT <= 3
{
    global.save.PLOT = 4
    cutscene_create()
    //cutscene_set_variable("o_dev_border","_border_name",noone)
    cutscene_func(fader_fade,[0,1,0])
    cutscene_player_canmove(false)
    cutscene_set_variable(get_leader(),"s_override",true)
    cutscene_set_variable(get_leader(),"sprite_index",spr_fred_landed)
    cutscene_audio_play(snd_puddlefootsteps)
    cutscene_sleep(150)
    cutscene_func(fader_fade,[1,0,0])
    //cutscene_set_variable("o_dev_border","_border_name",border_simple)
    cutscene_func(screen_shake,[10,5])
    cutscene_audio_play(snd_noise)
    cutscene_sleep(60)
    cutscene_animate(10, 0, 5, "linear", o_actor_fred, "shake")
    cutscene_func(screen_shake,[10,5])
    cutscene_audio_play(snd_noise)
    cutscene_sleep(10)
    cutscene_animate(10, 0, 5, "linear", o_actor_fred, "shake")
    cutscene_func(screen_shake,[10,5])
    cutscene_audio_play(snd_noise)
    cutscene_sleep(10)
    cutscene_animate(10, 0, 5, "linear", o_actor_fred, "shake")
    cutscene_func(screen_shake,[10,5])
    cutscene_audio_play(snd_noise)
    cutscene_sleep(10)
    cutscene_animate(10, 0, 5, "linear", o_actor_fred, "shake")
    cutscene_func(screen_shake,[10,5])
    cutscene_audio_play(snd_noise)
    cutscene_sleep(10)
    cutscene_animate(20, 0, 5, "linear", o_actor_fred, "shake")
    cutscene_func(screen_shake,[10,5])
    cutscene_audio_play(snd_noise)
    cutscene_set_variable(get_leader(),"sprite_index",spr_fred_down)
    cutscene_set_variable(get_leader(),"s_override",false)
    cutscene_player_canmove(true)
    cutscene_play()
}