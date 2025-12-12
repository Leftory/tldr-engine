function enc_set() constructor { // base
	debug_name	=	"undefined"
	enemies	= []
    
	enemies_pos = undefined // x, y, relative (bool) -- if not relative, guipos is added OR just a function
    party_pos = function(i) { // returns [x, y]
        return [
            guipos_x() + 52,
            guipos_y() + 130 - 22*array_length(global.party_names) + i*44,
        ]
    }
    
	flavor = function() { // can also be a string
		var text = "* undefined"
		return text
	}
	bgm = mus_battle
	bg_type = ENC_BG.GRID
    
    can_change_turnlen = true
    enc_var_struct = {}	
    
	display_target = true // whether to display the targets of the enemy's attack
	
	// methods
    _target_calculation = function() { // should return an array of indexes of party members who are targeted
        var __targets = []
        
        for (var i = 0; i < array_length(global.party_names); ++i) {
		    if party_getdata(global.party_names[i], "hp") > 0
				array_push(__targets, global.party_names[i])
		}
        
        return __targets
    }
	_start = function() {
		enc_start(self)
	}
}

function enc_set_ex() : enc_set() constructor {
	debug_name	=	"example"
	enemies = [
		new enemy_virovirokun(),
		new enemy_killercar(),
		new enemy_virovirokun(),
	]
    enemies[0].defeat_marker = 0
    enemies[2].defeat_marker = 1
    
	enemies_pos = [
		[0, 0, true],
		[-20, 0, true]
	]
	
	flavor = "* The test crew is approaching!!"
    
    _target_calculation = function() {
        var __targets = []
        
        for (var i = 0; i < array_length(global.party_names); ++i) {
		    if party_getdata(global.party_names[i], "hp") > 0
				array_push(__targets, global.party_names[i])
		}
        
        return [array_shuffle(__targets)[0]]
    }
}

function enc_set_virovirokun() : enc_set() constructor {
	debug_name	=	"virovirokun"
	enemies = [
		new enemy_virovirokun(),
		new enemy_virovirokun(),
	]
	enemies_pos = [
		[0, 0, true],
		[-20, 0, true]
	]
	flavor = "* Virovirokun floated in!"
}

function enc_set_dummy() : enc_set() constructor {
	debug_name	=	"dummy"
	enemies = [
		new enemy_dummy()
	]
	enemies_pos = [
		[0, 0, true]
	]
	flavor = "* It's a dummy!"
}

function enc_set_1fig() : enc_set() constructor {
	debug_name	=	"1fig"
	enemies = [
		new enemy_fig()
	]
	enemies_pos = [
		[0, 0, true]
	]
	flavor = function(){
        if o_enc.current_turn = 1
        {
            return "* Fig blocks the way!"
        }
        if o_enc.current_turn > 1
        {
            if o_enc.encounter_data.enemies[0].hp < 25
            {
                return "* Fig is dying."
            } 
            else if o_enc.encounter_data.enemies[0].mercy >= 100
           {
                return "* Fig is happy."
           }
            else if o_enc.encounter_data.enemies[0].unspare >= 100 {
           	    return "* Fig is angry."
           }
            else {
           	    return array_shuffle([
                   "* Fig is trying their hardest not to blend in.",
                   "* Smells like a crowd."
               ])[0]
           }
        }
    }
}

function enc_set_1fig_repeat() : enc_set() constructor {
	debug_name	=	"1fig_repeat"
	enemies = [
		new enemy_fig()
	]
	enemies_pos = [
		[0, 0, true]
	]
	flavor = function(){
        if o_enc.current_turn = 1
        {
            return "* A completely different Fig blocks the way!"
        }
        if o_enc.current_turn > 1
        {
            if o_enc.encounter_data.enemies[0].hp < 25
            {
                return "* Fig is dying."
            } 
            else if o_enc.encounter_data.enemies[0].mercy >= 100
           {
                return "* Fig is happy."
           }
            else if o_enc.encounter_data.enemies[0].unspare >= 100 {
           	    return "* Fig is angry."
           }
            else {
           	    return array_shuffle([
                    "* Fig is trying their hardest not to blend in.",
                    "* Smells like a crowd.",
                    "* Fig swears they don't know you."
               ])[0]
           }
        }
    }
}

function enc_set_1fig_1bookworm() : enc_set() constructor {
	debug_name	=	"1fig&1bookworm"
	enemies = [
		new enemy_fig(),
        new enemy_bookworm()
	]
	enemies_pos = [
		[0, 0, true]
	]
	flavor = function(){
        if o_enc.current_turn = 1
        {
            return "* Fig and Bookworm attack you!"
        }
        if o_enc.current_turn > 1
        {
            if enc_enemy_count(true) = 2
            {
                if o_enc.encounter_data.enemies[0].hp < 25 and o_enc.encounter_data.enemies[1].hp >= 15
                {
                    return "* Fig is dying."
                }
                if o_enc.encounter_data.enemies[0].hp >= 25 and o_enc.encounter_data.enemies[1].hp < 15
                {
                    return "* Bookworm is trying to study under pressure."
                }
                if o_enc.encounter_data.enemies[0].hp < 25 and o_enc.encounter_data.enemies[1].hp < 15
                {
                    return "* Fig and Bookworm are not having a good time."
                }
                else if o_enc.encounter_data.enemies[0].mercy >= 100 and o_enc.encounter_data.enemies[1].mercy < 100 
                {
                    return "* Fig is happy."
                }
                else if o_enc.encounter_data.enemies[1].mercy >= 100 and o_enc.encounter_data.enemies[0].mercy < 100 
                {
                    return "* Bookworm is getting good grades."
                }
                else if o_enc.encounter_data.enemies[0].mercy >= 100 and o_enc.encounter_data.enemies[1].mercy >= 100
                {
                    return "* Fig and Bookworm are happy."
                }
                else if o_enc.encounter_data.enemies[0].unspare >= 100 and o_enc.encounter_data.enemies[1].unspare < 100
                {
               	    return "* Fig is angry."
                }
                else if o_enc.encounter_data.enemies[1].unspare >= 100 and o_enc.encounter_data.enemies[0].unspare < 100
                {
                    return "* Bookworm can't forgive a cheater."
                }
                else if o_enc.encounter_data.enemies[0].unspare >= 100 and o_enc.encounter_data.enemies[1].unspare >= 100
                {
                    return "* You've made these two enemies very mad!"
                }
                else {
               	    return array_shuffle([
                        "* Fig is trying their hardest not to blend in.",
                        "* Bookworm can't do anything but study.",
                        "* Smells like a crowd of nerds."
                   ])[0]
               }
            }
            else if o_enc.encounter_data.enemies[0] == new enemy_fig()
            {
                game_end()
            if o_enc.encounter_data.enemies[0].hp < 25
            {
                return "* Fig is dying."
            } 
            else if o_enc.encounter_data.enemies[0].mercy >= 100 
            {
                return "* Fig is happy."
            }
            else if o_enc.encounter_data.enemies[0].unspare >= 100 
            {
           	    return "* Fig is angry."
            }
            else
            {
           	    return array_shuffle([
                   "* Fig is trying their hardest not to blend in.",
                   "* Smells like a crowd."
               ])[0]
            }
            }
        }
    }
}