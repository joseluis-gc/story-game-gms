/// @description Insert description here
// You can write your code in this editor
ini_open("save.ini");

ini_write_real("save", "room", room);
ini_write_real("save", "lives", lives);
ini_write_real("save", "coins", coins);
ini_write_string("save", "inv", ds_list_write(global.inv));

ini_close();