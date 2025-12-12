inst = instance_create(o_fig_crowd,x,y)
inst.instance = instance
alarm[0] = 16

for (i = 0;i<50;i++)
{
    if i < 35 {
        inst = instance_create(o_fig_crowd,x-(i*16),y)
        inst.instance = instance
    }
    else {
    	inst = instance_create(o_fig_crowd,x-560+(instance * 20),y-(i*16))
        inst.instance = instance
    }
}