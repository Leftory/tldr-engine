if interacted = 0
{
if text != "" 
	inst = dialogue_start(text)
}
else {
	if text2 != "" 
	inst = dialogue_start(text2)
}
	
audio_play(snd_heal) 
started = true