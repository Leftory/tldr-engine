inst = instance_find(o_enc_bullet_fig_stomp, irandom(instance_number(o_enc_bullet_fig_stomp) - 1))
if inst.stomp = 0
{
    inst.stomp = 1
}
else {
	alarm[1] = 1
}

if enc_enemy_count(true) = 1 alarm[1] = random_range(10,50)
    else alarm[1] = random_range(20,100)