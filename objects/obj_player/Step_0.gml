/// @description Insert description here
// You can write your code in this editor
switch (state)
{
	case st.normal:
	
		//mask
		mask_index = spr_player_mask;
	
		hsp = (keyboard_check(ord("D")) || keyboard_check(vk_right)) - (keyboard_check(ord("A")) || keyboard_check(vk_left));
		hsp *= move_speed;
		
		var jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
		
		
		//jump
		if(jump && tile_ver_collision(1)){
			vsp = -jump_speed;
		}
		
		
		//gravity 
		if(vsp < 10 ){
			vsp += grav;
		}
		
		
		//movement
		if(tile_hor_collision(hsp)){
		
			while(!tile_hor_collision(sign(hsp))){
				x += sign(hsp);
			}
			hsp = 0;
		}
		
		
		if(tile_ver_collision(vsp)){
		
			while(!tile_ver_collision(sign(vsp))){
				y += sign(vsp);
			}
			vsp = 0;
		}
		
		x += hsp;
		y += vsp;
		
		
		if (!tile_ver_collision(1)){
			if (vsp<0) sprite_index = spr_player_jump;
			else sprite_index = spr_player_fall;
		}
		else if (hsp!=0){
			sprite_index = spr_player_move_strip6;
			image_xscale = sign(hsp);
		}
		else{
			sprite_index = spr_player_idle_strip2;
		}
		
		if(keyboard_check_pressed(attack_key) && tile_ver_collision(1)){
			state_set(st.attack);
		}
		
	break;
	
	
	case st.attack:
		sprite_index = spr_player_attack_strip4;
		mask_index = spr_player_mask_attack;
		
		if(floor(image_index) == image_number - 1){
			state_set(st.normal)
		}
		
	break;
}