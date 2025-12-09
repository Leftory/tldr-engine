if !surface_exists(surf) surf = surface_create(640,480)
surface_set_target(surf)
draw_self()
surface_reset_target()
draw_surface(surf,0,0)
surface_free(surf)
y = 120