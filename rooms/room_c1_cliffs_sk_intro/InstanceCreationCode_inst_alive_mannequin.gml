visible = false
interaction_code = function(){
    if o_actor_sk._sk = 0{
    if interacted = 0
    {
        if !state_get("fought_dummy",0)
        {
            dialogue_start([
            "* Hello! I am the only mannequin that's actually alive here.",
            "* You should thank the heavens you're not the type to fight dummies.",
            "* I'm very powerful, you see."
        ])
        }
        else {
        	dialogue_start([
            "* Hello! I am the only mannequin that's actually alive here.",
            "* You should thank the heavens you didn't have to fight me!",
            "* That would've been a very quick battle.{mini(I am very powerful.,none)}"
        ])
        }
    }
    else {
    	dialogue_start([
            "* Why, yes. I do envy the fancy mannequin."
        ])
    }
    }
    else {
    	dialogue_start("* My, my. That kid just doesn't know when to shut up, does he?")
    }
}