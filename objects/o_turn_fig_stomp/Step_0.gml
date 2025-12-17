event_inherited()

__support_destroy_check()

if instance_exists(o_enc_bullet_fig_stomp) and alarm_buffer = 0
{
    if enc_enemy_count(true) = 1 alarm[1] = random_range(5,45)
        else alarm[1] = random_range(10,90)
    alarm_buffer = 1
}