if side = 0
{
    x ++
}
else {
	x --
}

if x < o_enc_box.x - 66 or x > o_enc_box.x + 66
{
    instance_destroy()
}
