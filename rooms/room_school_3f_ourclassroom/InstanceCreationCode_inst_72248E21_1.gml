interaction_code = function(){
    if interacted = 0
    {
        dialogue_start([
            "{char(felix,0)}* 'Sup Fred.",
            "{char(fred,0)}* Hi."
        ])
    }
    else {
    	dialogue_start([
            "{char(felix,0)}* ... Fred?"
        ])
    }
}