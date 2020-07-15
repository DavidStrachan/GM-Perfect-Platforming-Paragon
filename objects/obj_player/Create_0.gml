/// @description Insert description here
// You can write your code in this editor




clamp_walk = 10 // maximum walking speed 
clamp_fall_speed = 20

walk_acceleration = 2 // when holding button how fast to get to max speed
walk_decceleration = 1.4 // when no button is held how fast to get to 0

jump_height = 19
jump_early_end = false

current_h_speed = 0 // how fast the player would like to move 
current_v_speed = 0 

fall_speed = 1.2
fall_speed_min = 0.8
fall_speed_max = 1.2

grounded = false
touched_ground_since_last_jump = false

// recording how many frames ago these things happened 
grounded_frames_ago = 999
landed_frames_ago = 999
apex_frames_ago = 999 // 0 if on floor and on way up (only counts on way down)
w_frames_ago = 999
frames_going_down = 999

at_apex = false // this isnt the apex but the top 4th
speed_for_apex = 6 // if they are going slower than this and in the air we call this the apex


enum helper {
	anti_gravity_apex,
	early_fall,
	jump_buffering,
	sticky_feet,
	speedy_apex,
	coyote_jump,
	clamp_fall_speed,
	catch_missed_jump,
	bumped_head_on_corner,
	
	size
}

helper_on = array_create(helper.size)
helper_frame = array_create(helper.size,0)
helper_used = array_create(helper.size,false)

helper_on[helper.anti_gravity_apex]		= true
helper_on[helper.early_fall]			= true
helper_on[helper.jump_buffering]		= true
helper_on[helper.sticky_feet]			= true
helper_on[helper.speedy_apex]			= true
helper_on[helper.coyote_jump]			= true
helper_on[helper.clamp_fall_speed]		= true
helper_on[helper.catch_missed_jump]		= true
helper_on[helper.bumped_head_on_corner] = true

helper_used_all = false 


record_count = 150
record_frame = 0
record_line_x = array_create(record_count,x)
record_line_y = array_create(record_count,y)
record_line_colour = array_create(record_count,c_white)
