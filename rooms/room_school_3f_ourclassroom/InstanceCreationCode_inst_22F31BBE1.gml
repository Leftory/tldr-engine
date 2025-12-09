interaction_code = function(){
    if interacted = 0
    {
        dialogue_start([
        "{char(ross, 1)}* Yo Fred! 'Bout time you showed up, huh?",
        "{char(ross,2)}* You good now?",
        "{char(fred,0)}* Yes. All good.",
        "{char(ross,9)}* Awesome!",
        "{char(ross,6)}* Hey, so, if you're not busy later,",
        "{char(ross,3)}* Can you like, teach me math and shit?",
        "{char(fred,0)}* Again?",
        "{char(ross,3)}* Yeah... it's hard, dude!{mini(That's what she said!, ross, 9)}",
        "{char(fred,0)}* ...",
        "{char(fred,0)}* Yeah, okay. I'll do it.",
        "{char(ross,7)}* Great! Thanks!"
        ])
        state_add("ross_math",0)
    }
    else {
    	dialogue_start([
            "{char(ross,3)}* You should prolly, like...",
            "{char(ross,3)}* Head over to your desk??",
            "{char(ross,3)}* Teacher's staring."
        ])
    }
}