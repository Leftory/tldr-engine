interaction_code = function(){
    if get_leader().dir = DIR.DOWN
    {
        dialogue_start("* Um, Jhermstad...?")
        interacted --
    }
    else {
    if interacted = 0
       {
           dialogue_start([
               "* Good evening.",
               "{char(fred,0)}* Hello."
           ])
       }
       else {
       	dialogue_start([
               "* ..."
           ])
       }
}
}