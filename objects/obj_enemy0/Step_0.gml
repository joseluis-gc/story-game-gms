switch(state){

	case st.normal:
	
		sprite_index = Sprite15;
		//for falls
		if(!tile_ver_collision(1)){
			y+= 1;
		}
		
		//walls
		if(tile_hor_collision(hsp)){
			hsp = -hsp;
		}
		
		//ledge
		if(!tilemap_get_at_pixel(global.tilemap, x + hsp, y + 24)){
			hsp = -hsp;
		}
		
		
		//if(tile_ver_collision(1)){
			//flip image
			image_xscale = sign(hsp);
	
			x += hsp;
		//}
		
		//hurt
		if(place_meeting(x,y,obj_player) && obj_player.state == st.attack){
			kb_x = sign(x - obj_player.x);
			image_xscale = -kb_x;
			hp--;
			state_set(st.hurt);
		}
		
		//dead
		
		if(hp <= 0){
			state_set(st.dead);
		}
		
		
	break;
	
	case st.hurt:
	 
		//instance_destroy();
		sprite_index = dino_hurt;
		x += kb_x * kb_speed;
		
		//hurt time
		hurt_time++;
		if(hurt_time > 4 || tile_hor_collision(kb_x * kb_speed)){
			state_set(st.normal);
			hurt_time = 0;
		}
		
	
	
	break;

	case st.dead:
	
		sprite_index = dino_hurt;
		if(floor(image_index) == image_number - 1){
			instance_destroy();
		}
	
	break;

}
