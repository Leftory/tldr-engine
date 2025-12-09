trigger_code = function(){
    if instance_exists(o_actor_sh){
        actor_move(o_actor_sh,new actor_movement(340,280,10,,, DIR.RIGHT),,true)
        audio_play_sound(snd_dash,1,false)
    }
    if global.save.PLOT <= 4 global.save.PLOT = 5
}

if global.save.PLOT > 4 instance_destroy(o_actor_sh)