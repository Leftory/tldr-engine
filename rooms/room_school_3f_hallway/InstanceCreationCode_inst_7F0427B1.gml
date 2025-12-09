trigger_code = function(){
    if !array_contains(global.party_names,"gary")
    {
        dialogue_start([
                "* (Wrong way.)"
            ])
    }
        else {
        	if interacted = 0
            {
                dialogue_start([
                    "{char(gary,0)}* What are you...",
                    "{char(gary,0)}* Oh, I get it.{mini(`No.`,fred,0)}",
                    "{char(gary,0)}* You wanna go to the Art Room, don't you?{mini(`No.`,fred,0)}",
                    "{char(gary,0)}* Hey, I wanna go to the Art Room too. Literally all the time.{mini(`No.`,fred,0)}",
                    "{char(gary,0)}* But right now, it's time to go home.{br}{resetx}* Together.{mini(`NO.`,fred,0)}"
                ])
            }
            else {
            	dialogue_start([
                    "{char(gary,0)}* Wrong way, Fred."
                ])
            }
        }
    get_leader().x += 2
    triggered = false
}