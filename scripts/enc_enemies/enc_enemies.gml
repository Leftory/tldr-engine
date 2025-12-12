function enemy() constructor {
	// base info
	name = "Test"
	obj = {
		obj: o_actor_e,
		var_struct: {
			s_hurt: spr_e_virovirokun_hurt,
			s_spared: spr_e_virovirokun_spare,
            s_unspare: spr_e_virovirokun_hurt,
            carrying_money: 10
		},
	}
	
	// stats
	hp =		170
	max_hp =	170
	attack =	0
	defense =	0
	status_effect = ""
	
	mercy =	0
	tired =	false
    can_spare = true
    
    unspare = 0
    
    dlg = 0
    
	// acts
	acts = [
		{
			name:	loc("enc_act_check"),
			party:	[],
			desc:	-1,
			exec:	function(enemy_slot, user_index){
				encounter_scene_dialogue("* Empty CHECK text.")
			}
		},
	]
	acts_special = {
	}
	acts_special_desc = loc("enc_ui_label_standard")
	
	// text
	dialogue =				"Test" // can be a function (can accept slot argument as arg0)
	dia_bubble_offset =		[0, 0, 0] // x, y, relative to (1 for enemy and 0 for default box pos)
	dia_bubble_sprites =	[spr_ui_enc_dialogue_box, spr_ui_enc_dialogue_spike]
	
	turn_object = o_turn_default
	
    // misc
    freezable = false
    defeat_marker = 0 // marker id
    
	// misc (in-fight events)
    ev_pre_dialogue =   -1
	ev_dialogue =	    -1
	ev_turn =	  	    -1
    ev_turn_start =     -1
	ev_post_turn =	    function(){
        dlg = 0
        o_enc.current_turn ++
    }
    ev_win =            -1
	
	//recruit
	recruit = new enemy_recruit()
	
	//system
	actor_id =	-1
	slot =		-1
}

function enemy_virovirokun() : enemy() constructor{
	name = loc("enemy_virovirokun_name")
	obj = o_actor_e_virovirokun
	
	// stats
	hp =		240
	max_hp =	240
	attack =	8
	defense =	0
	status_effect = ""
    freezable = true
    
    mercy = 100
	
	// acts
	acts = [
		{
			name: loc("enc_act_check"),
			party: [],
			desc: -1,
			exec: function() {
				encounter_scene_dialogue(loc("enemy_virovirokun_act_check"))
			}
		},
		{
			name: loc("enemy_virovirokun_act_takecare"),
			party: [],
			desc: -1,
			tp_cost: 0,
			exec: function(slot, user) {
				cutscene_create()
				cutscene_set_variable(o_enc, "waiting", true)
				
				cutscene_func(enc_sparepercent_enemy, [slot, 100])
				cutscene_func(function(user) {
					var name = global.party_names[user]
					var o = party_get_inst(name)
					o.sprite_index = asset_get_index($"spr_b{name}_nurse")
					
					var inst = afterimage(.03,o)
					inst.speed = 1
					inst = afterimage(.04, o)
					inst.speed = 2
					
					var a = create_anime(0.5)
					.add(1, 4, "linear")
					.add(0, 6, "linear")
					.start(function(v, o) {
						o.flash = v
					}, o)
				}, user)
				
				cutscene_dialogue(loc("enemy_virovirokun_act_takecare_msg"))
				
				cutscene_set_variable(o_enc, "waiting", false)
				cutscene_play()
			}
		},
		{
			name: loc("enemy_virovirokun_act_takecarex"),
			party: -1,
			desc: -1,
			tp_cost: 0,
			exec: function(slot, user) {
				cutscene_create()
				cutscene_set_variable(o_enc, "waiting", true)
				
				cutscene_func(function(user) {
					for (var i = 0; i < array_length(global.party_names); ++i) {
					    var name = global.party_names[i]
						var o = party_get_inst(name)
						o.sprite_index = asset_get_index($"spr_b{name}_nurse")
						o.image_speed = 0
						o.image_index = irandom(sprite_get_number(o.sprite_index)-1)
						
						var inst = afterimage(.03, o)
						inst.speed = 1
						inst = afterimage(.04, o)
						inst.speed = 2
						
						var a = create_anime(.5)
						.add(1, 4, "linear")
						.add(0, 6, "linear")
						.start(function(v, o) {
							o.flash = v
						}, o)
					}
					for (var i = 0; i < array_length(o_enc.encounter_data.enemies); ++i) {
						if enc_enemy_isfighting(i) {
							if is_instanceof(o_enc.encounter_data.enemies[i], enemy_virovirokun)
								enc_sparepercent_enemy(i, 100)
							else 
								enc_sparepercent_enemy(i, 50)
						}
					}
				}, user)
				cutscene_dialogue(loc("enemy_virovirokun_act_takecarex_msg"))
				
				cutscene_set_variable(o_enc, "waiting", false)
				cutscene_play()
			}
		},
	]
	acts_special = {
		susie: {
			exec: function(slot){
				enc_sparepercent_enemy(slot, 50)
				encounter_scene_dialogue(loc("enemy_virovirokun_act_susie"))
			},
		},
		ralsei: {
			exec: function(slot){
				enc_sparepercent_enemy(slot, 50)
				encounter_scene_dialogue(loc("enemy_virovirokun_act_ralsei"))
			},
		},
		noelle: {
			exec: function(slot) {
				enc_sparepercent_enemy(slot, 50)
				encounter_scene_dialogue(loc("enemy_virovirokun_act_noelle"))
			},
		},
	}
	
	// recruit
    recruit = new enemy_recruit_virovirokun()
		
	// text
	dialogue = function(slot) {
		if self.mercy >= 100 
			return array_shuffle(loc("enemy_virovirokun_mercy"))[0]
		return array_shuffle(loc("enemy_virovirokun_dialogue"))[0]
	}
}

