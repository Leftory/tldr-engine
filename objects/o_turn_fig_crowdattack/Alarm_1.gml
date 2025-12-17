inst = instance_find(o_enc_bullet_fig_crowdattack, irandom(instance_number(o_enc_bullet_fig_crowdattack) - 1))
if inst.jump = 0
{
    inst.jump = 1
}
else {
	alarm[1] = 1
}

if enc_enemy_count(true) = 1 alarm[1] = random_range(5,45)
    else alarm[1] = random_range(10,90)