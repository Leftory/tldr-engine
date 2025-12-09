trigger_code = function(){
    if global.save.PLOT <= 6 {
    cutscene_create()
    cutscene_player_canmove(false)
    cutscene_set_variable(o_actor_sh,"image_speed",0)
    cutscene_set_variable(o_actor_sh,"image_index",0)
    cutscene_dialogue([
        "{char(fred,0)}* Hey."
    ])
    cutscene_set_variable(o_actor_sh,"sprite_index",spr_sh_left_shadow)
    cutscene_dialogue([
        "{char(fred,0)}* Back off."
    ])
    cutscene_set_variable(o_actor_sh,"image_speed",1)
    cutscene_sleep(20)
    cutscene_set_variable(o_actor_sh,"image_speed",2)
    cutscene_sleep(20)
    cutscene_audio_play(snd_dash)
    cutscene_actor_move(o_actor_sh, new actor_movement(140,0,20,,,DIR.LEFT),,true,true)
    cutscene_sleep(30)
    cutscene_actor_move(o_actor_fred, new actor_movement(160,140,30,,,DIR.RIGHT),,true,true)
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_down)
    cutscene_sleep(20)
    cutscene_dialogue([
        "{char(fred,0)}* Gary...?"
    ])
    cutscene_audio_play(snd_noise)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_fallen_face)
    cutscene_animate(5,0,5,"linear",o_actor_gary,"shake")
    cutscene_sleep(10)
    cutscene_dialogue([
        "{char(gary,0)}* H-Huh?!",
        "{char(gary,0)}* Ah...!"
    ])
    cutscene_audio_play(snd_noise)
    cutscene_animate(5,0,5,"linear",o_actor_gary,"shake")
    cutscene_sleep(5)
    cutscene_audio_play(snd_noise)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up_serious)
    cutscene_animate(5,0,5,"linear",o_actor_gary,"shake")
    cutscene_set_variable(o_actor_gary,"x",160)
    cutscene_set_variable(o_actor_gary,"y",160)
    cutscene_dialogue([
        "{char(gary,0)}* What's going on?! Where are we?!",
        "{char(fred,0)}* ... You tell me."
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_left_serious)
    cutscene_sleep(20)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_right_serious)
    cutscene_sleep(20)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_down_serious)
    cutscene_dialogue([
        "{char(gary,0)}* WE'RE IN THE DARK WORLD?!",
        "{char(gary,0)}* Dude... DUDE..."
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up_serious)
    cutscene_dialogue([
        "{char(fred,0)}* I know.",
        "{char(fred,0)}* And your glasses...",
        "{char(gary,0)}* What?",
        "{char(fred,0)}* Um, take them off."
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_down_serious)
    cutscene_sleep(20)
    cutscene_audio_play(snd_noise)
    cutscene_animate(5,0,5,"linear",o_actor_gary,"shake")
    cutscene_sleep(30)
    cutscene_dialogue([
        "{char(gary,0)}* !",
        "{char(gary,0)}* DUDE.",
        "{char(gary,0)}* WHAT THE HELL'S GOING ON???",
        "{char(fred,0)}* I don't know.{br}{resetx}* But we need to press on.",
        "{char(fred,0)}* It's late. We need to get out of here, then the school.",
        "{char(gary,0)}* R-Right...",
        "{char(gary,0)}* ...",
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_down)
    cutscene_dialogue([
        "{char(gary,0)}* ...",
        "{char(fred,0)}* What?",
        "{char(gary,0)}* Heh... Can't be mad about an adventure, eh?",
        "{char(fred,0)}* ... This is not an \"adventure\".",
        "{char(gary,0)}* Sure, Fred. And we aren't in THE FRICKING DARK WORLD!!!",
        "{char(fred,0)}* ...",
        "{char(fred,0)}* (Sigh...)"
    ])
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_up)
    cutscene_dialogue([
        "{char(gary,0)}* BTW. I can actually see fine without the glasses now...",
        "{char(gary,0)}* Which is, y'know, weird.",
        "{char(gary,0)}* But I'll keep 'em on just for the sake of SPAMTON!",
        "{char(fred,0)}* ... Okay.",
        "{char(gary,0)}* Cool crown, by the way."
    ])
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_down_lookup)
    cutscene_dialogue([
        "{char(fred,0)}* Ah... Yeah."
    ])
    cutscene_set_variable(o_actor_fred,"sprite_index",spr_fred_down)
    cutscene_dialogue([
        "{char(gary,0)}* I can't believe THESE are our Dark World outfits!",
        "{char(gary,0)}* Mine is much cooler than yours,{br}by the way!{mini(`Debatable.`,fred,0)}",
        "{char(gary,0)}* Aaaaaaanyway, let's go!"
    ])
    cutscene_actor_move(o_actor_gary,new actor_movement(160,110,30,,,DIR.UP),,true,true)
    cutscene_set_variable(o_actor_gary,"sprite_index",spr_gary_down)
    cutscene_func(function() {
        var inst = o_actor_gary.id
        
        array_push(global.party_names, "gary")
        party_member_create("gary", true, inst.x, inst.y)
        o_actor_gary.sprite_index = spr_gary_down
        party_set_state("gary","")
        instance_destroy(inst)
    })
        cutscene_dialogue([
        "{char(gary,0)}* Gary joined the party AGAIN!",
        "{char(none)}* (Gary joined the party AGAIN.)"
    ])
    cutscene_party_interpolate()
    cutscene_set_variable(o_actor_fred,"s_override",false)
    cutscene_player_canmove(true)
    cutscene_set_variable(o_ow_save,"y",70)
    cutscene_play()
    global.save.PLOT = 7
    }
}

if global.save.PLOT > 6
{
    instance_destroy(inst_gary_cutscene)
    instance_destroy(o_actor_sh)
}