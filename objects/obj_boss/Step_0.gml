if(global.pause){
	exit;
}


switch(state){

	case st.normal:
	
		sprite_index = Sprite45;
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
		
		
		if(tile_ver_collision(1)){
			//flip image
			image_xscale = sign(hsp);
	
			x += hsp;
		}
		
		//hurt
		if(place_meeting(x,y,obj_player) && obj_player.state == st.attack){
			kb_x = sign(x - obj_player.x - 20);
			image_xscale = -kb_x;
			hp--;
			state_set(st.hurt);
		}
		
		
		//my hurt on jump bora
		if(place_meeting(x,y,obj_player) && obj_player.vsp > 0){
			kb_x = sign(x - obj_player.x);
			image_xscale = -kb_x;
			obj_player.vsp -= 20;
			hp--;
			state_set(st.hurt);
		}
		
		
		
		
		//dead
		
		if(hp <= 0){
			state_set(st.dead);
		}
		
		//move faster
		if(hp <= 4){
			move_speed = 4;
		}
		
		
	break;
	
	case st.hurt:
	 
		//instance_destroy();
		sprite_index = spr_boss_hurt;
		x += kb_x * kb_speed;
		
		//hurt time
		hurt_time++;
		if(hurt_time > 4 || tile_hor_collision(kb_x * kb_speed)){
			state_set(st.angry);
			
			//face player
			hsp = abs(hsp) * sign(obj_player.x - x);
			
			
			hurt_time = 0;
		}
		
	
	
	break;
	
	
	case st.angry:
		x += hsp * 2;
		
		//walls
		if(tile_hor_collision(hsp)){
			//hsp = -hsp;
			state_set(st.normal);
		}
		
		//ledge
		if(!tilemap_get_at_pixel(global.tilemap, x + hsp, y + 24)){
			state_set(st.normal);
		}
		
	break;

	case st.dead:
	
		sprite_index = spr_boss_hurt;

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

}
