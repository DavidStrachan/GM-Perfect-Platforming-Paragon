

#region allow players to turn helpers on/off
if (helper_used_all) {
	if (keyboard_check_pressed(ord("I"))) {
		for (var i = 0; i < helper.size; ++i) {
		    helper_on[i] = false
		}
	} 
	if (keyboard_check_pressed(ord("O"))) {
		for (var i = 0; i < helper.size; ++i) {
		    helper_on[i] = true
		}
	} 
	if (keyboard_check_pressed(ord("P"))) {
		for (var i = 0; i < helper.size; ++i) {
		    helper_on[i] = choose(true,false)
		}
	}
	
	if (keyboard_check_pressed(ord("1"))) {
		if (helper_on[0] == true) {helper_on[0] = false} else {helper_on[0] = true}
	}
	if (keyboard_check_pressed(ord("2"))) {
		if (helper_on[1] == true) {helper_on[1] = false} else {helper_on[1] = true}
	}
	if (keyboard_check_pressed(ord("3"))) {
		if (helper_on[2] == true) {helper_on[2] = false} else {helper_on[2] = true}
	}
	if (keyboard_check_pressed(ord("4"))) {
		if (helper_on[3] == true) {helper_on[3] = false} else {helper_on[3] = true}
	}
	if (keyboard_check_pressed(ord("5"))) {
		if (helper_on[4] ==true) {helper_on[4] = false} else {helper_on[4] = true}
	}
	if (keyboard_check_pressed(ord("6"))) {
		if (helper_on[5] == true) {helper_on[5] = false} else {helper_on[5] = true}
	}
	if (keyboard_check_pressed(ord("7"))) {
		if (helper_on[6] == true) {helper_on[6] = false} else {helper_on[6] = true}
	}
	if (keyboard_check_pressed(ord("8"))) {
		if (helper_on[7] == true) {helper_on[7] = false} else {helper_on[7] = true}
	}
	if (keyboard_check_pressed(ord("9"))) {
		if (helper_on[8] == true) {helper_on[8] = false} else {helper_on[8] = true}
	}
}
#endregion



var move_to_x = x
var move_to_y = y
var move_speed_h = 0
var move_speed_v = 0

w = max(keyboard_check_pressed(vk_up),keyboard_check_pressed(ord("W")),keyboard_check_pressed(ord("Z")),keyboard_check_pressed(vk_space))
w_end = max(keyboard_check_released(vk_up),keyboard_check_released(ord("W")),keyboard_check_released(ord("Z")),keyboard_check_released(vk_space))
a = max(keyboard_check(vk_left),keyboard_check(ord("A")),keyboard_check(ord("Q")))
s = max(keyboard_check(vk_down),keyboard_check(ord("S")))
d = max(keyboard_check(vk_right),keyboard_check(ord("D")))


if (a > 0 or d > 0) { // they are moving left / right

	current_h_speed += (d-a)*(walk_acceleration*DT)
	current_h_speed = clamp(current_h_speed,-(clamp_walk*DT),(clamp_walk*DT))
} else { // not moving 
	
	//slow them down 
	if (current_h_speed > walk_decceleration) {
		current_h_speed -= (walk_decceleration*DT)
	} else if (current_h_speed < -walk_decceleration) {
		current_h_speed += (walk_decceleration*DT)
	} else {
		current_h_speed = 0
	}
	
}


// Am I at the apex
at_apex = false
fall_speed = fall_speed_max
if (grounded == false) {
	if (abs(current_v_speed) < speed_for_apex and helper_on[helper.anti_gravity_apex]) {
		at_apex = true
		fall_speed = fall_speed_min
		trigger_helper(helper.anti_gravity_apex)
	}
}


// gravty 
current_v_speed	+= (fall_speed/DT)

// max fall speed 
if (current_v_speed > clamp_fall_speed and helper_on[helper.clamp_fall_speed]) {
	current_v_speed = clamp_fall_speed
	trigger_helper(helper.clamp_fall_speed) 
}



// work out if I am allowed to jump
var can_jump = false 
if (grounded == true) {
	can_jump = true 	
}
if (helper_on[helper.coyote_jump] and grounded_frames_ago < 8 and grounded == false and helper_on[helper.coyote_jump]) {
	can_jump = true 
}
if (touched_ground_since_last_jump == false) {
	can_jump = false
}

var use_w = w // for buffering w
if (w_frames_ago < 7 and frames_going_down > 2 and helper_on[helper.jump_buffering]) { // can only jump buffer after going down for a little
	use_w = true
	
	if (can_jump) {
		trigger_helper(helper.jump_buffering)
	}
}

// DO THE JUMP
if (use_w and can_jump) {
	current_v_speed = -(jump_height)
	touched_ground_since_last_jump = false
	jump_early_end = false

	if (grounded == false) {
		// coyote_jump was used
		trigger_helper(helper.coyote_jump)
	}
}

// Better movment at apex
if (at_apex and helper_on[helper.speedy_apex] ) {
	if (current_h_speed > 1 and a) {
		current_h_speed -= 5
		trigger_helper(helper.speedy_apex)
	}
	if (current_h_speed < -1 and d) {
		current_h_speed += 5
		trigger_helper(helper.speedy_apex)
	}
	
}

// early end jump 
if (w_end and grounded == false and jump_early_end == false and current_v_speed < 0 and helper_on[helper.early_fall] ) {
	jump_early_end = true
	
	current_v_speed = 0
	trigger_helper(helper.early_fall)
}





