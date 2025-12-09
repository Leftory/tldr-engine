interaction_code = function(){
    if interacted = 0
    {
        dialogue_start([
            "{char(haley,4)}* Hi Fred!",
            "{char(fred,0)}* Hi Haley."
        ])
    }
    else {
    	dialogue_start([
            "{char(haley,8)}* ...",
            "{char(fred,0)}* ..."
        ])
    }
}