interaction_code = function(){
    if !array_contains(global.party_names,"gary")
    {
        dialogue_start([
                "* (A neighboring classroom.){br}{resetx}* (Class 31.)",
                "* (No reason to go in there.)"
            ])
    }
        else {
        	if interacted = 0
            {
                dialogue_start([
                    "{char(gary,0)}* Why the hell would we go back here.",
                    "{char(gary,0)}* Let's. Not."
                ])
            }
            else {
            	dialogue_start([
                    "{char(gary,0)}* Let's. Not."
                ])
            }
        }
}