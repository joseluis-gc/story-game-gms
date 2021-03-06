if(global.pause){
	exit;
}


switch(state){

	case st.normal:
	
		//for falls
		if(!tile_ver_collision(1)){
			y+= 1;
		}
		
		//walls
		if(tile_hor_collision(hsp)){
			hsp = -hsp;
		}
		
		//ledge
		if(!tilemap_get_at_pixel(global.tilemap, x + hsp, y + 96)){
			hsp = -hsp;
		}
		
		//flip image
		image_xscale = sign(hsp);
	
		x += hsp;
		
	
	
		//new
		//hurt
		if(place_meeting(x,y,obj_player) && obj_player.state == st.attack){
			kb_x = sign(x - obj_player.x);
			image_xscale = -kb_x;
			hp--;
			state_set(st.hurt);
		}
		
		
		//my hurt on jump bora
		if(place_meeting(x,y,obj_player) && obj_player.vsp > 0){
			kb_x = sign(x - obj_player.x);
			image_xscale = -kb_x;
			hp--;
			obj_player.vsp -= 20;
			state_set(st.hurt);
		}
		
		
		
		
		//dead
		
		if(hp <= 0){
			state_set(st.dead);
		}
		
		
		//new
		
		
	break;
	
	
	
	//new
	
	case st.hurt:
	 
		//instance_destroy();
		sprite_index = Sprite17Dead;
		x += kb_x * kb_speed;
		
		//hurt time
		hurt_time++;
		if(hurt_time > 4 || tile_hor_collision(kb_x * kb_speed)){
			state_set(st.normal);
			hurt_time = 0;
		}
		
	
	
	break;

	case st.dead:
	
		sprite_index = Sprite17Dead;
		
		
		if(place_meeting(x,y,obj_player)){
			
		}

		if(floor(image_index) == image_number - 1){
			
			//item drop
			if(irandom(1) == 0){
				var _type = irandom(item_num-1);
				
				var _inst = instance_create_layer(x,y,"Instances",obj_item);
				_inst.item_type = _type;
				_inst.hsp = sign(x - obj_player.x);
				
			}
			//item drop end
			
			audio_play_sound(death,10,false);
			instance_destroy();
		}
	
	break;
	
	
	//new end
	
	
	
	
	

}