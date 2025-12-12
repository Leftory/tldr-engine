function enemy_recruit(data = {progress: 0}) constructor {
    progress     = data.progress
    need         = 2
    
    name         = "Test"
    desc         = "Description"
    sprite       = spr_default
    spr_speed    = 1
    bgcolor      = c_gray
    chapter      = 0
    
    level        = 0
    element      = "NONE:DEBUG"
    like         = "(None)"
    dislike      = "(None)"
    attack       = 0
    defense      = 0
    
    _data = data
    _prepare_for_export = function() {
        _data = {
            progress: progress
        }
    }
}

function enemy_recruit_virovirokun(data = {progress: 0}) : enemy_recruit(data) constructor {
    need         = 4
    
    sprite       = spr_e_virovirokun_idle
    bgcolor      = c_aqua
    chapter      = 2
    
    level        = 7
    attack       = 8
    defense      = 6
    
    recruit_localize("enemy_virovirokun_recruit")
}
function enemy_recruit_killercar(data = {progress: 0}) : enemy_recruit(data) constructor {
    need         = 1
    
    sprite       = spr_e_killercar
    bgcolor      = c_orange
    chapter      = 6
    
    level        = 12
    attack       = 11
    defense      = 7
    
    name         = "Killer Car"
    desc         = "A dangerous beast of the land of Heretics. Found in tribes, and is usually the one leading them."
    element      = "POWER:COOL"
    like         = "HANGING WITH THE COOL KIDS"
    dislike      = "YOU"
}

function enemy_recruit_fig(data = {progress: 0}) : enemy_recruit(data) constructor {
    need         = 5
    
    sprite       = spr_fig
    bgcolor      = #00AEF0
    chapter      = 1
    
    level        = 1
    attack       = 1
    defense      = 1
    
    name         = "Fig"
    desc         = "An insecure crowder."
    element      = "ACTION:PEOPLE"
    like         = "Standing out"
    dislike      = "Fitting in"
}
function enemy_recruit_bookworm(data = {progress: 0}) : enemy_recruit(data) constructor {
    need         = 3
    
    sprite       = spr_bookworm
    bgcolor      = c_orange
    chapter      = 1
    
    level        = 1
    attack       = 1
    defense      = 2
    
    name         = "Bookworm"
    desc         = "A nerdy worm that loves studying and is very academically successful."
    element      = "BOOK:BUG"
    like         = "The Norm"
    dislike      = "Cheaters"
}