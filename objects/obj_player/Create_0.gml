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

//camera
view_enabled = true;
view_visible[0] = true;

var width = 480, height = 270, scale = 2;

var cam = camera_create_view(0, 0, width, height, 0, obj_player, -1, -1, width/2, height/2);

view_set_camera(0, cam);

window_set_size(width*scale, height*scale);
surface_resize(application_surface, width*scale, height*scale);