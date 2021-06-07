/// @description Insert description here
// You can write your code in this editor
if(audio_is_playing(btoads) == false && played == false){
	audio_play_sound(btoads,10,false);
	played = true;
}



if(keyboard_check_pressed(vk_enter)){
	audio_stop_sound(btoads);
	room_goto_next();
}