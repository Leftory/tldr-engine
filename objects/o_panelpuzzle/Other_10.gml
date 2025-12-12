event_inherited()

if won = false
{
cutscene_create()
cutscene_player_canmove(false)
cutscene_set_variable(self,"menu",true)
cutscene_audio_play(snd_ui_select)
cutscene_wait_until(function(){return !o_panelpuzzle.menu})
cutscene_func(function() {
    if o_panelpuzzle.won
    {
        script_execute(o_panelpuzzle.win_code)
    }
})
cutscene_set_variable(self,"arranged",false)
cutscene_player_canmove(true)
cutscene_play()
}
else {
	dialogue_start("* (It's solved.)")
}
