fought_fig = 0

interaction_code = function(){
    if fought_fig = 0
    {
    if interacted = 0
    {
        dialogue_start("* We love Super Hero!")
    }
    if interacted = 1
    {
        dialogue_start("* Didn't you hear?! Super Hero's doing a LIVE SIGNING EVENT in Collecticity!")
    }
    if interacted = 2
    {
        dialogue_start("* We gotta get to Collecticity STAT!")
        interacted = -1
    }
    }
    else {
        if interacted = 0
        {
            dialogue_start("* Dude, did those guys just fight one of us?")
        }
        if interacted = 1
        {
            dialogue_start("* Nice... Never liked that one anyway. Didn't stand out enough.")
            interacted = -1
        }
    }
}

visible = false