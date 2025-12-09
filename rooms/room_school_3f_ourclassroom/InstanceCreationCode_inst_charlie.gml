interaction_code = function(){
    if interacted = 0
    {
        dialogue_start([
            "{char(fred,0)}* Hi Charlie.",
            "{char(charlie,0)}* Oh hi Fred."
        ])
    }
    else {
    	dialogue_start([
            "{char(charlie,0)}* ..."
        ])
    }
}