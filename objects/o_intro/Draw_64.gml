draw_sprite_ext(spr_logo,0,320,240,_scale,_scale,0,c_white,_alpha)

if _alpha < 1 and fadeout = 0 _alpha += 0.02
    
if _scale > 1.5 and fadeout = 0 _scale -= 0.01
    
if _alpha == 1 and alarm[0]==-1 and fadeout == 0 alarm[0] = 90
    
if fadeout = 1{
    _alpha -= 0.02
    _scale += 0.01
}