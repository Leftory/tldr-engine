interaction_code = function(){
    if interacted = 0
    {
        dialogue_start([
            "{char(victor,0)}* Ah, Fred... So you finally decide to show your face.",
            "{char(fred,0)}* Hi Victor.",
            "{char(victor,0)}* Well, I hope you're well rested, Fred...",
            "{char(victor,0)}* Because tonight we're gonna have a REMATCH.",
            "{char(fred,0)}* Really? Again?",
            "{char(victor,0)}* Yes, again!",
            "{char(fred,0)}* You know you win every time.",
            "{char(victor,0)}* While that may be true, I still want to give you another chance!",
            "{char(victor,0)}* Hmm, yes. Another chance.",
            "{char(fred,0)}* ... Fine. Tonight.",
            "{char(victor,0)}* Hurrah! See you there, my dear opponent."
        ])
    }
    else {
    	dialogue_start([
            "{char(victor,0)}* Run along, Fred. Your defeat awaits."
        ])
    }
}