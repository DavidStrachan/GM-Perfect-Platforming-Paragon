/// @description 

randomise()

#region development mode

	#macro DEVELOPMENT false 
	#macro dev:DEVELOPMENT true

	if (DEVELOPMENT == true) {
	
		// put game in a window 	
		window_set_fullscreen(false)
		window_set_size(room_width/1.2,room_height/1.2)
	
		// debugging stuff
		//audio_debug(true)
		show_debug_overlay(true)
		texture_debug_messages(true);
	
	} else {
		gml_release_mode(true) // when debugging 	
	}
	
#endregion
#region create all objects you want to be around forever here
	// Note: if you use instance_deactivate_all() you will want to activate these 

	instance_create_depth(0,0,20000,obj_console)

	if (DEVELOPMENT) {
		instance_create_depth(0,0,0,obj_monitor)
	}
#endregion
#region delta time stuff
target_delta = 1/game_get_speed(gamespeed_fps)
global.delta_multiplier = 1
#macro DT global.delta_multiplier
#endregion
#region Pick and load a language 
if (DEVELOPMENT) {
	load_language(global.local_list[irandom(global.local_count-1)]) 
} else {
	var language_from_os = os_get_language()
	var language_array_id = in_array(os_get_language(),global.local_list_code)
	if (language_array_id < 0 and language_array_id != "") {
		load_language(language_from_os)
	} else {
		load_language("en")
	}
}
#endregion