draw_self()
if sprite_index == spr_monika_test_menu
{
    image_xscale = 0.3
    image_yscale = 0.3
}
else {
	image_xscale = 0.2
    image_yscale = 0.2
}
x = xstart + random_range(-2,2)
afterimage(0.075,self,true)
image_angle = random_range(-1,1)