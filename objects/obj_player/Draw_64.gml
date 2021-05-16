/// @description Insert description here
// You can write your code in this editor
var draw_x = 8;
var draw_y = 8;

var h_dist = 20;

for(var i = 0; i < lives; i++){
	draw_sprite(spr_life, 0, draw_x + (i*h_dist), draw_y);
}