function enemy_killercar() : enemy() constructor{
	name = "Killer Car"
	
	obj = {
        obj: o_actor_e_killercar,
        var_struct: {
            s_hurt: spr_e_killercar_hurt,
            s_spared: spr_e_killercar_hurt,
        }
    }
	tired = true
	defense = 0
    can_spare = false
    turn_object = o_ex_turn_complex_box
    
    hp = 600
    max_hp = 600
	
	acts = [
		{
			name: "Check",
			party: [],
			desc: -1,
			exec: function() {
				encounter_scene_dialogue("* Killer Car - As dangerous as it gets. Be prepared for torment.")
			}
		},
		{
			name: "Susie's Idea",
			party: ["susie"],
			desc: "Fatal",
			exec: function(slot, user) {
				cutscene_create()
				cutscene_set_variable(o_enc, "waiting", true)
				
				cutscene_dialogue([
					"{char(susie, 21)}* I have an idea.",
				])
				cutscene_set_partysprite(party_getpos("susie"), "spell")
				cutscene_sleep(30)
				cutscene_func(enc_hurt_enemy, [slot, 100 * party_getdata("susie", "attack") * party_getdata("susie", "magic"), user, snd_damage, 0, 0, true])
				cutscene_sleep(30)
				
				cutscene_set_variable(o_enc, "waiting", false)
				cutscene_play()
				
			}
		},
	]
	
	act_desc = array_create(array_length(acts), -1)
	act_desc[1] = "Kill Em with Ralsei"
    
    my_inst_almond = noone
    ev_post_turn = method(self, function() {
        if hp > max_hp/1.5
            return false
        
        o_enc.waiting = true
        
        cutscene_create()
        cutscene_sleep(10)
        cutscene_dialogue([
            "* Killer Car felt like it needed to aura-farm a bit.",
            "{can_skip(false)}* Killer Car practiced self-care!{s(30)}"
        ],, false)
        cutscene_wait_dialogue_boxes(1)
        
        cutscene_func(method(self, function(__enemy) {
            var inst = instance_create(o_dummy, __enemy.x - 50, __enemy.y - __enemy.myheight/2, __enemy.depth - 50, {
                sprite_index: spr_ex_almond_milk
            })
            do_animate(2.5, 1, 10, "linear", inst, "image_xscale")
            do_animate(2.5, 1, 10, "linear", inst, "image_yscale")
            do_animate(0, 1, 10, "linear", inst, "image_alpha")
            
            my_inst_almond = inst
        }), [actor_id])
        cutscene_sleep(15)
        
        cutscene_func(method(self, function(__enemy) {
            do_animate(my_inst_almond.x, __enemy.x, 10, "cubic_in", my_inst_almond, "x")
            do_animate(1, 0, 10, "cubic_in", my_inst_almond, "image_alpha")
        }), [actor_id])
        cutscene_sleep(10)
        
        cutscene_func(method(self, function(__enemy, callback) {
            instance_destroy(my_inst_almond)
            instance_create(o_eff_healeffect,,,, {
                target: __enemy
            })
            
            callback()
        }), [
                actor_id, 
                method(self, function() {
                    hp += 300
                })
            ]
        )
        cutscene_animate(0, 1, 3, "linear", actor_id, "flash")
        cutscene_sleep(3)
        
        cutscene_audio_play(snd_heal)
        cutscene_func(function(o) {
            instance_create(o_text_hpchange, o.x, o.y - o.myheight/2, o.depth-100, {
				draw: 300, 
				mode: 0
			})
        }, [actor_id])
        cutscene_animate(1, 0, 10, "linear", actor_id, "flash")
        
        cutscene_wait_dialogue_finish()
        cutscene_set_variable(o_enc, "waiting", false)
        cutscene_play()
    })
    
    recruit = new enemy_recruit_killercar()
}

