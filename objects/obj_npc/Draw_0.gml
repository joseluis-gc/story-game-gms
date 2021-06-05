if(global.pause){
	exit;
}


draw_self();

draw_set_font(Font_MSG);

if(distance_to_object(obj_player) < 64){
	msg_dynamic_multi(msg, vk_enter);
}else{
	msg_stop();
}
