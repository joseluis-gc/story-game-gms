/// @description Insert description here
// You can write your code in this editor
var draw_x = 8;
var draw_y = 8;

var h_dist = 20;

for(var i = 0; i < lives; i++){
	draw_sprite(spr_life, 0, draw_x + (i*h_dist), draw_y);
}


//gui coins
draw_set_font(Font_Gui);

var _w = display_get_gui_width();

draw_sprite(spr_coin,0,_w -draw_x, draw_y + 7);

draw_set_halign(fa_right);
draw_text(_w - draw_x*2, draw_y, coins);
draw_set_halign(fa_left);