function enemy_dummy() : enemy() constructor{
	name = "Dummy"
	obj = o_actor_e_dummy
	
	// stats
	hp =		100
	max_hp =	100
	attack =	0
	defense =	1
	status_effect = ""
    freezable = true
    
    mercy = 0
	
	// acts
	acts = [
		{
			name: loc("enc_act_check"),
			party: [],
			desc: "Useless analysis",
			exec: function() {
				encounter_scene_dialogue("* DUMMY - 0 ATK 1 DEF{br}{resetx}* ... It's a dummy.")
			}
		},
		{
			name: "\"ACT\"",
			party: [],
			desc: "... It's an ACT!",
			tp_cost: 0,
			exec: function(slot, user) {
				cutscene_create()
				cutscene_set_variable(o_enc, "waiting", true)
				
				cutscene_func(enc_sparepercent_enemy, [slot, 100])
				
				cutscene_dialogue("* ... You \"ACT\"ed!{br}{resetx}* It was highly effective!")
				
				cutscene_set_variable(o_enc, "waiting", false)
				cutscene_play()
			}
		},
		{
			name: "ACT with Gary",
			party: ["gary"],
			desc: "Not available",
			tp_cost: 0,
			exec: function(slot, user) {
				cutscene_create()
				cutscene_set_variable(o_enc, "waiting", true)
				
				cutscene_func(function(user) {
					for (var i = 0; i < array_length(o_enc.encounter_data.enemies); ++i) {
						if enc_enemy_isfighting(i) {
							if is_instanceof(o_enc.encounter_data.enemies[i], enemy_virovirokun)
								enc_sparepercent_enemy(i, 100)
							else 
								enc_sparepercent_enemy(i, 50)
						}
					}
				}, user)
				cutscene_dialogue(loc("enemy_virovirokun_act_takecarex_msg"))
				
				cutscene_set_variable(o_enc, "waiting", false)
				cutscene_play()
			}
		},
	]
	
	
	// recruit
    recruit = noone
		
	// text
	dialogue = function(slot) {
		if self.mercy >= 100 
			return array_shuffle([
                "..."
            ])[0]
		return array_shuffle([
            "..."
        ])[0]
	}
}

