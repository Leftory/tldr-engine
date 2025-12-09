running_code = function(){
    inst_166FB7C1.x = 180 - (120*lever)
}

interaction_code = function(){
    inst_166FB7C1.interacted = 0
    if inst_166FB7C1.stupid<2
    {
        inst_166FB7C1.stupid ++
    } 
    else if inst_166FB7C1.checked == 0 and inst_166FB7C1.checked2 = 0 {
    	inst_166FB7C1.stupid = 1
    }
    else if inst_166FB7C1.checked > 0 {
    	inst_166FB7C1.stupid ++
    }
    inst_166FB7C1.checked = 0
    
}