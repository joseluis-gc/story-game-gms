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
		if(!tilemap_get_at_pixel(global.tilemap, x + hsp, y + 24)){
			hsp = -hsp;
		}
		
		//flip image
		image_xscale = sign(hsp);
	
		x += hsp;
	break;

}