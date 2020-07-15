/// @description PARSE

var command_done = false 

if (text_part[0] == commands[command_1.create]) {
	#region CREATE
		var create_x = room_width/2
		var create_y = room_height/2
		var create_obj = -1
		
		var parse_parts = array_length_1d(text_part)
		var object_to_try_and_make = asset_get_index(text_part[1])

		if (parse_parts == 1) { // object doesnt exist 
			temp_post_message = "We need to know what object we are maing"
			event_user(1); // post message to the history 
		} else {
			if (!object_exists(object_to_try_and_make)) { // object doesnt exist 
				temp_post_message = "Object "+string(text_part[1])+" doesnt exist"
				event_user(1); // post message to the history 
			} else {
				
				create_obj = object_to_try_and_make
				
				if (parse_parts == 3) { // Did they give me an x location?
					if (text_part[2] != "" and text_part[2] != " ") {
						create_x = real(text_part[2])
					}
				} else if (parse_parts >= 4) { // did they give me an x and y location?
					if (text_part[2] != "" and text_part[2] != " ") {
						create_x = real(text_part[2])
					}
					if (text_part[3] != "" and text_part[3] != " ") {
						create_y = real(text_part[3])
					}
				}

				
				instance_create_depth(create_x,create_y,-10000,create_obj)
				command_done = true
			}
		}
	#endregion
} else if (text_part[0] == commands[command_1.set] or text_part[0] == "edit") { 
	#region set

		var parse_parts = array_length_1d(text_part)
		var object_to_try_and_edit = asset_get_index(text_part[1])
		
		if (parse_parts == 1) { // object doesnt exist 
			temp_post_message = "We need to know what object to edit"
			event_user(1); // post message to the history 
		} else {
			if (parse_parts == 2) { // variable doesnt exist 
				temp_post_message = "Please provide a variable to edit"
				event_user(1); // post message to the history 
			} else {
				if (parse_parts == 3) { // need data
					temp_post_message = "We need to know what to change it to"
					event_user(1); // post message to the history 
				} else {
					if (!object_exists(object_to_try_and_edit)) { // object doesnt exist 
						temp_post_message = "Unknown object"
						event_user(1); // post message to the history 
					} else {
						if (instance_number(object_to_try_and_edit) == 0) { // object doesnt exist 
							temp_post_message = "Instance doesnt exist"
							event_user(1); // post message to the history 
						} else { // DO IT
							
							if (text_part[3] == "true") {text_part[3] = true}
							if (text_part[3] == "false") {text_part[3] = false}
							
							with (object_to_try_and_edit) { // many things might have this 
								var getting_this_instance = variable_instance_get(id, string(other.text_part[2]))
										
								if (string_length(string_digits(other.text_part[3])) == string_length(other.text_part[3])) { // is int
									if (is_array(getting_this_instance)) { // ARRAY OF INTS
										if (parse_parts==5) { // it has a decimal point
											var new_array = array_create(array_length_1d(getting_this_instance),real(other.text_part[3]+"."+other.text_part[4]))
										} else {
											var new_array = array_create(array_length_1d(getting_this_instance),real(other.text_part[3]))
										}
										variable_instance_set(id, string(other.text_part[2]), new_array)
									} else { // INT
										if (parse_parts==5) { // it has a decimal point
											variable_instance_set(id, string(other.text_part[2]), real(other.text_part[3]+"."+other.text_part[4]))
										} else {
											variable_instance_set(id, string(other.text_part[2]), real(other.text_part[3]))
										}
									}
								} else {
									
									var console_all_strings_added_together = string(string_copy(other.text,other.stage_text_running_length[2]+1,string_length(other.text)-other.stage_text_running_length[2]+1))
								
									if (is_array(getting_this_instance)) { // ARRAY OF STRINGS
										var new_array = array_create(array_length_1d(getting_this_instance),console_all_strings_added_together)
										variable_instance_set(id, string(other.text_part[2]), new_array)
									} else { // STRING
										variable_instance_set(id, string(other.text_part[2]), console_all_strings_added_together)
									}
								}

							}

							command_done = true

						}
					}
				}
			}
		}
	#endregion
} else if (text_part[0] == commands[command_1.destroy]) {
	#region destroy
	
		var parse_parts = array_length_1d(text_part)
		
		var object_to_try_and_destroy = asset_get_index(text_part[1])
		
		if (parse_parts == 1) { // object doesnt exist 
			temp_post_message = "We need to know what object to destroy"
			event_user(1); // post message to the history 
		} else {
			if (!object_exists(object_to_try_and_destroy)) { // object doesnt exist 
				temp_post_message = "Unknown object"
				event_user(1); // post message to the history 
			} else {
				
				if (instance_number(object_to_try_and_destroy) == 0) { // object doesnt exist 
					temp_post_message = "Instance count was zero"
					event_user(1); // post message to the history 
				} else {
				
					parse_parts = object_to_try_and_destroy
					instance_destroy(parse_parts)
					command_done = true

				}
			}
		}
	#endregion
} else if (text_part[0] == commands[command_1.view]) {
	#region view

		var parse_parts = array_length_1d(text_part)
		var object_to_try_and_access = asset_get_index(text_part[1])
		
		if (parse_parts == 1) { // object doesnt exist 
			temp_post_message = "We need to know what object for the variable"
			event_user(1); // post message to the history 
		} else {
			if (parse_parts == 2 or text_part[2] == "") { // variable doesnt exist 
				temp_post_message = "Please provide a variable to watch"
				event_user(1); // post message to the history 
			} else {
				if (!object_exists(object_to_try_and_access)) { // object doesnt exist 
					temp_post_message = "Unknown object"
					event_user(1); // post message to the history 
				} else {
					if (instance_number(object_to_try_and_access) == 0) { // object doesnt exist 
						temp_post_message = "Instance doesnt exist"
						event_user(1); // post message to the history 
					} else { // DO IT

						with (object_to_try_and_access) {

							var new_value = variable_instance_get(id, string(other.text_part[2]))
							other.temp_post_message = other.text_part[1]+"."+other.text_part[2] + " = " + string(new_value)
							event_user(1); // post message to the history 
						
							other.view_text[other.view_active_count] = other.text_part[2]
							other.view_obj[other.view_active_count] = id
							other.view_recalculate[other.view_active_count] = true
							other.view_title[other.view_active_count] = other.text_part[1]+"."+other.text_part[2]
							other.view_destroyed_frame[other.view_active_count] = other.view_destroyed_frames
							other.view_next_insert[other.view_active_count] = 0
							other.view_intro_highlight_frame[other.view_active_count] = other.view_intro_highlight_frames
						
							if (is_real(new_value)) {
								other.view_type[other.view_active_count] = 0 // 0=int, 1=str, 2=array, 3=destroyed	
								other.view_min[other.view_active_count] = new_value
								other.view_max[other.view_active_count] = new_value
							}
							if (is_string(new_value)) {
								other.view_type[other.view_active_count] = 1 // 0=int, 1=str, 2=array, 3=destroyed	
							}

							other.view_active_count++
						
						}

						command_done = true

					}
				}
			}
		}
	#endregion
} else if (text_part[0] == commands[command_1.script]) {
	#region script
	
		var parse_parts = array_length_1d(text_part)
		var script_to_run = asset_get_index(text_part[1])
		
		if (parse_parts == 1) { // object doesnt exist 
			temp_post_message = "We need to know what script to run"
			event_user(1); // post message to the history 
		} else {
			if (text_part[1] == "") { // object doesnt exist 
				temp_post_message = "We need to know what script to run"
				event_user(1); // post message to the history 
			} else {
				if (!script_exists(script_to_run)) {
					temp_post_message = "This script doesnt exist"
					event_user(1); // post message to the history 
				} else {

					if		(parse_parts == 2)  {var script_returned = script_execute(script_to_run);} 
					else if (parse_parts == 3)  {var script_returned = script_execute(script_to_run,text_part[2]);} 
					else if (parse_parts == 4)  {var script_returned = script_execute(script_to_run,text_part[2],text_part[3]);} 
					else if (parse_parts == 5)  {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4]);} 
					else if (parse_parts == 6)  {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5]);} 
					else if (parse_parts == 7)  {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6]);} 
					else if (parse_parts == 8)  {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7]);} 
					else if (parse_parts == 9)  {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7],text_part[8]);} 
					else if (parse_parts == 10) {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7],text_part[8],text_part[9]);} 
					else if (parse_parts == 11) {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7],text_part[8],text_part[9],text_part[10]);} 
					else if (parse_parts == 12) {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7],text_part[8],text_part[9],text_part[10],text_part[11]);} 
					else if (parse_parts == 13) {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7],text_part[8],text_part[9],text_part[10],text_part[11],text_part[12]);} 
					else if (parse_parts == 14) {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7],text_part[8],text_part[9],text_part[10],text_part[11],text_part[12],text_part[13]);} 
					else if (parse_parts == 15) {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7],text_part[8],text_part[9],text_part[10],text_part[11],text_part[12],text_part[13],text_part[14]);} 
					else if (parse_parts == 16) {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7],text_part[8],text_part[9],text_part[10],text_part[11],text_part[12],text_part[13],text_part[14],text_part[15]);} 
					else if (parse_parts == 17) {var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7],text_part[8],text_part[9],text_part[10],text_part[11],text_part[12],text_part[13],text_part[14],text_part[15],text_part[16]);} 
					else						{var script_returned = script_execute(script_to_run,text_part[2],text_part[3],text_part[4],text_part[5],text_part[6],text_part[7],text_part[8],text_part[9],text_part[10],text_part[11],text_part[12],text_part[13],text_part[14],text_part[15],text_part[16],text_part[17]);} 
					
					
					command_done = true
				
					if (script_returned != undefined) {
						temp_post_message = script_returned
						event_user(1); // post message to the history 
					}
				}
			}
		}
		
	#endregion
} else if (text_part[0] == commands[command_1.game]) {
	#region game
		var parse_parts = array_length_1d(text_part)
		
		if (parse_parts == 1) { // object doesnt exist 
			temp_post_message = "Game must have sub commands"
			event_user(1); // post message to the history 
		} else {
			if (text_part[1] == "restart") {
				#region restart
				game_restart()
				command_done = true
				#endregion
			} else if (text_part[1] == "fullscreen_toggle") {
				#region fullscreen_toggle
				if (window_get_fullscreen() == true) {
					window_set_fullscreen(false)
				} else {
					window_set_fullscreen(true)
				}
				command_done = true
				#endregion
			} else if (text_part[1] == "resource_count") {
				#region resource_count
					var display_to_user = ""
					var countnumber 

					#region Instances 
						display_to_user += "Instances: " + string(instance_number(all))
					#endregion
					#region Surfaces 
						countnumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (surface_exists(i)) {countnumber++}
						}
						display_to_user += " Surfaces: " + string(countnumber)
					#endregion
					#region ds_list 
						display_to_user += " DS: "
					
						countnumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (ds_exists(i,ds_type_list)) {countnumber++}
						}
						display_to_user += " list: " + string(countnumber)
					#endregion
					#region ds_map
						countnumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (ds_exists(i,ds_type_map)) {countnumber++}
						}
						display_to_user += " map: " + string(countnumber)
					#endregion
					#region ds_grid
						countnumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (ds_exists(i,ds_type_grid)) {countnumber++}
						}
						display_to_user += " grid: " + string(countnumber)
					#endregion
					#region ds_stack
						countnumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (ds_exists(i,ds_type_stack)) {countnumber++}
						}
						display_to_user += " stack: " + string(countnumber)
					#endregion
					#region ds_queue
						countnumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (ds_exists(i,ds_type_queue)) {countnumber++}
						}
						display_to_user += " queue: " + string(countnumber)
					#endregion
					#region ds_priority 
						countnumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (ds_exists(i,ds_type_priority)) {countnumber++}
						}
						display_to_user += " priority: " + string(countnumber)
					#endregion
					#region paths 
						countnumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (path_exists(i)) {countnumber++}
						}
						display_to_user += " Paths: " + string(countnumber)
					#endregion
					#region particles
						countnumber = 0
						var particlenumber = 0
						var emitternumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (part_system_exists(i)) {
								countnumber++
								particlenumber += part_particles_count(i);
								for (var j = 0; j < 1000; ++j) { // emitter
									if (part_emitter_exists(i,j)) {
										emitternumber ++
									}
								}
							}
						}
						display_to_user += " PARTICLES: total:" + string(particlenumber) + " systems:" + string(countnumber) + " emitter:" + string(emitternumber)
					#endregion
					#region sound emitter 
						countnumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (audio_emitter_exists(i)) {countnumber++}
						}
						display_to_user += " Audio Emitter: " + string(countnumber)
					#endregion
					#region buffer
						countnumber = 0
						for (var i = 0; i < 1000; ++i) {
						    if (buffer_exists(i)) {countnumber++}
						}
						display_to_user += " buffer: " + string(countnumber)
					#endregion
				
					temp_post_message = display_to_user
					event_user(1); // post message to the history 
					command_done = true
				#endregion
			} else if (text_part[1] == "instance_count") {
				#region instance_count
					var display_to_user = ""
					var list_of_objects = ds_map_create();
					var new_line_count = 0 // this is the number before putting a line break (I will find a better way to do this)


					with(all) {
						if (!ds_map_exists(list_of_objects, object_index)) {
							display_to_user += string(object_get_name(object_index))+"="+string(instance_number(object_index))+" "
							ds_map_add(list_of_objects,object_index,true)
							
							new_line_count ++
							if (new_line_count >= 7) {
								new_line_count = 0 
								
								with (other) {
									temp_post_message = display_to_user
									event_user(1); // post message to the history 
								}
								
								display_to_user = ""
							}
						}
					}
					
					ds_map_destroy(list_of_objects)
				
					temp_post_message = display_to_user
					event_user(1); // post message to the history 
					command_done = true
				#endregion
			} else if (text_part[1] == "room_restart") {
				#region room_restart
				room_restart()
				command_done = true
				#endregion
			} else if (text_part[1] == "room_goto") {
				#region room_goto
				if (array_length_1d(text_part) < 3) {
					temp_post_message = "Please provide a room to go to "
					event_user(1); // post message to the history 
				} else {
					var room_to_try_and_make = asset_get_index(text_part[2])
					
					if (!room_exists(room_to_try_and_make)) {
						temp_post_message = "Room "+string(text_part[2])+" doesnt exist"
						event_user(1); // post message to the history 
					} else {
						room_goto(room_to_try_and_make)
						command_done = true
					}
				}
				#endregion
			} else if (text_part[1] == "debug_overlay") {
				#region debug_overlay_on
				if (array_length_1d(text_part) >= 3) {
					if (text_part[2] == "0" or text_part[2] == "false") {
						show_debug_overlay(false)
					} else {
						show_debug_overlay(true)
					}
				} else {
					show_debug_overlay(true)
				}
				command_done = true
				#endregion
			} else if (text_part[1] == "debug_audio" or text_part[1] == "audio_debug") {
				#region audio_debug
				if (array_length_1d(text_part) >= 3) {
					if (text_part[2] == "0" or text_part[2] == "false") {
						audio_debug(false)
					} else {
						audio_debug(true)
					}
				} else {
					audio_debug(true)
				}
				command_done = true
				#endregion
			} else if (text_part[1] == "texture_debug") {
				#region texture_debug
				if (array_length_1d(text_part) >= 3) {
					if (text_part[2] == "0" or text_part[2] == "false") {
						texture_debug_messages(false) // If you get an error you are not on >=2.2.1 so comment this line out  
					} else {
						texture_debug_messages(true) // If you get an error you are not on >=2.2.1 so comment this line out  
					}
				} else {
					texture_debug_messages(true) // If you get an error you are not on >=2.2.1 so comment this line out  
				}
				command_done = true
				#endregion
			} else if (text_part[1] == "speed_set") {
				#region set_speed
				if (array_length_1d(text_part) < 3) {
					temp_post_message = "Please provide a speed"
					event_user(1); // post message to the history 
				} else {
					var speed_to_try = real(text_part[2])
					if (string(speed_to_try) == "") {
						temp_post_message = "Please provide a number for the speed"
						event_user(1); // post message to the history 
					} else {
						game_set_speed(speed_to_try,gamespeed_fps)
						command_done = true
					}
				}
				#endregion
			} else if (text_part[1] == "debug_event") {
				#region debug_event
				
				var debug_event_text = "Console Debug Event"
				if (array_length_1d(text_part) >= 2) {
					debug_event_text = text_part[2]
				}
				debug_event(debug_event_text)
				command_done = true
				#endregion
			}

		}
	#endregion
} else if (text_part[0] == commands[command_1.console]) {
	#region console
		var parse_parts = array_length_1d(text_part)
		
		if (parse_parts == 1) { // object doesnt exist 
			temp_post_message = "Console must have sub commands"
			event_user(1); // post message to the history 
		} else {
			if (text_part[1] == "clear_screen") {
				#region clear_screen
				history_text = 0 // clear history 
				history_text[0] = ""
				history_text_type = 0 // clear history 
				history_text_type[0] = 0 // 1=command, 2=info
				history_text_count = 0
				
				command_done = true
				#endregion
			} else if (text_part[1] == "delete_history") {
				#region delete_history
				if (file_exists(history_file_path)) {
					file_delete(history_file_path);
				}

				history_text = 0 // clear history 
				history_text[0] = ""
				history_text_type = 0 // clear history 
				history_text_type[0] = 0 // 1=command, 2=info
				history_text_count = 0
				
				temp_post_message = starting_text
				event_user(1)
				
				command_done = true
				#endregion
			} else if (text_part[1] == "version") {
				#region version
				temp_post_message = "Console version: "+ string(console_version)
				event_user(1); // post message to the history 
				
				command_done = true
				#endregion
			} else if (text_part[1] == "check_for_updates") {
				#region version
				url_open("http://www.davetech.co.uk/gamemakerdeveloperconsole/"+string(console_version));
				

				command_done = true
				#endregion
			} else if (text_part[1] == "about") {
				#region about
				// It’s possible for you to change this but I'd rather you didn’t, I put A LOT of hard work into this.
				temp_post_message = "Console made by @davesinhispants  -  davetech.co.uk"
				event_user(1); // post message to the history 
				
				command_done = true
				#endregion
			}

		}
	#endregion
} else if (text_part[0] == "h" or text_part[0] == "help" or text_part[0] == "/h" or text_part[0] == "/help") {
	#region help
		temp_post_message = "TYPE IN COMMANDS TO RUN THEM:"
		event_user(1); // post message to the history 
		temp_post_message = "create [obj]"
		event_user(1); // post message to the history 
		temp_post_message = "set [obj] [var to update] [new value]"
		event_user(1); // post message to the history 	
		temp_post_message = "destroy [obj]"
		event_user(1); // post message to the history
		temp_post_message = "view [obj] [var]"
		event_user(1); // post message to the history
		temp_post_message = "script [scr name] [optional arguments]"
		event_user(1); // post message to the history 	
		temp_post_message = "game room_goto [room]"
		event_user(1); // post message to the history 
		
		command_done = true
	#endregion
} else {
	temp_post_message = "WARNING: The Console was asked to do something it doesnt know how to do"
	event_user(1); // post message to the history 
}


