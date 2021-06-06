/// @description Insert description here
// You can write your code in this editor
menu_items[0] = "New Game";
if(file_exists("save.ini")){
	menu_items[1] = "Load Game";
}else{
	menu_items[1] = "No Save Data";
}
menu_items[2] = "Quit";


menu_selected = 0;

draw_set_font(Font_MSG);

played = false;