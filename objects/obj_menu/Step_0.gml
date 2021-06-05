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
		
		case 2:
			ini_open("save.ini");
			
			var load = instance_create_layer(0,0,"Instances", obj_load);
			
			var room_load = ini_read_real("save", "room", menu);
			var lives_load = ini_read_real("save", "lives", 3);
			var coins_load = ini_read_real("save", "coins", 0);
			var load_inv = ini_read_string("save", "inv", "");
			
			room_goto(room_load);
			load.lives_load = lives_load;
			load.coins_load = coins_load;
			load.load_inv = load_inv;
			
			ini_close();
			
			
		break;	
				
		
		
	}
}