var move_to_x = x+(current_h_speed*DT)
var move_to_y = y+(current_v_speed*DT)

// hit floor sticky feet
if (helper_on[helper.sticky_feet] and !place_free(move_to_x, move_to_y+1)) { // I'm going to hit the floor
	if (landed_frames_ago < 6) { // just hit the ground this frame
		if (a and current_h_speed > 0) { // you are moving one direction but pressing the button for other way 
			move_to_x -= clamp_walk // ability to instantly change direction when landing 
			current_h_speed = -clamp_walk
			trigger_helper(helper.sticky_feet)
		}

		if (d and current_h_speed < 0) { // you are moving one direction but pressing the button for other way 
			move_to_x += clamp_walk // ability to instantly change direction when landing 
			current_h_speed = clamp_walk
			trigger_helper(helper.sticky_feet)
		}
	}
}

#region Actually move the person 
// from the control checks we know where the player should be 
if (place_free(move_to_x, move_to_y)) {
	// player didnt hit a wall so move them 
	x = move_to_x
	y = move_to_y
} else {
	// I've hit a wall so work out where I should be 
	var xmoveamount = move_to_x-x
	if (xmoveamount > 0) {
		move_contact_solid(0,xmoveamount)
		//current_h_speed = 0
	} else if (xmoveamount < 0) {
		move_contact_solid(180,-xmoveamount)
		//current_h_speed = 0
	}
	// doing this twice so the player slides along the wall rather than stopping if I collide in one direction and not the other 
	var ymoveamount = move_to_y-y
	if (ymoveamount > 0) {
		move_contact_solid(270,ymoveamount)
	} else if (ymoveamount < 0) {
		move_contact_solid(90,-ymoveamount)
	}

}
#endregion

#region // on ground 
if (place_free(x, y+1)) {
	grounded = false
} else {
	if (grounded = false) {
		landed_frames_ago = 0
	}
	grounded = true
	grounded_frames_ago = 0
	current_v_speed = 0
	touched_ground_since_last_jump = true
}
#endregion


#region teleport me to other places
	if (current_v_speed < 0) { // going up
		if (helper_on[helper.bumped_head_on_corner] and place_free(x, y-1) == false) { // they are about to hit a wall
			var bump_amount = 30
			if (place_free(move_to_x + bump_amount, move_to_y - 1) == true) {
				x += bump_amount
				y -= 1
				move_contact_solid(180,bump_amount)
				trigger_helper(helper.bumped_head_on_corner)
			}
			if (place_free(move_to_x - bump_amount, move_to_y - 1) == true) {
				x -= bump_amount
				y -= 1
				move_contact_solid(0,bump_amount)
				trigger_helper(helper.bumped_head_on_corner)
			}
		}
	}
	if (current_v_speed > 0) { // going down
		var bump_amount = 30
		if (current_h_speed > 1) { // going right
			if (place_free(x+1, y) == false) { // they are about to hit a wall
				if (helper_on[helper.catch_missed_jump] and place_free(move_to_x, move_to_y-bump_amount) == true) {
					x = move_to_x
					y = move_to_y - (bump_amount + 1)
					move_contact_solid(270,bump_amount+2)
					trigger_helper(helper.catch_missed_jump)
				}
			}
		}
		if (current_h_speed < -1) { // going left
			if (place_free(x-1, y) == false) { // they are about to hit a wall
				if (helper_on[helper.catch_missed_jump] and place_free(move_to_x, move_to_y-bump_amount) == true) {
					x = move_to_x
					y = move_to_y - (bump_amount + 1)
					move_contact_solid(270,bump_amount+2)
					trigger_helper(helper.catch_missed_jump)
				}
			}
		}
	}
#endregion


// bumped head 
if			(current_v_speed < 0 and !place_free(x, y-1)) {
	current_v_speed = 0
} else if	(current_v_speed > 0 and !place_free(x, y+1)) { // on ground
	current_v_speed = 0
}
// touched wall
if			(current_h_speed > 0 and !place_free(x+1, y)) {
	current_h_speed = 0
} else if	(current_h_speed < 0 and !place_free(x-1, y)) {
	current_h_speed = 0
}



// for buffering stuff next frame
grounded_frames_ago++ // count how long I've been in air
if (at_apex or (grounded and landed_frames_ago>2) or current_v_speed < 0) {
	apex_frames_ago = 0
} else if (current_v_speed > 0) { // going down 
	apex_frames_ago++	
}
if ((grounded and landed_frames_ago>2) or current_v_speed < 0) {
	frames_going_down = 0
} else if (current_v_speed > 0) { // going down 
	frames_going_down++	
}
if (grounded) {
	landed_frames_ago ++ // count how long I've been on ground
}
if (w) {
	w_frames_ago = 0
} else {
	w_frames_ago++
}

for (var i = 0; i < helper.size; ++i) {
    helper_frame[i] ++
}


record_frame ++
if (record_frame > record_count) {
	record_frame = 0
}
record_line_x[record_frame] = x
record_line_y[record_frame] = y
record_line_colour[record_frame] = c_white
if (at_apex) {
	record_line_colour[record_frame] = c_blue
}
if (current_v_speed >= clamp_fall_speed-0.5) {
	record_line_colour[record_frame] = c_red
}


