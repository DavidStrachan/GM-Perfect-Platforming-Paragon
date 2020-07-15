/// @description Insert description here
// You can write your code in this editor

// What to follow
move_to_x = obj_player.x + (obj_player.current_h_speed*40)
move_to_y = obj_player.y //+ (obj_player.current_v_speed*30)
if (obj_player.x > 2945) { // different camera movment 
	move_to_y = 500 + (obj_player.y/3) 
	zoom_to = 1.32
} else {
	zoom_to = 1	
}

// clamp the camera (cant get too close to the edge of the screen)
move_to_x = clamp(move_to_x,max_screen_size_x_half*zoom,room_width-(max_screen_size_x_half*zoom))
move_to_y = clamp(move_to_y,max_screen_size_y_half*zoom,room_height-(max_screen_size_y_half*zoom))


if ((x > move_to_x+1 or x < move_to_x-1) or 
	(y > move_to_y+1 or y < move_to_y-1)) {
		
	x += (move_to_x - x)/move_to_speed
	y += (move_to_y - y)/move_to_speed
	
	event_user(0) // this tell the camera to move (its the same as the create event)
}


if (zoom > zoom_to + 0.02 or zoom < zoom_to - 0.02 ) {
		
	zoom += (zoom_to - zoom)/zoom_to_speed

	event_user(0) // this tell the camera to move (its the same as the create event)
}


if (rotation > rotation_to + 0.02 or rotation < rotation_to - 0.02 ) {
		
	rotation += (rotation_to - rotation)/rotation_to_speed

	event_user(0) // this tell the camera to move (its the same as the create event)

}


