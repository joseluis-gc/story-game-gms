/// @description Insert description here
// You can write your code in this editor
switch (state)
{
	case st.normal:
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
		
	break;
}