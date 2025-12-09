interaction_code = function(){
    if !state_get("got_lightsword",0)
    {
        instance_destroy(o_prop)
        state_add("got_lightsword",0)
        dialogue_start([
            "* (There was something in the mannequin's hand.)",
            "{sound(snd_item)}" + item_add(new item_w_lightsword())])
    }
    else {
    	dialogue_start("* (It's just a mannequin.)")
    }
}

if state_get("got_lightsword",0) instance_destroy(o_prop)
    
visible = false