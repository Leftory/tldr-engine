var inst_cr = instance_create(o_enc_bullet_fig_stomp, o_enc_box.x+50, o_enc_box.y - 35, 0)
var inst_cr2 = instance_create(o_enc_bullet_fig_stomp, o_enc_box.x+90, o_enc_box.y - 35, 0)
inst_cr.att = enemy_struct.attack
inst_cr2.att = enemy_struct.attack

if enc_enemy_count(true) = 1 alarm[2] = 45
    else alarm[2] = 90