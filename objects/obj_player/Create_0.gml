/// @description Insert description here
// You can write your code in this editor
move_speed = 4;
jump_speed = 10;
grav = 1;

hsp = 0;
vsp = 0;

//states
enum st
{
	normal,
	attack,
	hurt
}

state = st.normal;

