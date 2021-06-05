/// @description Insert description here
// You can write your code in this editor
if(!audio_is_playing(background1)){
	audio_play_sound(background1, 10, true);
}


move_speed = 3;
jump_speed = 12;
grav = 1;
attack_key = vk_space;

hsp = 0;
vsp = 0;

//lives = 3;
//coins = 0;

kb_x = 0;
kb_speed = 6;

hurt_time = 0;


//states
enum st
{
	normal,
	attack,
	hurt,
	dead
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



//gui
display_set_gui_size(width, height);




