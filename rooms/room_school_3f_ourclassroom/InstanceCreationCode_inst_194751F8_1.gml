trigger_code = function(){
    cutscene_create()
    cutscene_dialogue([
        "{char(gary,0)}* Hey Fred--{c}{char(fred,0)}* No."
    ],,false)
    cutscene_sleep(1)
    cutscene_wait_until(function(){
        if o_text_typer.char == "fred" return true
    })
    
    cutscene_play()
}