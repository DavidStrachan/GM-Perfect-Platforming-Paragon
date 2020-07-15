/// @description Insert description here
// You can write your code in this editor

animate_frame += animate_direction
if (animate_frame > animate_frames) {
	animate_direction = 0
}
if (animate_frame < 0) {
	instance_destroy()
}

if	(keyboard_check_pressed(vk_anykey) or 
	(mouse_x > 1 and mouse_y > 1 and mouse_check_button(mb_any))) {
	animate_direction = -5
}
