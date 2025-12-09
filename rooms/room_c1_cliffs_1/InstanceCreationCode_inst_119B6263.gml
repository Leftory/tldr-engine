interaction_code = function(){
    if get_leader().dir = DIR.DOWN
    {
        dialogue_start([
            "* (There's an inscription behind the fountain...)",
            "* (It's mostly worn away, but you can make out a fragment.)",
            "{col(c_grey)}* ... and may its hand drift forward, blurring the line between LIGHT and DARK..."
        ])
    }
}