if (command_done == true) {
	#region If we successfully parsed something 

		#region move all history down by one 
		if (history_text_count > 0) {
			for (var i = history_text_count-1; i >= 0; --i) {
				history_text[i+1] = history_text[i]
				history_text_type[i+1] = history_text_type[i]
			}
		}
		#endregion

		history_text[0] = text
		history_text_type[0] = 1
		history_text_count ++
		
		#region save history to file
		var save_file;
		save_file = file_text_open_write(history_file_path)
		
		for (var i = 0; i < history_text_count; ++i) { // write all history back into a file so we can view in on later sessions
			if (history_text_type[i] == 1) {
				file_text_write_string(save_file, history_text[i]);
				file_text_writeln(save_file)
			}
		}
		file_text_close(save_file);
		#endregion
		
	
		text = ""
		cursor_at = 0
		cursor_at_stage = -1
		
		textchanged = true
		
		#region clear things out
			predictions = 0
			predictions[0] = ""
			predictions_visible = 0
			predictions_visible[0] = 0 // if we show this command 
			predictions_focused = 0
			predictions_focused[0] = 0 // does this command have focus
			command_to_prediction = 0
			command_to_prediction[0] = 0 // this is a lookup table to go between the full list of predictions and the smaller list of commands
	
			second_level_commands = 0
			second_level_commands[0] = 0
		#endregion
	#endregion
}

