interaction_code = function(){
    if interacted = 0
    {
        dialogue_start([
            "{char(grady,0)}* Fred! You're alive...",
            "{char(fred,0)}* Yup. And kicking...",
            "{char(grady,9)}* Thank God."
        ])
    }
    else {
    	dialogue_start([
            "{char(grady,0)}* Yo... Let's chat later! It's class time.",
            "{char(grady,0)}* Gotta respect our studies."
        ])
    }
}