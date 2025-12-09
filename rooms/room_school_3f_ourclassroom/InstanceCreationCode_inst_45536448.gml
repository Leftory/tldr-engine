interaction_code = function(){
    if interacted = 0
    {
        dialogue_start([
            "{char(nate,0)}* Fred.",
            "{char(fred,0)}* Nate."
        ])
    }
    else {
    	dialogue_start([
            "{char(nate,0)}* ...?"
        ])
    }
}