interaction_code = function() { 
    if state_get("ate_breakfast",0) = false {
    dialogue_start([
        "* (It's the fridge.){br}{resetx}* (But there's already food on the table.)"
        ])
    }
    else {
    	dialogue_start([
        "* (It's the fridge.){br}{resetx}* (You're not hungry.)"
        ])
    }
}

visible = false