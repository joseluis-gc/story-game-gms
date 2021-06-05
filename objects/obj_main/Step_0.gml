/// @description Insert description here
// You can write your code in this editor

layer_x(layer_city, camera_get_view_x(view_camera)/8);
layer_x(layer_sky, camera_get_view_x(view_camera)/2);

if (keyboard_check(vk_escape)){
	global.pause = !global.pause;
	
	//if pause
	if (global.pause){
		//darken screen
		instance_create_layer(0,0,btn_layer, obj_dark);
		
		//buttons
		var w = 0;
		var h = 0;
		
		var margin = 32;
		var size = 16;
		var dist = 4;
		
		for( var i=0; i < ds_list_size(global.inv); i++){
			//create buttons
			var _x = margin + (w*(size+dist));
			var _y = margin + (h*(size+dist));
			var _camx = camera_get_view_x(view_camera);
			var _camy = camera_get_view_y(view_camera);
			var btn = instance_create_layer(_camx + _x, _camy + _y, btn_layer, obj_button);
			
			btn.item_id = i;
			btn.item_type = global.inv[| i];
			
			//placement
			w++;
			
			var _w = display_get_gui_width();
			if(w*(size+dist) > _w - margin*2){
				w = 0;
				h++;
			}
		}
	}
	
	
	//if resumed
	else{
		instance_destroy(obj_button);
		instance_destroy(obj_dark);
	}
}