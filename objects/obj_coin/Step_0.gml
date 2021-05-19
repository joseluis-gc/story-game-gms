if(place_meeting(x,y,obj_player) && !collected){
	coins++;
	image_index = 0;
	collected = true;
	audio_play_sound(snd_coin,10,false);
}

if(collected){
	sprite_index = spr_coin_effect;
	if(floor(image_index) >= image_number -1){
		instance_destroy();
	}
}