function enemy_fig() : enemy() constructor{
	name = "Fig"
	obj = o_actor_e_fig
	
	// stats
	hp =		100
	max_hp =	100
	attack =	1
	defense =	1
	status_effect = ""
    freezable = true
    
    mercy = 0
    
    turn_object = o_turn_fig_crowdattack
	
	// acts
	acts = [
		{
			name: loc("enc_act_check"),
			party: [],
			desc: "Useless analysis",
			exec: function(slot,user) {
				if o_enc.encounter_data.enemies[slot].unspare < 100
                {
                    encounter_scene_dialogue($"* FIG - {o_enc.encounter_data.enemies[slot].attack} ATK {o_enc.encounter_data.enemies[slot].defense} DEF {o_enc.encounter_data.enemies[slot].max_hp}"+" HP{br}{resetx}* They blend into crowds very easily and are very insecure.")
                }
                else {
                	encounter_scene_dialogue($"* FIG - {o_enc.encounter_data.enemies[slot].attack} ATK {o_enc.encounter_data.enemies[slot].defense} DEF {o_enc.encounter_data.enemies[slot].max_hp}"+" HP{br}{resetx}* You made fun of their insecurity. Are you happy?")
                }
			}
		},
		{
			name: "Compliment",
			party: [],
			desc: "Gives MERCY",
			tp_cost: 0,
			exec: method(self, function(slot, user) {
				cutscene_create()
				cutscene_set_variable(o_enc, "waiting", true)
				cutscene_dialogue(array_shuffle([
                "* You told Fig they stand out from the crowd.",
                "* You told Fig they're very unique.",
                "* You told Fig they're irreplaceable."
            ])[0])
                
                cutscene_func(method(self,function(slot, user){
                    if o_enc.encounter_data.enemies[slot].unspare < 100
                    {
                        if o_enc.encounter_data.enemies[slot].mercy < 100 {
                        enc_sparepercent_enemy(slot, 100)
                        cutscene_create()
                        cutscene_dialogue("* They were flattered!")
                        cutscene_set_variable(o_enc, "waiting", false)
                        o_enc.encounter_data.enemies[slot].dlg = 1
                        cutscene_play()
                        }
                        else {
                        	cutscene_create()
                        cutscene_dialogue("* They found it a bit insincere, but they'll still allow you to SPARE them.")
                        cutscene_set_variable(o_enc, "waiting", false)
                        o_enc.encounter_data.enemies[slot].dlg = 2
                        cutscene_play()
                        }
                    }
                    else {
                    	cutscene_create()
                        cutscene_func(function(slot,user){
                            if o_enc.encounter_data.enemies[slot].attack < 4
                            {
                                cutscene_create()
                                o_enc.encounter_data.enemies[slot].attack ++
                        cutscene_dialogue("* ... but they found it insincere!{br}{resetx}* Their ATTACK went up!")
                        cutscene_set_variable(o_enc, "waiting", false)
                        o_enc.encounter_data.enemies[slot].dlg = 5
                                cutscene_play()
                            }
                            else if o_enc.encounter_data.enemies[slot].attack = 4 {
                            	cutscene_create()
                                o_enc.encounter_data.enemies[slot].attack ++
                        cutscene_dialogue("* ... but they found it insincere!{br}{resetx}* Their ATTACK went up!")
                        cutscene_set_variable(o_enc, "waiting", false)
                        o_enc.encounter_data.enemies[slot].dlg = 7
                                cutscene_play()
                            }
                            else if o_enc.encounter_data.enemies[slot].attack > 4 {
                            	cutscene_create()
                        cutscene_dialogue("* ... but they don't even care anymore!")
                        cutscene_set_variable(o_enc, "waiting", false)
                        o_enc.encounter_data.enemies[slot].dlg = 6
                                cutscene_play()
                            }
                        },[slot,user])
                        cutscene_play()
                    }
                }), [slot, user]) 
				cutscene_play()
			})
		},
        {
			name: "Mock",
			party: [],
			desc: "Gives UNSPARE",
			tp_cost: 0,
			exec: function(slot, user) {
				cutscene_create()
                var txt_c = ""
                
                cutscene_func(function(){
                    if irandom_range(1,10) > 1
                    {
                        cutscene_create()
                        cutscene_dialogue(array_shuffle([
                "* You told Fig you can't tell them apart from the crowd.",
                "* You told Fig they're the opposite of unique.",
                "* You told Fig they're replaceable."
            ])[0])
                        cutscene_play()
                    }
                    else {
                    	cutscene_create()
                        cutscene_dialogue("* You told Fig they're a freak, and you don't have time for freaks.")
                        cutscene_play()
                    }
                })
				cutscene_set_variable(o_enc, "waiting", true)
                cutscene_sleep(2)
                cutscene_wait_dialogue_finish()
                cutscene_func(function(slot, user){
                    if o_enc.encounter_data.enemies[slot].unspare < 100
                    {
                        if o_enc.encounter_data.enemies[slot].mercy < 100 {
                            cutscene_create()
                            cutscene_func(enc_unsparepercent_enemy, [slot, 100])
                
                        cutscene_dialogue("* They were angered!{br}{resetx}* They are now UNSPAREABLE!")
                
                        o_enc.encounter_data.enemies[slot].dlg = 3
				
				        cutscene_set_variable(o_enc, "waiting", false)
                        cutscene_play()
                        }
                        else {
                        	cutscene_create()
                        cutscene_func(enc_unsparepercent_enemy, [slot, 100])
                
                cutscene_dialogue("* They felt betrayed!{br}{resetx}* They are now UNSPAREABLE!")
                
                o_enc.encounter_data.enemies[slot].dlg = 4
				
				cutscene_set_variable(o_enc, "waiting", false)
                        cutscene_play()
                        }
                    }
                    else {
                    	cutscene_create()
                        cutscene_dialogue("* ... but they already hate your guts.")
                        cutscene_set_variable(o_enc, "waiting", false)
                        o_enc.encounter_data.enemies[slot].dlg = 6
                        cutscene_play()
                    }
                }, [slot, user])
				cutscene_play()
			}
		},
	]
	
	
	// recruit
    recruit = new enemy_recruit_fig()
    
	// dialogue
	dialogue = function(slot) {
		if dlg = 0  // idle
			return array_shuffle([
            "I stand out!{br}I stand out!",
            "I'm not like other guys!",
            "I'm nothing{br}like you all!"
            ])[0]
        if dlg = 1 // compliment
            return array_shuffle([
            "Thanks! I think I really needed to hear that."
            ])[0]
        if dlg = 2 // compliment more than once
            return array_shuffle([
            "Uh... I don't know, man."
            ])[0]
        if dlg = 3 // mock
            return array_shuffle([
            "You...!"
            ])[0]
        if dlg = 4 // mock after compliment
            return array_shuffle([
            "I feel so betrayed!"
            ])[0]
        if dlg = 5 // compliment after mock
            return array_shuffle([
            "Like THAT'd work on me."
            ])[0]
        if dlg = 6 // mock more than once
            return array_shuffle([
            "I don't even care anymore."
            ])[0]
		if dlg = 7 // attack = 5
            return array_shuffle([
            "ULTIMATE ATTACK!"
            ])[0]
	}
}

