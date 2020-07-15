/// @description Predictions for level >=3


#region SECOND LEVEL

third_level = 0 // clear it out  

switch (command_to_run) {
    case command_1.create: 
		#region create
	        third_level[0] = mouse_x
			third_level[1] = mouse_y
			third_level[2] = room_width/2
			third_level[3] = room_height/2
			third_level[4] = 500
			third_level[5] = 0
		#endregion
    break;
    case command_1.view: 
    case command_1.set: 
		#region graph
		
		var object_to_try_and_access = asset_get_index(text_part[1])
		
		if (!object_exists(object_to_try_and_access) or instance_number(object_to_try_and_access) == 0) { // object doesnt exist 
			third_level[0] = ""
			
			// TODO: YOU COULD TURN THE TEXT RED HERE
			
		} else {
			third_level = variable_instance_get_names(object_to_try_and_access.id)
			
			var builtin = array_length_1d(third_level)
			
			third_level[builtin++] = "speed"
			third_level[builtin++] = "x"
			third_level[builtin++] = "y"
			third_level[builtin++] = "direction"
			third_level[builtin++] = "sprite_index"
			third_level[builtin++] = "sprite_width"
			third_level[builtin++] = "sprite_height"
			third_level[builtin++] = "sprite_xoffset"
			third_level[builtin++] = "sprite_yoffset"
			third_level[builtin++] = "image_alpha"
			third_level[builtin++] = "image_angle"
			third_level[builtin++] = "image_blend"
			third_level[builtin++] = "image_index"
			third_level[builtin++] = "image_number"
			third_level[builtin++] = "image_speed"
			third_level[builtin++] = "image_xscale"
			third_level[builtin++] = "image_yscale"
			third_level[builtin++] = "id"
			third_level[builtin++] = "solid"
			third_level[builtin++] = "visible"
			third_level[builtin++] = "persistent"
			third_level[builtin++] = "depth"
			third_level[builtin++] = "object_index"
			third_level[builtin++] = "bbox_bottom"
			third_level[builtin++] = "bbox_left"
			third_level[builtin++] = "bbox_right"
			third_level[builtin++] = "bbox_top"
			third_level[builtin++] = "direction"
			third_level[builtin++] = "friction"
			third_level[builtin++] = "gravity"
			third_level[builtin++] = "gravity_direction"
			third_level[builtin++] = "hspeed"
			third_level[builtin++] = "vspeed"
			third_level[builtin++] = "xstart"
			third_level[builtin++] = "ystart"
		}

		#endregion
    break;
    case command_1.game: 
		#region game

		switch (text_part[1]) {
		    case "speed_set":
		        third_level[0] = 1
				third_level[1] = 5
				third_level[2] = 15
				third_level[3] = 30
				third_level[4] = 60
				third_level[5] = 120
		    break;
		    case "room_goto":
			
				var i = 0
				var still_finding_objects = true
				do {
					if (room_exists(i)) {
						third_level[i] = room_get_name(i)
						i++
					} else {
						still_finding_objects = false
					}
				} until (!still_finding_objects);

			break;
		    case "debug_event":
		        third_level[0] = "debug1"
				third_level[1] = "debug2"
				third_level[2] = "debug3"
				third_level[3] = string(current_hour) + ":" + string(current_minute) + ":" + string(current_second)
				third_level[4] = "here"
		    break;
		    case "debug_overlay":
		    case "texture_debug":
		        third_level[0] = "true"
				third_level[1] = "false"
		    break;
		    default:
		        third_level[0] = "" 
			break;
		}
		
		#endregion
    break;
    default:
    case command_1.destroy: // nothing for these 
    case command_1.script: 
    case command_1.console: 
        third_level[0] = "" 
	break;
}



// put all second level options into this array so we can predict from them 
var total_count_of_third_level_commands = array_length_1d(third_level)
var current_count_of_third_level_commands = 0 
			
for (var i = 0; i < total_count_of_third_level_commands; ++i) {
					
	predictions[i] = third_level[i] // put all predictions into this 
	predictions_visible[i] = false // just set this here and overwrite if it is visible 
					
	if (current_count_of_third_level_commands < prediction_count_max) { // dont allow more predictions than the user wants 
		if (text_part[2] == string_copy(third_level[i],0,string_length(text_part[2]))) {
			second_level_commands[current_count_of_third_level_commands] = third_level[i]
			predictions_visible[i] = true
			command_to_prediction[current_count_of_third_level_commands] = i // this is a lookup table to go between the full list of predictions and the smaller list of commands
			current_count_of_third_level_commands++
		}
	}
}
predict_count = current_count_of_third_level_commands;
#endregion