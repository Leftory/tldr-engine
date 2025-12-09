trigger_code = function(){
    cutscene_create()
    cutscene_player_canmove(false)
    dialogue_start([
        "{voice(snd_text_sk)}* Woah there, cowboy!",
        "{char(gary,0)}* C... Cowboy?",
        "{voice(snd_text_sk)}* Yes, cowboy!",
        "{char(sk,0)}* I am SIDEKICK!"
    ])
    
    
    cutscene_play()
}