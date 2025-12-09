running_code = function(){
    if !lever
    {
        inst_gate1.x = 60
        inst_gate1.y = 60
        inst_gate1.image_xscale = 2
        inst_gate1.image_yscale = 1
    }
    else {
        inst_gate1.x = 120
        inst_gate1.y = 100
        inst_gate1.image_xscale = 1
        inst_gate1.image_yscale = 2
    }
    
    with(o_actor_fred)
    {
        if place_meeting(x,y,inst_gate1) o_actor_fred.y ++
    }
}