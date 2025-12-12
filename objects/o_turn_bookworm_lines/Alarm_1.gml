var which_side = irandom_range(0,1)
if which_side = 0
{
    var line = instance_create(o_enc_bullet_bookworm_lines, o_enc_box.x-66, o_enc_box.y + random_range(-50,50), 0)
    line.side = 0
}
else {
	var line = instance_create(o_enc_bullet_bookworm_lines, o_enc_box.x+66, o_enc_box.y + random_range(-50,50), 0)
    line.side = 1
}

if enc_enemy_count(true) = 1 alarm[1] = random_range(5,30)
    else alarm[1] = random_range(30,60)