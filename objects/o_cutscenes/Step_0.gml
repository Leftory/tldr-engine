if instance_exists(get_leader())
{
    player_x = get_leader().x
    player_y = get_leader().y
}


// CHAPTER 1

if room == room_c1_field_3
{
    // Gary equipped Blue Ribbon
    if !instance_exists(o_ui_menu) and item_get_equipped(item_a_blueribbon,"gary") and global.save.PLOT <= 12 and !state_get("gave_gary_ribbon",0)
    {
        state_add("gave_gary_ribbon",0)
        
        cutscene_create()
        cutscene_dialogue([
            "{char(gary,0)}* H-Huh...?",
            "{f_ex(0)}* I'm not Ralsei, Fred.{mini(I'm Spamton!,gary,0)}",
            "{f_ex(0)}* You don't have to equip the ribbon on me.",
            "{char(fred,0)}* You have less HP.{br}{resetx}* It's better this way.",
            "{char(gary,0)}* Awwwwwww, how considerate!{mini(Shut up.,fred,0)}"
        ])
        cutscene_play()
    }
}