sprite_index = item_spr[item_type];


if(place_meeting(x,y,obj_player)){
	ds_list_add(global.inv, item_type);
	instance_destroy();
}

if(!tile_ver_collision(1)){
	y += 2;
}

if(hsp != 0){
	hsp -= 0.2 * sign(hsp);
}

x+= hsp;