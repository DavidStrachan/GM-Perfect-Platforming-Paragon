
// TO MOVE THE CAMERA JUST CHANGE THESE:
move_to_x = x
move_to_y = y 
move_to_speed = 28 // higher numbers makes the camera move slower


// TO ZOOM IN/OUT CHANGE THESE:
zoom = 1
zoom_to = 1
zoom_to_speed = 30 // higher number makes the zoom slower

// TO ROATE IN/OUT CHANGE THESE:
rotation = 0
rotation_to = 0
rotation_to_speed = 20 // higher number makes the rotate slower




max_screen_size_x = window_get_width()
max_screen_size_y = window_get_height()
max_screen_size_x_half = max_screen_size_x/2
max_screen_size_y_half = max_screen_size_y/2


// WHERE DO YOU WANT THE CAMERA TO START:
x = max_screen_size_x_half
y = max_screen_size_y_half

camera = camera_create()

event_user(0) // this is so other places can rerun the create event

view_camera[0] = camera




