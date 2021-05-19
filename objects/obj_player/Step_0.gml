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
		
		//atack
		if(keyboard_check_pressed(attack_key) && tile_ver_collision(1)){
			state_set(st.attack);
		}
		
		//hurt
		var enemy_col = instance_place(x, y, obj_enemy);
		if(enemy_col != noone){
			kb_x = sign(x - enemy_col.x);
			image_xscale = -kb_x;
			if(image_xscale == 0){
				image_xscale = 1;
			}
			lives --;
			state_set(st.hurt);
		}
		
		if(lives == 0 || y > room_height){
			state_set(st.dead);
		}
		
	break;
	
	
	case st.attack:
		sprite_index = spr_player_attack_strip4;
		mask_index = spr_player_mask_attack;
		
		if(floor(image_index) == image_number - 1){
			state_set(st.normal)
		}
		
	break;
	
	
	case st.hurt:
		sprite_index = spr_player_hurt;
		
		x += kb_x * kb_speed;
		
		hurt_time ++;
		if(hurt_time > 4 || tile_hor_collision(kb_x * kb_speed)){
			state_set(st.normal);
			hurt_time = 0;
		}
		
	break;
	
	
	case st.dead:
		sprite_index = spr_player_dead_strip5;
		
		if(floor(image_index) == image_number - 1){
			image_speed = 0;
			hurt_time++;
			if(hurt_time > 10){
				lives = 3;
				room_restart();
			}
		}
	
	break;
	
}


