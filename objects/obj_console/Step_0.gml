/// @description Insert description here


dt = delta_time / 1000000

#region check to see if the person had opened or closed the panel 

if (display_frame <= 0) { // can be opened 
	var openme = false
	for (var i = 0; i < open_me_key_count; ++i) { // check all open keys 
	    if (keyboard_check_released(displaykey[i])) {
			openme = true
		}
	}
	
	if (openme) {
		show_debug_message("open console")
		display_direction = display_open_speed
		
		predict_y2_draw = predict_y1 // close the predict 
		
		history_x2 = display_get_gui_width()-pos_margin_sides // I do this on open as well incase its changed
		main_x2 = history_x2
		predict_x2 = main_x2
	}
} else { // can be closed 
	
	var closeme = false
	for (var i = 0; i < close_me_key_count; ++i) { // check all close keys 
	    if (keyboard_check_released(closekey[i])) {
			closeme = true
		}
	}
	
	if (closeme) {
		show_debug_message("close console")
		display_direction = -display_close_speed
	}
	
}

#endregion
#region animate in and out 

display_frame += display_direction * dt

if (display_frame > display_frames) {
	display_direction = 0
	display_frame = display_frames
} else if (display_frame < 0) {
	display_direction = 0
	display_frame = 0
}

#endregion


#region find locations after animations and easing 

if (display_frame > 0 and display_frame < display_frames) {

	var ease_amount = main_y2-(main_y2 * (power(display_frame/display_frames - 1, 3) + 1)) // EaseOutCubic


	
	history_y2_draw = history_y2 - ease_amount 
	history_text_y_draw = history_text_y - ease_amount
	
	main_y1_draw = main_y1 - ease_amount -1
	main_y2_draw = main_y2 - ease_amount
	
	text_y_draw = main_y1+floor((main_y2-main_y1)/2) - ease_amount
	
} else {
	history_y2_draw = history_y2
	history_text_y_draw = history_text_y
	
	main_y1_draw = main_y1
	main_y2_draw = main_y2
	
	text_y_draw = main_y1+floor((main_y2-main_y1)/2)
}

	#region work out where the prediction box should be 
		if (display_frame > 0) {

			predict_y1 = main_y2_draw+1
			predict_y2 = main_y2_draw + (predict_line_height*predict_count) +2

			if (predict_y2_draw > predict_y2+(predict_shrink_speed*dt)) {
				predict_y2_draw -= predict_shrink_speed*dt
			} else if (predict_y2_draw < predict_y2-(predict_grow_speed*dt)) {
				predict_y2_draw += predict_grow_speed*dt
			} else {
				predict_y2_draw = predict_y2
			}
		}
	#endregion
#endregion

