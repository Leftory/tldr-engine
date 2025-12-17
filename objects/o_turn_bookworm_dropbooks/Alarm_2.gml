instance_create(o_enc_bullet_bookworm_big, o_enc_box.x, o_enc_box.y - 35, 0)

for (var i = 0;i < 10;i ++)
{
var inst_cr = instance_create(o_enc_bullet_bookworm_books, o_enc_box.x, o_enc_box.y - 45 - (i*7), 0)
inst_cr.att = enemy_struct.attack
}