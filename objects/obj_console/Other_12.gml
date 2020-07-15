/// @description Predictions for level 2


switch (command_to_run) {
	case command_1.set: 
	case command_1.view: 
	case command_1.destroy: 
		#region set/view/destroy
			var c = 0
			var object_list = ds_map_create() // list of all objects you have checked 
			
			var old_length = array_length_2d(second_level,command_1.set)
			for (var i = 0; i < old_length; ++i) { // clear out the old array 
			    second_level[command_1.set,i] = ""
			    second_level[command_1.view,i] = ""
			    second_level[command_1.destroy,i] = ""
			}

			with (all) { // find all unique objects 
				if (!ds_map_exists(object_list, object_index)) { // you have done this object already no need to add its name
					other.second_level[command_1.set,c] = object_get_name(object_index)
					other.second_level[command_1.view,c] = object_get_name(object_index)
					other.second_level[command_1.destroy,c++] = object_get_name(object_index)
					ds_map_add(object_list, object_index, true)
				}
			}

			ds_map_destroy(object_list)
		#endregion
    break;
}




// put all second level options into this array so we can predict from them 
var total_count_of_second_level_commands = array_length_2d(second_level,command_to_run)
var current_count_of_second_level_commands = 0 
			
for (var i = 0; i < total_count_of_second_level_commands; ++i) {
					
	predictions[i] = second_level[command_to_run,i] // put all predictions into this 
	predictions_visible[i] = false // just set this here and overwrite if it is visible 
					
	if (current_count_of_second_level_commands < prediction_count_max) { // dont allow more predictions than the user wants 
		if (text_part[1] == string_copy(second_level[command_to_run,i],0,string_length(text_part[1]))) {
			second_level_commands[current_count_of_second_level_commands] = second_level[command_to_run,i]
			predictions_visible[i] = true
			command_to_prediction[current_count_of_second_level_commands] = i // this is a lookup table to go between the full list of predictions and the smaller list of commands
			current_count_of_second_level_commands++
		}
	}
}
predict_count = current_count_of_second_level_commands;