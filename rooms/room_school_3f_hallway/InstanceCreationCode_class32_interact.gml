interaction_code = function(){
    if !array_contains(global.party_names,"gary")
    {
        dialogue_start([
                "* (Our classroom.)",
                "* (No reason to go back in there.)"
            ])
    }
        else {
        	if interacted = 0
            {
                dialogue_start([
                    "{char(gary,0)}* What? Did you forget something?",
                    "{char(fred,0)}* No."
                ])
            }
            else {
            	dialogue_start([
                    "{char(gary,0)}* ... Then why are you looking at the door?",
                    "{char(fred,0)}* Shut up."
                ])
            }
        }
}