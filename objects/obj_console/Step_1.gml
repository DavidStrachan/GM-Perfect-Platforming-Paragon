/// @description inputs 

if (display_frame > 0) { // I'm open 
	
	#region all keyboard inputs 
	
		#region holding down backspace/delete
		var do_delete = false
		/* 
		
		This doesnt work any more because you do they keyboard clear, I think I have to store if it was up or down 
		
		*/
		if (keyboard_check(vk_delete)) {
			show_debug_message("hold stopped working =/ ")
			holding_delete_frames++
			if (holding_delete_frames > holding_frame_to_activate) {
				if (((holding_delete_frames) mod holding_frame_delete_speed) == 0) {
					do_delete = true
				}
			}
		} else {
			holding_delete_frames = 0
		}
		var do_backspace = false
		if (keyboard_check(vk_backspace)) {
			holding_backspace_frames++
			if (holding_backspace_frames > holding_frame_to_activate) {
				if (((holding_backspace_frames) mod holding_frame_delete_speed) == 0) {
					do_backspace = true
				}
			}
		} else {
			holding_backspace_frames = 0
		}
		#endregion
	
		if (keyboard_check_pressed(vk_anykey) or do_delete or do_backspace) {

			#region We know they have pressed a key, but make sure its not to open/close console 
			var wanted_to_close = false
			for (var i = 0; i < open_me_key_count; ++i) { // check all open keys 
			    if (keyboard_check_pressed(displaykey[i])) {
					wanted_to_close = true
				}
			}
			for (var i = 0; i < close_me_key_count; ++i) { // check all close keys 
			    if (keyboard_check_pressed(closekey[i])) {
					wanted_to_close = true
				}
			}
			#endregion
			
			text_changed = true

			if (wanted_to_close == false) { // make sure its not one of the buttons to open or close
			
				flash_frame = 0 // reset the flash
	
				var text_old_length = string_length(text) // remember the old length 

				if (keyboard_check(vk_control) and keyboard_check(ord("V"))) {
					#region // check for pasted things 
					text = string_insert(clipboard_get_text(),text,cursor_at+1)
					cursor_at += string_length(clipboard_get_text())
					#endregion
				} else if (keyboard_check(vk_control) and keyboard_check(ord("C"))) {
					#region // check for copying things 
					clipboard_set_text(string_copy(text,mouse_selection_start+1,mouse_selection_end-mouse_selection_start))
					#endregion
				} else if (keyboard_check(vk_control) and keyboard_check(ord("A"))) {
					#region // check for select all 
					mouse_selection_start = 0 
					mouse_selection_end = text_old_length
					cursor_at = text_old_length
					#endregion
				} else if (keyboard_check(vk_control) and keyboard_check(vk_delete)) {
					#region // delete untill delimiter hit
					do {
						
						text = string_copy(text,0,cursor_at)+string_copy(text,cursor_at+2,text_old_length-cursor_at)
						
					    var hit_stopper = false 
						for (var i = 0; i < delimiter_count; ++i) {
						    if (string_char_at(text,cursor_at+1) == delimiters[i]) {
								hit_stopper = true
							}
						}
						
					} until (cursor_at >= string_length(text) or hit_stopper);
					#endregion
				} else if (keyboard_check(vk_control) and keyboard_check(vk_backspace)) {
					#region // backspace until delimiter hit
					do {
						
						text = string_copy(text,0,cursor_at-1)+string_copy(text,cursor_at+1,text_old_length-cursor_at)
						cursor_at--
						cursor_at = clamp(cursor_at,0,text_old_length)
						
					    var hit_stopper = false 
						for (var i = 0; i < delimiter_count; ++i) {
						    if (string_char_at(text,cursor_at) == delimiters[i]) {
								hit_stopper = true
							}
						}
						
					} until (cursor_at <= 0 or hit_stopper);
					#endregion
				} else if (keyboard_check_pressed(vk_home)) {
					#region // full left 
					cursor_at = 0
					#endregion
				} else if (keyboard_check_pressed(vk_end)) {
					#region // full right 
					cursor_at = text_old_length
					#endregion
				} else if ((keyboard_check(vk_control) and keyboard_check(vk_left))) {
					#region // left until delimiter
					
					var old_cursor_at = cursor_at
					
					do {
						
						cursor_at--
						cursor_at = clamp(cursor_at,0,text_old_length)
						
					    var hit_stopper = false 
						for (var i = 0; i < delimiter_count; ++i) {
						    if (string_char_at(text,cursor_at) == delimiters[i]) {
								hit_stopper = true
							}
						}
						
					} until (cursor_at <= 0 or hit_stopper);
					
					if (keyboard_check(vk_lshift) or keyboard_check(vk_rshift)) { // is the player selecting at the same time by holding shift?
						if (old_cursor_at == text_old_length and mouse_selection_start == 0 and mouse_selection_end == 0) { // we are at the right most side
							mouse_selection_start = cursor_at
							mouse_selection_end = text_old_length
						} else if (mouse_selection_start == 0 and mouse_selection_end == 0) { // nothing selected so start selecting 
							mouse_selection_start = cursor_at
							mouse_selection_end = old_cursor_at
						} else if (cursor_at < mouse_selection_start) {
							mouse_selection_start = cursor_at
						} else {
							mouse_selection_end = cursor_at
						}
					}
					#endregion
				} else if ((keyboard_check(vk_control) and keyboard_check(vk_right))) {
					#region // right until delimiter
					
					var old_cursor_at = cursor_at
					
					do {
						
						cursor_at++
						cursor_at = clamp(cursor_at,0,text_old_length)
						
					    var hit_stopper = false 
						for (var i = 0; i < delimiter_count; ++i) {
						    if (string_char_at(text,cursor_at+1) == delimiters[i]) {
								hit_stopper = true
							}
						}
						
					} until (cursor_at >= string_length(text) or hit_stopper);
					
					if (keyboard_check(vk_lshift) or keyboard_check(vk_rshift)) { // is the player selecting at the same time by holding shift?
						if (old_cursor_at == 0 and mouse_selection_start == 0 and mouse_selection_end == 0) { // we are at the left most side
							mouse_selection_start = 0
							mouse_selection_end = cursor_at
						} else if (mouse_selection_start == 0 and mouse_selection_end == 0) {
							mouse_selection_start = old_cursor_at
							mouse_selection_end = cursor_at
						} else if (cursor_at > mouse_selection_end) {
							mouse_selection_end = cursor_at
						} else {
							mouse_selection_start = cursor_at
						}
					}
					#endregion
				} else if ((keyboard_check(vk_lshift) and keyboard_check(vk_left)) or (keyboard_check(vk_rshift) and keyboard_check(vk_left))) {
					#region // selecting text with shift+arrow
						if (cursor_at == text_old_length) { // we are at the right most side
							mouse_selection_start = text_old_length-1
							mouse_selection_end = text_old_length
							cursor_at = text_old_length-1
						} else if (cursor_at == mouse_selection_start) {
							if (cursor_at > 0) {
								mouse_selection_start --
								cursor_at --
							}
						} else {
							if (cursor_at < text_old_length) {
								mouse_selection_end --
								cursor_at --
							}
						}
					#endregion
				} else if (keyboard_check(vk_lshift) and keyboard_check(vk_right) or (keyboard_check(vk_lshift) and keyboard_check(vk_right))) {
					#region // selecting text with shift+arrow
						if (cursor_at == 0) { // we are at the left most side
							mouse_selection_start = 0
							mouse_selection_end = 1
							cursor_at = 1
						} else if (cursor_at < text_old_length) {
							if (cursor_at == mouse_selection_start) {
								mouse_selection_start ++
								cursor_at ++
							} else {
								mouse_selection_end ++
								cursor_at ++
							}
						}
					#endregion
				} else if (keyboard_check(vk_left)) {
					#region // cursor left 
					cursor_at --
					cursor_at = clamp(cursor_at,0,text_old_length)
					
					mouse_selection_end = 0 // reset mouse selection
					mouse_selection_start = 0
					#endregion
				} else if (keyboard_check(vk_right)) {
					#region // cursor right 
					cursor_at ++
					cursor_at = clamp(cursor_at,0,text_old_length)
					
					mouse_selection_end = 0 // reset mouse selection
					mouse_selection_start = 0
					#endregion
				} else if (keyboard_check(vk_up)) {
					#region // focus up 
					if (focus >= 0) { // can only go up at this stage
						#region in history 
							enter_action = 1 // What to do when enter is pressed: 0=Textbox, 1=History
							focus ++
							if (focus > min(history_count_max,history_text_count)) {
								focus = 1
							}
						#endregion
					} else {
						#region not in history 
						if (cursor_at_stage <= 0) {
						
							if (commands_focused[0] == true) { // if they are at the top go back to being focused on the text box
								commands_focused[0] = false
								focus = 0 // put them back on the text box
							} else {
						
								// find the one that is focused atm 
								for (var i = 1; i < command_1.size; ++i) {
									if (commands_focused[i] == true) { // this one is focused 
								
										for (var j = i-1; j >= 0; --j) { // loop around and find the next visible one
											if (commands_visible[j] == true) {
												commands_focused[i] = false
												commands_focused[j] = true
												break;	
											}
										}
										break;
									}
								}
							}
						} else {  // SECOND LEVEL +

						
							if (predictions_focused[0] == true) { // if they are at the top go back to being focused on the text box
								predictions_focused[0] = false
								focus = 0 // put them back on the text box
							} else {
						
								// find the one that is focused atm 
								var total_number_of_second_level = array_length_1d(predictions)
								for (var i = 1; i < total_number_of_second_level; ++i) {
									if (predictions_focused[i] == true) { // this one is focused 
								
										for (var j = i-1; j >= 0; --j) { // loop around and find the next visible one
											if (predictions_visible[j] == true) {
												predictions_focused[i] = false
												predictions_focused[j] = true
												break;	
											}
										}
										break;
									}
								}

							}
						}
						#endregion
					}
					#endregion
				} else if (keyboard_check(vk_down)) {
					#region // focus down  
						if (focus > 0) { // in history 
						
							if (focus == 1) {enter_action = 0} // What to do when enter is pressed: 0=Textbox, 1=History
								
							focus --
						} else {
							
							if (cursor_at_stage <= 0) {
								#region left most stage (The first stage is handled a little differently) 

									focus = -1
						
									var nothing_was_focused = true // if we cant find any that are focused just focus the top one
						
									#region // find the one that is focused atm 
									for (var i = 0; i < command_1.size-1; ++i) {
										if (commands_focused[i] == true) { // this one is focused 
											nothing_was_focused = false
											for (var j = i+1; j < command_1.size; ++j) { // loop around and find the next visible one
												if (commands_visible[j] == true) {
													commands_focused[i] = false
													commands_focused[j] = true
													break;
											
												}
											}
											break;
										}
									}
									#endregion
						
									#region we cant find any that are focused just focus the top one
									if (nothing_was_focused == true) {
										for (var i = 0; i < command_1.size; ++i) {
											if (commands_visible[i] == true) { // this one is visible so select it 
												commands_focused[i] = true
												if (i != command_1.size-1) {
													commands_focused[command_1.size-1] = false
												}
												break;
											}
										}
									}
									#endregion
						
								#endregion
							} else { // SECOND LEVEL +
								#region every stage after the first one 
									var total_number_of_second_level = array_length_1d(predictions)
									var focus_count = array_length_1d(predictions_focused)
									var nothing_was_focused = true
						
						
									#region before you move down if they are on the bottom jump to the top 
							
										var at_bottom = false
										var second_level_count = array_length_1d(second_level_commands)-1

										#region // find out if the bottom one is focused so you can wrap back up to the top 
										for (var i = second_level_count; i > 0; --i) { 
							
											var prediction_id = command_to_prediction[i];

											if (predictions_visible[prediction_id] == true) {
												if (predictions_focused[prediction_id] == true) {
													at_bottom = true
													break;
												}
												break;
											}
										}
										#endregion
						
										#region they are at the bottom so put them back to the top (we actually remove all focus because later in the code it will find the top one if nothing is selected)
										if (at_bottom == true) { 
											for (var i = 0; i <= total_number_of_second_level; ++i) {
												predictions_focused[prediction_id] = false
												break;
											}
										}	
										#endregion
							
									#endregion
						
									#region // find the one that is focused atm 
										for (var i = 0; i < focus_count-1; ++i) {
											if (predictions_focused[i] == true) { // this one is focused 
												nothing_was_focused = false
												for (var j = i+1; j < total_number_of_second_level; ++j) { // loop around and find the next visible one
													if (predictions_visible[j] == true) {
														predictions_focused[i] = false
														predictions_focused[j] = true
														break;
											
													}
												}
												break;
											}
										}
									#endregion

									#region none focused so they are going from text box down (so select the top one)
									if (nothing_was_focused == true) {
								
										#region to stop any invisible ones being focused still just loop through and remove them 
										var predictions_focused_count = array_length_1d(predictions_focused)
										for (var i = 0; i <= predictions_focused_count; ++i) {
											predictions_focused[i] = false
										}
										#endregion
								
										for (var i = 0; i <= focus_count-1; ++i) {
											if (predictions_visible[i] == true) { // this one is visible so select it 
												predictions_focused[i] = true
												predictions_focused[focus_count-1] = false
												break;
											}
										}

										#region we made the top one focused so remove focus from everything else 
										for (var j = i+1; j <= focus_count; ++j) {
											predictions_focused[j] = false
										}
										#endregion
								
									}
									#endregion
						
									focus = -(i+1)
								#endregion
							}
						}
					#endregion
				} else if (keyboard_check(vk_delete) or do_delete) {
					#region // delete 
					
						if (mouse_selection_start != mouse_selection_end) {
							#region delete any mouse selected text
								text = string_copy(text,0,mouse_selection_start)+string_copy(text,mouse_selection_end+1,(string_length(text)-mouse_selection_end)+1)
								cursor_at = mouse_selection_start
						
								mouse_selection_end = 0
								mouse_selection_start = 0

							#endregion
						} else {
					
							if (cursor_at < text_old_length) {
								text = string_copy(text,0,cursor_at)+string_copy(text,cursor_at+2,text_old_length-cursor_at)
							}
						}
					#endregion
				} else if (keyboard_check(vk_backspace) or do_backspace) {
					#region // backspace 
					
						if (mouse_selection_start != mouse_selection_end) {
							#region delete any mouse selected text
								text = string_copy(text,0,mouse_selection_start)+string_copy(text,mouse_selection_end+1,(string_length(text)-mouse_selection_end)+1)
								cursor_at = mouse_selection_start
						
								mouse_selection_end = 0
								mouse_selection_start = 0

							#endregion
						} else {
					
							if (cursor_at >= 0) {
								text = string_copy(text,0,cursor_at-1)+string_copy(text,cursor_at+1,text_old_length-cursor_at)
								cursor_at--
								cursor_at = clamp(cursor_at,0,text_old_length)
							}
						}
					#endregion
				} else if (keyboard_check(vk_tab)) {
					#region // select focused
						if (focus > 0) { // can only go up at this stage
							#region in the history area
								// DO SELECT
								text = history_text[focus-1] 
								focus = 0
								cursor_at = string_length(text)
								commands_visible = array_create(command_1.size,false) // reset
								commands_focused = array_create(command_1.size,false) // reset
								text_changed = true
								enter_action = 0 // What to do when enter is pressed: 0=Textbox, 1=History
							#endregion
						} else {
							#region on text box or predictions 
								if (cursor_at_stage <= 0) {
									#region left most stage (The first stage is handled a little differently) 
						
									var to_select = -1 // this is the one we will pick 
									if (focus != 0) { // player does have something focused (select focused)
										for (var i = 0; i < command_1.size; ++i) {
										    if (commands_focused[i] == true and commands_visible[i] == true) {
												to_select = i
												break;
											}
										}
									} 
									if (to_select == -1) { // player has nothing focused OR the focused one was invisible (select top visible)
										for (var i = 0; i < command_1.size; ++i) {
										    if (commands_visible[i] == true) {
												to_select = i
												break;
											}
										}
									}
									if (to_select == -1) { // if after all that nothing was visible tell the user
										temp_post_message = "Command not found"
										event_user(1)
									} else {
										// DO SELECT
										text = commands[to_select] + " "
										focus = 0
										cursor_at = string_length(text)
										commands_visible = array_create(command_1.size,false) // reset
										commands_focused = array_create(command_1.size,false) // reset
										text_changed = true
									}
									#endregion
								} else { // SECOND LEVEL +
									#region Anything after the first left most stage 
						
									var predictions_count = array_length_1d(predictions_visible)
									var to_select = -1 // this is the one we will pick 
									if (focus != 0) { // player does have something focused (select focused)
										for (var i = 0; i < predictions_count; ++i) {
										    if (predictions_focused[i] == true and predictions_visible[i] == true) {
												to_select = i
												break;
											}
										}
									} 
									if (to_select == -1) { // player has nothing focused OR the focused one was invisible (select top visible)
										for (var i = 0; i < predictions_count; ++i) {
										    if (predictions_visible[i] == true) {
												to_select = i
												break;
											}
										}
									}
									if (to_select == -1) { // if after all that nothing was visible tell the user
										temp_post_message = "I dont know what to do with this argument. "
										event_user(1)
									} else {
										// DO SELECT
							
										var text_before_this = ""
							
										#region break down all the text before this and put it into a string
										var text_before_this_count = array_length_1d(text_part)-1
										for (var i = 0; i < text_before_this_count; ++i) {
										    text_before_this += string(text_part[i]) + " "
										}
										#endregion
							
										text = text_before_this+string(predictions[to_select]) + " "
										focus = 0
										cursor_at = string_length(text)
										commands_visible = array_create(command_1.size,false) // reset
										commands_focused = array_create(command_1.size,false) // reset
										text_changed = true
									}
									#endregion
								}
							#endregion
						}
						
						mouse_selection_end = 0 // reset mouse selection
						mouse_selection_start = 0
					#endregion
				} else if (keyboard_check(vk_enter)) {
					#region // commit
					if (enter_action == 1) { // if they have just moved to history run that command
						text_changed = true 
						text = history_text[focus-1]
						event_perform(ev_step,0)
						focus = 0
						enter_action = 0 // What to do when enter is pressed: 0=Textbox, 1=History
					}
					
					event_user(0)
					
					mouse_selection_end = 0 // reset mouse selection
					mouse_selection_start = 0
					#endregion
				} else { 
					#region // they are not using a keyboard command so add the text

					if ((keyboard_key >= 48 and keyboard_key <= 90) or // letter/number
						(keyboard_key >= 96 and keyboard_key <= 111) or // numpad
						(keyboard_key >= 186) or // symbols 
						(keyboard_key == 32) ) { 
							
						#region delete any mouse selected text
							if (mouse_selection_start != mouse_selection_end) {
								text = string_copy(text,0,mouse_selection_start)+string_copy(text,mouse_selection_end+1,(string_length(text)-mouse_selection_end)+1)
								cursor_at = mouse_selection_start
						
								mouse_selection_end = 0
								mouse_selection_start = 0
							}
						#endregion

						text = string_insert(keyboard_lastchar,text,cursor_at+1)
						if (string_length(text) != text_old_length) {cursor_at ++} // text has change so add 1 to cursor position 

					}
					#endregion
				}
			
			}
		}
		
		keyboard_clear(keyboard_key) // keyboard_clear(vk_anykey)
	
	#endregion
	
	#region mouse move (for selecting things)
	if (mouse_x_last != device_mouse_x_to_gui(0) or mouse_y_last != device_mouse_y_to_gui(0)) {
		if (device_mouse_y_to_gui(0) < history_y2) { 
			#region Mouse in history 
			history_mouse_hover = abs(floor((((device_mouse_y_to_gui(0)-history_text_y_draw)-(history_line_height/2))/history_line_height)))
			#endregion
		}
	}
	#endregion
	
	if (mouse_check_button_pressed(mb_any)) {
		if (device_mouse_y_to_gui(0) > max(predict_y2,main_y2)) { // clicking out of the console 
			show_debug_message("close console")
			display_direction = -display_close_speed
		} else { // clicking on the console 
			#region // clicking on the console
			if (device_mouse_y_to_gui(0) < history_y2) { // Mouse in history 
				#region Mouse in history 
				if (history_mouse_hover <= array_length_1d(history_text)) {
					text = history_text[history_mouse_hover-1] 
					cursor_at = string_length(text)
					commands_visible = array_create(command_1.size,false) // reset
					commands_focused = array_create(command_1.size,false) // reset
					text_changed = true
				}
				#endregion
			} else if (device_mouse_y_to_gui(0) < main_y2) { // Mouse in main text
				
				#region selecting the text with mouse
				var length_of_the_text = string_length(text)
				
				if (device_mouse_x_to_gui(0) < text_start_x) { // left of the text
					cursor_at = -1
				} else if (device_mouse_x_to_gui(0) > text_start_x+text_char_running_length[array_length_1d(text_char_running_length)-1]) { // right of the text
					cursor_at = length_of_the_text
				} else { // in the text
					for (var i = 0; i < length_of_the_text; ++i) {
						if (device_mouse_x_to_gui(0) > text_start_x+text_char_running_length[i]) {
							cursor_at = i
						}
					}
				}
				
				mouse_selection_temp = cursor_at
				
				#endregion
				
			} else { // mouse in predicted text
				show_debug_message("Todo: Mouse in predicted text")
			}
			
			#endregion
			
		}
	}

	#region Mouse up 
		if (mouse_selection_temp > -1) {
			if (device_mouse_y_to_gui(0) > main_y1 and device_mouse_y_to_gui(0) < main_y2) {
				var length_of_the_text = string_length(text)
				
				if (device_mouse_x_to_gui(0) < text_start_x) { // left of the text
					cursor_at = -1
				} else if (device_mouse_x_to_gui(0) > text_start_x+text_char_running_length[array_length_1d(text_char_running_length)-1]) { // right of the text
					cursor_at = length_of_the_text
				} else { // in the text
					for (var i = 0; i < length_of_the_text; ++i) {
						if (device_mouse_x_to_gui(0) > text_start_x+text_char_running_length[i]) {
							cursor_at = i
						}
					}
				}
			}
			
			#region Find out when selecting text which is the start and the end 
			if (cursor_at > mouse_selection_temp) {
				mouse_selection_start = mouse_selection_temp // when the mouse is used to select text the start character 
				mouse_selection_end = cursor_at // when the mouse is used to select text the start character 
			} else {
				mouse_selection_start = cursor_at // when the mouse is used to select text the start character 
				mouse_selection_end = mouse_selection_temp // when the mouse is used to select text the start character 
			}
			if (mouse_check_button_released(mb_any)) {
				mouse_selection_temp = -1
			}
			#endregion
		}
	#endregion

	
	mouse_clear(mb_any) // DO ALL MOUSE STUFF BEFORE THIS
}
