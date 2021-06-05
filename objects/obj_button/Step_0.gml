/// @description Insert description here
// You can write your code in this editor
if(position_meeting(mouse_x, mouse_y, id)){
	image_index = 1;
}

if(mouse_check_button_pressed(mb_left)){
	//remove from ds list
	ds_list_delete(global.inv, item_id);
	
	//item effect
	switch(item_type){
		case item.diamond:
			coins += 10;
		break;
		
		case item.pizza:
			lives +=1;
		break;	
	
		case item.potion:
			lives += 1;
		break;
	}
	
	instance_destroy(obj_button);
	instance_destroy(obj_dark);
	global.pause = false;
	
}
else{
	image_index = 0;
}