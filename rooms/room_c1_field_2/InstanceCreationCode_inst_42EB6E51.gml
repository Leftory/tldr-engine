win_code = function(){
    screen_shake(10,10)
    audio_play(snd_screenshake)
    instance_destroy(inst_gate_field_1)
}

start_code = function() {
    instance_destroy(inst_gate_field_1)
}