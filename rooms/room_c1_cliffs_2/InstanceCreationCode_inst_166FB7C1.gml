stupid = 0
checked = 0
checked2 = 0
interaction_code = function(){
    if checked > 0 then checked2 = 1
    
    if stupid = 0 {
        if interacted = 0 {
    dialogue_start(["* (The way forward is blocked.)",
    "* (Maybe if you flip that lever...)"])
        }
        else {
        	dialogue_start("* (The lever.)")
        }
    }
    if stupid = 1{
        if interacted = 0 {
            dialogue_start("* (The way forward is unblocked.)")
    }
        else {
        	dialogue_start("* (... Just go.)")
        }
        if checked = 0 checked ++
}
    if stupid = 2{
        if interacted = 0
        {
            dialogue_start([
                "* (The way forward was unblocked, but it's now blocked again.)",
                "* (It seems as though the lever controls the mechanism.)"
            ])
        }
        else {
        	dialogue_start("* (... The lever.)")
        }
        if checked = 0 checked ++
    }
    if stupid = 3
    {
        dialogue_start("* (What exactly do you think you're doing?)")
        if checked = 0 checked ++
    }
    if stupid = 4
    {
        dialogue_start("* (Stop it.)")
        if checked = 0 checked ++
    }
    if stupid = 5
    {
        dialogue_start("* (Just go forward, man.)")
        if checked = 0 checked ++
    }
    if stupid = 6
    {
        if interacted = 0 dialogue_start("* (No more flavor text.)")
        if interacted > 0 dialogue_start("* (...)")
        if checked = 0 checked ++
    }
    if stupid >= 7
    {
        dialogue_start("* (...)")
        if checked = 0 checked ++
    }
}