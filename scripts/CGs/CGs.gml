function cg(spr,nofade=false){
    cutscene_create()
    if !nofade cutscene_func(fader_fade,[0,1,10])
    if !nofade cutscene_sleep(10)
    if !instance_exists(o_cutscene_cg) cutscene_func(instance_create,[o_cutscene_cg,0,0,0])
    cutscene_set_variable(o_cutscene_cg,"sprite_index",spr)
    if !nofade cutscene_func(fader_fade,[1,0,10])
    if !nofade cutscene_sleep(10)
    cutscene_play()
}

function cg_destroy(time=10){
    cutscene_create()
    cutscene_func(fader_fade,[0,1,time])
    cutscene_sleep(time)
    cutscene_func(instance_destroy,[o_cutscene_cg])
    cutscene_func(fader_fade,[1,0,10])
    cutscene_play()
}