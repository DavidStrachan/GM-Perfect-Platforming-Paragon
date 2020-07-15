/// @description Insert description here
// You can write your code in this editor

with (obj_checkpoint) {
	if (place_meeting(x, y, obj_player)) {
		
		other.checkpoint_done[checkpoint_number] = true
		
		if (checkpoint_finish == true) { // check for full rotation of every point
			with (obj_timer) {
				var all_done = true
				for (var i = 0; i < checkpoint_count; ++i) {
				    if (checkpoint_done[i] == false) {
						all_done = false
					} 
				}
				if (all_done == true) { // they have finished all of them 
					checkpoint_done = array_create(checkpoint_count,false)
					
					past_times[past_timer_counter] = race_timer
					past_times_string[past_timer_counter] = frames_to_string(race_timer)

					// for popup
					popup_string = past_times_string[past_timer_counter]
					popup_speed = 1
					popup_frame = 0 
					popup_part = 0 
					
					if (race_timer <= best_time_frames) {
						best_time_frames = race_timer
						best_time_string = frames_to_string(best_time_frames)
					}
					
					race_timer = 0 

					past_timer_counter ++
					

		

				}
			}
		} 
		
	}
}

race_timer++


#region popup
popup_frame+= popup_speed

if (popup_frame >= popup_framesmax[popup_part]) { // this part of the animation has finished move onto the next one
    popup_part++
    popup_frame = 0
    
    if (popup_part >= array_length(popup_framesmax)) { // the whole animation has finished so reset the whole thing
		popup_part = 0
		popup_speed = 0
    }
}

#endregion