if (text_changed) {

	#region break up what they have typed at delimitors 

	
		text_part = "" // clear out this array because we are going to refill it 
		text_part[0] = "" 
		
		// clear out all these:
		stage_text_length = 0
		stage_text_length[0] = 0 // count how many characters 
		stage_text_running_length = 0
		stage_text_running_length[0] = 0
		
		var temp_text_part = "" // store the parts of text here until we know its filled 
		var temp_part_count = 0
		var text_length = string_length(text)
		var allowed_to_add = false // dont add delimiters into the string
		for (var i = 0; i < text_length; ++i) { // go through every character 
			var checking_character = string_char_at(text,i+1) // this is the character we are checking 
			allowed_to_add = true
			

			for (var j = 0; j < delimiter_count; ++j) { // go through every delimiter 

			    if (checking_character == delimiters[j]) {
					// we found a new delimiter, put all this into the arrays 
					
					if (temp_text_part != "") { // checking for a double space
						text_part[temp_part_count] = temp_text_part
					
						stage_text_length[temp_part_count] = string_length(temp_text_part) // count the number of character in this group. 
						stage_text_running_length[temp_part_count] = i // count how many characters along until the end of this stage 

						temp_part_count++
						temp_text_part = ""
						allowed_to_add = false
						break 
					} else {
						allowed_to_add = false // this is a double space	
					}
				}
			
			}
			if (allowed_to_add == true) { // only add characters after the first one because that was the delimiter
				temp_text_part += checking_character
			}
		
		}
		// CATCH THE LAST ONE
		text_part[temp_part_count] = temp_text_part // catch the last one 
		stage_text_length[temp_part_count] = string_length(temp_text_part) // count the number of character in this group. 
		stage_text_running_length[temp_part_count] = text_length // count how many characters along until the end of this stage 
		
		stage_count = array_length_1d(text_part) // count the number of stages 
		
		// make things lowercase 
		if (stage_count > 0) {text_part[0] = string_lower(text_part[0])}
		//if (stage_count > 1) {text_part[1] = string_lower(text_part[1])}

	#endregion
	
	#region find where the cursor is in the text
		if (cursor_at == 0) { // no text
			cursor_at_stage = -1 
		} else {
			for (var i = 0; i < stage_count; ++i) {
			    if (cursor_at-1 < stage_text_running_length[i]) {
					cursor_at_stage = i
					break;	
				}
			}
		}
		
		#region if cursor has moved stage clear out all focuses 
			if (cursor_at_stage_last != cursor_at_stage) {
				cursor_at_stage_last = cursor_at_stage
				
				var commands_focused_length = array_length_1d(commands_focused)
				commands_focused = array_create(commands_focused_length,false) // does this command have focus
				var predictions_focused_length = array_length_1d(predictions_focused)
				predictions_focused = array_create(predictions_focused_length,false) // does this command have focus

			}
		#endregion

	#endregion

	#region auto complete  

	
		predict_count = 0 // reset predictions

		if (cursor_at_stage == -1) { // left most 
			predict_count = command_1.size
			commands_visible = array_create(command_1.size,true) // show all commands
		} else if (cursor_at_stage == 0) { // first stage of text area
			for (var i = 0; i < command_1.size; ++i) {
			    if (text_part[0] == string_copy(commands[i],0,string_length(text_part[0]))) {
					commands_visible[i] = true
					predict_count++
				} else {
					commands_visible[i] = false	
				}
			}
			good_first_stage = true // just to colour correct when they are typing 
		} else { // past the first stage
		
			// reset these so we can find them out:
			good_first_stage = false
			command_to_run = -1
		
			#region do we know what they wanted in the first stage?	
			for (var i = 0; i < command_1.size; ++i) { 
			    if (text_part[0] == commands[i]) {
					good_first_stage = true
					command_to_run = i
				}
			}
			#endregion
		
			second_level_commands = 0 // clear this array 
			second_level_commands[0] = 0 
			command_to_prediction = 0
			command_to_prediction[0] = 0

		
			if (good_first_stage) { // Yes we are going to do something 
				
				// SECOND LEVEL
				if (array_length_1d(text_part) == 2) { 
					event_user(2)
				} else if (array_length_1d(text_part) >= 3) {
					event_user(3)
				}
				
				#region focus for predictions after the first stage 
				var focus_to_this_prediction = 0
				var has_focus = false 
				var is_focused = 0
				
				var predictions_focused_count = array_length_1d(predictions_focused)
				for (var i = 0; i < predictions_focused_count; ++i) { // if there is no 
				    if (predictions_focused[i] == true) {
						has_focus = true // something has focus 
						is_focused = i
						break;
					}
				}
				if (has_focus == false) {
					predictions_focused = 0 // clear this array 
					predictions_focused = array_create(array_length_1d(predictions),false)
				} else {
				    if (predictions_visible[is_focused] == false) { // make sure we can still see this prediction 
						// ah we cant see this prediction so move down until we can 
						for (var i = is_focused; i < predict_count; ++i) {
						    if (predictions_visible[command_to_prediction[i]] == true) {
								predictions_focused[command_to_prediction[i]] = true
								break;
							}
						}
					}
				}
				
				#endregion

			}
		}
	#endregion

	#region find the length of each character 


		draw_set_font(font_for_main)
	
		text_char_length[0] = 0
		text_char_running_length[0] = 0
	
		var running_text_length = 0
	
		var textlength = string_length(text)
		for (var i = 0; i < textlength; ++i) {
			var ii = i+1
			text_char_length[ii] = string_width(string_char_at(text,ii))
			running_text_length += text_char_length[ii]
			text_char_running_length[ii] = running_text_length
		}

		text_end_x = text_start_x + running_text_length
		text_changed = false




	#endregion

}

#region cursor 
flash_frames = 30
flash_frame ++
if (flash_frame > flash_frames) {flash_frame = 0}
#endregion



#region view collect date 
if (view_active_count > 0) {
	for (var i = 0; i < view_active_count; ++i) {
		
		if (!instance_exists(view_obj[i])) {
			view_type[i] = 3 // 0=int, 1=str, 2=array, 3=destroyed
			view_destroyed_frame[i] --
		}
		
		if(view_intro_highlight_frame[i] > 0) {view_intro_highlight_frame[i] --} // this is for the highlighted background
		
		switch (view_type[i]) {
		    case 0: // int
				#region int

					var new_value = variable_instance_get(view_obj[i], view_text[i])
					view_graph_data[i,view_next_insert[i]] = new_value
					view_last_data[i] = new_value
		
					if (new_value < view_min[i]) {view_min[i] = new_value; view_recalculate[i] = true}
					if (new_value > view_max[i]) {view_max[i] = new_value; view_recalculate[i] = true}
		
					view_next_insert[i] ++ // this stores where to next write data 
					if (view_next_insert[i] > view_history_datapoints) {view_next_insert[i] = 0} // rather than moving loads of data around we have a pointer that says where to write the data and we move this

					if (view_recalculate[i] == true) {
						#region the min or max has changed so we need to recalculate where every pixel on the graph is 
						var data_count = array_length_2d(view_graph_data,i)
						var max_take_min = view_max[i] - view_min[i]
						for (var j = 0; j < view_history_datapoints; ++j) {
							if (j < data_count) {
								view_graph_pixels[i,j] = ( (view_graph_data[i,j] - view_min[i]) / max_take_min) * view_data_height // find the height in px of all data 
							} else {
								view_graph_pixels[i,j] = -8765.43 // Just a number I thought was unlikley to come up
							}
						}
						#endregion
					}
				#endregion
		    break;
		    case 1: // str
				#region str
					var new_value = variable_instance_get(view_obj[i], view_text[i])
					view_last_data[i] = new_value
				#endregion	
		    break;
		}
		
	}
}
#endregion
