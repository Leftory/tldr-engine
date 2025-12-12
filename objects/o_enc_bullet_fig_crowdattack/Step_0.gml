x --

if x <= o_enc_box.x - 60 instance_destroy()
    
if jump = 1 and jump_buffer = 0
{
    jump_buffer = 1
    jump_timer = random_range(5,70)
    animate(y,y-jump_timer,jump_timer,anime_curve.bounce_in,self,"y")
    animate(1,0.75,jump_timer,anime_curve.bounce_in,self,"image_yscale")
    alarm[1] = jump_timer
    sprite_index = spr_enc_bullet_fig_person_jump
}
