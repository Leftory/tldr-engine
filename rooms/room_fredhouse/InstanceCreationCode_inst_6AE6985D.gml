int = 0
interaction_code = function() { 
    if state_get("ate_breakfast",0) = false {
    dialogue_start([
        "* (It's the dining table.)",
        "* (You're hungry.){br}{resetx}* (There's probably some food in the kitchen.)"
        ])
    }
    else {
    	if int = 0
        {
            dialogue_start([
        "* (It's the dining table.)",
        "* (You remember the time Gary spilled tea all over it.)",
        "* (You got so mad at him that day.)"
        ])
            int ++
        }
        else {
        	dialogue_start("* (Gary sucks.)")
        }
    }
}