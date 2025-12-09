draw_set_font(font_prophecy)
draw_set_halign(fa_center)

if lp > 0
{
    draw_text_transformed_color(160,-2,"LEFTORY\nPRESENTS...",2,2,0,c_white,c_white,c_white,c_white,lp_alpha)
    if lp = 1 and lp_alpha < 1 lp_alpha += 0.01
    if lp = 2 and lp_alpha > 0 lp_alpha -= 0.01
}