function enemy_bookworm() : enemy() constructor{
	name = "Bookworm"
	obj = o_actor_e_bookworm
	
	// stats
	hp =		60
	max_hp =	60
	attack =	1
	defense =	2
	status_effect = ""
    freezable = true
    
    mercy = 0
    
    turn_object = o_turn_bookworm_lines
	
	// acts
	acts = [
		{
			name: loc("enc_act_check"),
			party: [],
			desc: "Useless analysis",
			exec: function(slot,user) {
				if o_enc.encounter_data.enemies[slot].unspare < 100
                {
                    encounter_scene_dialogue($"* BOOKWORM - {o_enc.encounter_data.enemies[slot].attack} ATK {o_enc.encounter_data.enemies[slot].defense} DEF {o_enc.encounter_data.enemies[slot].max_hp}"+" HP{br}{resetx}* Loves studying, hates cheaters.")
                }
                else {
                	encounter_scene_dialogue($"* BOOKWORM - {o_enc.encounter_data.enemies[slot].attack} ATK {o_enc.encounter_data.enemies[slot].defense} DEF {o_enc.encounter_data.enemies[slot].max_hp}"+" HP{br}{resetx}* Loves studying, hates you.")
                }
			}
		},
		{
			name: "Study",
			party: [],
			desc: "Gives MERCY",
			tp_cost: 0,
			exec: method(self, function(slot, user) {
				cutscene_create()
				cutscene_set_variable(o_enc, "waiting", true)
				cutscene_dialogue(array_shuffle([
                "* You studied hard with Bookworm.",
                "* You reviewed some subjects with Bookworm."
            ])[0])
                
                cutscene_func(method(self,function(slot, user){
                    if o_enc.encounter_data.enemies[slot].unspare < 100
                    {
                        if o_enc.encounter_data.enemies[slot].mercy < 100 {
                        enc_sparepercent_enemy(slot, 100)
                            switch(slot)
                            {
                                case 0:
                                {
                                    enc_tire_enemy(1)
                                    enc_tire_enemy(2)
                                    break
                                }
                                    case 1:
                                    {
                                        enc_tire_enemy(0)
                                        enc_tire_enemy(2)
                                        break
                                }
                                        case 2:
                                        {
                                            enc_tire_enemy(0)
                                            enc_tire_enemy(1)
                                        }
                            }
                        cutscene_create()
                        cutscene_dialogue("* It was satisfied!{br}{resetx}* Everyone else became TIRED!")
                        cutscene_set_variable(o_enc, "waiting", false)
                        o_enc.encounter_data.enemies[slot].dlg = 1
                        cutscene_play()
                        }
                        else if o_enc.encounter_data.enemies[slot].tired = false {
                        	cutscene_create()
                        cutscene_dialogue("* All this hard work made it TIRED!")
                        cutscene_set_variable(o_enc, "waiting", false)
                        o_enc.encounter_data.enemies[slot].dlg = 2
                        cutscene_play()
                        }
                        else {
                        	cutscene_create()
                        cutscene_dialogue("* It's amazed by your hard work, and also very sleepy.")
                        cutscene_set_variable(o_enc, "waiting", false)
                        o_enc.encounter_data.enemies[slot].dlg = 3
                        cutscene_play()
                        }
                    }
                    else {
                    	cutscene_create()
                        cutscene_func(function(slot,user){
                            cutscene_create()
                            o_enc.encounter_data.enemies[slot].attack ++
                            cutscene_dialogue("* ... but it knows you're a cheater!")
                            cutscene_set_variable(o_enc, "waiting", false)
                            o_enc.encounter_data.enemies[slot].dlg = 7
                            cutscene_play()
                        },[slot,user])
                        cutscene_play()
                    }
                }), [slot, user]) 
				cutscene_play()
			})
		},
        {
			name: "Cheat",
			party: [],
			desc: "Gives UNSPARE",
			tp_cost: 0,
			exec: function(slot, user) {
				cutscene_create()
                
                cutscene_func(function(){
                    if 1 = 1
                    {
                        cutscene_create()
                        cutscene_dialogue(array_shuffle([
                "* You cheated!"
            ])[0])
                        cutscene_play()
                    }
                    else {
                    	cutscene_create()
                        cutscene_dialogue("* You told Fig they're a freak, and you don't have time for freaks.")
                        cutscene_play()
                    }
                })
				cutscene_set_variable(o_enc, "waiting", true)
                cutscene_sleep(2)
                cutscene_wait_dialogue_finish()
                cutscene_func(function(slot, user){
                    if o_enc.encounter_data.enemies[slot].unspare < 100
                    {
                        if o_enc.encounter_data.enemies[slot].mercy < 100 {
                            cutscene_create()
                            cutscene_func(enc_unsparepercent_enemy, [slot, 100])
                
                        cutscene_dialogue("* Bookworm was very disappointed!{br}{resetx}* They are now UNSPAREABLE!")
                
                        o_enc.encounter_data.enemies[slot].dlg = 4
				
				        cutscene_set_variable(o_enc, "waiting", false)
                        cutscene_play()
                        }
                        else {
                        	cutscene_create()
                        cutscene_func(enc_unsparepercent_enemy, [slot, 100])
                
                cutscene_dialogue("* Bookworm felt betrayed!{br}{resetx}* They are now UNSPAREABLE!")
                
                o_enc.encounter_data.enemies[slot].dlg = 5
				
				cutscene_set_variable(o_enc, "waiting", false)
                        cutscene_play()
                        }
                    }
                    else {
                    	cutscene_create()
                        cutscene_dialogue("* ... but Bookworm already knows you're a cheater.")
                        cutscene_set_variable(o_enc, "waiting", false)
                        o_enc.encounter_data.enemies[slot].dlg = 6
                        cutscene_play()
                    }
                }, [slot, user])
				cutscene_play()
			}
		},
	]
	
	
	// recruit
    recruit = new enemy_recruit_bookworm()
    
	// dialogue
	dialogue = function(slot) {
		if dlg = 0  // idle
			return array_shuffle([
            "Bookworm loves studying.",
            "Bookworm loves winning.",
            "Bookworm loves success."
            ])[0]
        if dlg = 1 // study
            return array_shuffle([
            "Bookworm enjoyed studying with you."
            ])[0]
        if dlg = 2 // study 2
            return array_shuffle([
            "Bookworm is amazed by your hard work. Bookworm is getting sleepy."
            ])[0]
        if dlg = 3 // study 3+
            return array_shuffle([
            "Bookworm... sleepy..."
            ])[0]
        if dlg = 4 // cheat
            return array_shuffle([
            "Bookworm hates cheaters.\nBookworm hates you."
            ])[0]
        if dlg = 5 // cheat after study
            return array_shuffle([
            "Bookworm thought it was friends with you."
            ])[0]
        if dlg = 6 // cheat 2+
            return array_shuffle([
            "Bookworm knows you're a cheater."
            ])[0]
		if dlg = 7 // study after cheat
            return array_shuffle([
            "Bookworm knows."
            ])[0]
	}
}