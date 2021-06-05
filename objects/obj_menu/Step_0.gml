/// @description Insert description here
// You can write your code in this editor
menu_selected += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

var array_size = array_length_1d(menu_items);


if(menu_selected >= array_size){
	menu_selected = 0;
}

if(menu_selected < 0){
	menu_selected = array_size - 1;
}

//input

if(keyboard_check_pressed(vk_enter)){
	switch(menu_selected){
		
		case 0: 
			room_goto_next();
		break;
		
		case 1:
			game_end();
		break;	
		
		
	}
}