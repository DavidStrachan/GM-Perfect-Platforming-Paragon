/// @description Insert description here


#region keyboard buttons						<- You might want to add or remove keys here
// keys used to display the console
displaykey[0] = 223 // ` Qwerty
displaykey[1] = 220	// § Qwertz/Apple
displaykey[2] = 112	// F1
// keys used to hide the console
closekey[0] = 223 // ` Qwerty
closekey[1] = 220 // § Qwertz/Apple
closekey[2] = 112 // F1
closekey[3] = 27  // Esc


open_me_key_count = array_length_1d(displaykey)
close_me_key_count = array_length_1d(closekey)
#endregion
#region settings
prediction_count_max = 11			// when typing how many predictions do you want in the drop down
history_count_max = 20				// how much history do you want saved 
history_file_name = "console.txt"	// what do you want the save file to be called 
view_history_datapoints = 500		// When drawing a graph how many points to draw (look if you are going to draw 100 graphs its going to chug you can solve this by making this number smaller)
starting_text = "Welcome to Dave's Developer Console! You can change this text in the Create Event" // This text is displayed to users the first time they use the console 
#endregion
#region colours/style							<- You can change colours here
history_background_col =	make_colour_rgb(0,0,0)
history_background_alpha =	0.8
history_text_col =			make_colour_rgb(173,173,173)
history_text_col_info =		make_colour_rgb(144,113,80)
history_text_col_focus =	make_colour_rgb(255,182,104)
history_text_col_hover =	make_colour_rgb(255,132,0)
history_text_alpha =		1
history_text_shadow =		0.2 // 0=off, 1=full on, decimal=amount of opacity 
history_border_col =		make_colour_rgb(255,132,0)
history_border_alpha =		1
main_background_col =		make_colour_rgb(60,60,60)
main_background_alpha =		0.8
main_text1_col =			make_colour_rgb(255,255,255) // this is the first part of the parsed text
main_text2_col =			make_colour_rgb(160,160,160) // this is arguments that are not in focus 
main_text3_col =			make_colour_rgb(255,132,0) // this is the colour as you type to form a word (and the selected word)
main_text_alpha =			1
main_text_shadow =			0.3 // 0=off, 1=full on, decimal=amount of opacity 
main_text_bad_col =			make_colour_rgb(241,186,186) // colour used if the colsone cant parse the code
main_border_col =			make_colour_rgb(209,209,209)
main_border_alpha =			1
main_mouse_selected_col =	make_colour_rgb(255,132,0)
predict_background_col =	make_colour_rgb(0,0,0)
predict_background_alpha =	0.3
predict_text_col =			make_colour_rgb(255,255,255)
predict_text_alpha =		1
predict_text_shadow =		0.7 // 0=off, 1=full on, decimal=amount of opacity 
predict_border_col =		make_colour_rgb(0,0,0)
predict_border_alpha =		0.7
focus_background_col =		make_colour_rgb(60,60,60)
focus_background_alpha =	1
focus_text_col =			make_colour_rgb(255,132,0)
focus_arrow_colour =		make_colour_rgb(255,132,0)
view_background_col =		make_colour_rgb(60,60,60)
view_background_alpha =		0.8
view_border_col =			make_colour_rgb(250,250,250)
view_border_alpha =			1
view_text_title_col =		make_colour_rgb(255,255,255)
view_text_value_col =		make_colour_rgb(255,132,0)
view_text_name_col =		make_colour_rgb(255,132,0)
view_data_bar_col =			make_colour_rgb(255,132,0)
view_data_bar_alpha =		0
view_data_top_col =			make_colour_rgb(255,132,0)
view_data_top_alpha =		1
view_intro_highlight_col =	make_colour_rgb(255,255,255)
#endregion
#region heights/widths/sizes
pos_top = -1 // where it starts on the screen
pos_height = 300 // how tall the history area is (the textbox starts after this)
pos_margin_sides = 24 // how far away from the sides the box should be 
pos_inner_padding_sides = 20 // how much room should there be between the text and the side of the box
pos_inner_padding_bottom = 25 // this is how much room is between the bottom of the text area and the bottom text line
main_area_height = 40 // the height of the text area 
main_area_inner_padding_sides = 50 // how far away from the left side the text starts on the main area 
history_line_height = 24
predict_line_height = 22
view_bottom_margin = floor(display_get_gui_height()/2) // where viewing vars is displayed on the screen
view_bottom_padding = 10
view_left_margin = floor(display_get_gui_width()/2) // where viewing vars is displayed on the screen
view_left_padding = 60 // this is also the space the number data to go 
view_data_height = 32
view_data_width = 110
view_each_height = 50
#endregion
#region animations 
display_frames = 27
display_frame = 0
display_direction = 0
display_open_speed = 60
display_close_speed = 80
predict_grow_speed = 740 // in px
predict_shrink_speed = 530 // in px

dt = delta_time / 1000000
#endregion
#region font
font_for_main = font_console
#endregion
#region only 1 of this object allowed 
if (instance_number(obj_console) > 1) {
	instance_destroy()
}
#endregion
#region pre cache sizes (don’t edit these)
history_x1 = pos_margin_sides
history_y1 = pos_top
history_x2 = display_get_gui_width()-pos_margin_sides // I do this on open as well incase its changed
history_y2 = pos_top+pos_height
history_text_x = history_x1+pos_inner_padding_sides
history_text_y = history_y2-pos_inner_padding_bottom
	
main_x1 = history_x1
main_y1 = history_y2 + 1
main_x2 = history_x2
main_y2 = main_y1 + main_area_height

predict_x1 = main_x1
predict_y1 = 0 // worked out each frame
predict_x2 = main_x2
predict_y2 = history_y2 // worked out each frame
predict_y2_draw = history_y2

text_start_x = main_x1+main_area_inner_padding_sides
text_end_x = text_start_x
text_y = main_y1+floor((main_y2-main_y1)/2)

view_data_left_x = view_left_margin + view_left_padding
view_data_right_x = view_data_left_x + view_data_width + view_left_padding
#endregion
#region Initialise stuffs
predict_count = 0 // how many predictions are in the list
text = "" // THE TEXT
text_changed = true // has the text changed this frame?
text_char_length[0] = 0 // how wide each character is 
text_char_running_length[0] = 0 // how many pixels from this character to the left most character 
cursor_at = 0 // where the focus is in the text
cursor_at_stage = -1 // -1 is very right most, all stages start from 0 upwards 
cursor_at_stage_last = -1 // if the person changes stage clear out what they have focused
stage_count = 0 // number of stages 
stage_text_length[0] = 0 // how many characters in this stage of the text
stage_text_running_length[0] = 0 // how many characters from the end of this stage to the start of the text 
good_first_stage = false
command_to_run = -1
focus = 0 // This is the vertical selection, 0=text areas, <=-1 predictions, >=1 history 
temp_post_message = "" // if you put some text in here and then run user_event_1 it will post it into the histroy 
history_file_path = working_directory + history_file_name
view_destroyed_frames = 200 // if you are tracking a variable and it gets destroyed keep the popup on the screen for this long
view_intro_highlight_frames = 10 // when you spawn one give it a new colour for this many frames
mouse_selection_start = 0 // when the mouse is used to select text the start character 
mouse_selection_end = 0 // when the mouse is used to select text the start character 
mouse_selection_temp = -1 // This is used to hold the position the mouse was clicked before 
mouse_x_last = device_mouse_x_to_gui(0) // I use this to see if the mouse has moved 
mouse_y_last = device_mouse_y_to_gui(0)
history_mouse_hover = -1 // if the mouse is over one of the history things
enter_action = 0 // What to do when enter is pressed: 0=Textbox, 1=History

console_version = "0.3.2"
#endregion
#region cursor 
flash_frames = 45
flash_frame = 0
flash_frames_half = floor(flash_frames/2)
#endregion
#region holding down delete/backspace 
holding_delete_frames = 0
holding_backspace_frames = 0
holding_frame_to_activate = 15 // how many frames must you hold before it represses
holding_frame_delete_speed = 4 // how many frames between deletions when being held
#endregion
#region delimiters 
var i = 0
delimiters[i++] = " "
delimiters[i++] = "."
delimiters[i++] = ","
delimiters[i++] = "("
delimiters[i++] = ")"
delimiters[i++] = "="
delimiter_count = i++
#endregion
#region text break down
text_part[0] = ""
#endregion
#region history 
history_text[0] = ""
history_text_type[0] = 0 // 1=command, 2=info
history_text_count = 0

	#region load from save file 
	var lastline = "" // dont load the last line twice 
	var thisline = ""
	
	if (file_exists(history_file_path)) {
		var i, save_file;
		save_file = file_text_open_read(history_file_path);
		
		for (i = 0; i < history_count_max; ++i) {
			if(!file_text_eoln(save_file)) {
				
				thisline = file_text_read_string(save_file); // get this line out of the saved file 
				
				if (thisline != lastline) { // dont load the same line twice 
				
					history_text[i] = thisline
					history_text_type[i] = 1 // 1=command, 2=info
					history_text_count++
					lastline = thisline
					
				}
				
				file_text_readln(save_file); // next line down
				
			} else {
				break;	
			}
		}

		file_text_close(save_file);
	} else {
		// if there is no save file to load display this 
		temp_post_message = starting_text
		event_user(1)
	}
	#endregion
#endregion
#region viewing data 
view_active_count = 0
view_text[0] = "No Data"
view_title[0] = "No Data"
view_obj[0] = -1
view_min[0] = 9999999
view_max[0] = 9999999
view_last_data[0] = 0
view_type[0] = 0 // 0=int, 1=str, 2=array, 3=destroyed
view_destroyed_frame[0] = view_destroyed_frames // if you are tracking a variable and it gets destroyed keep the popup on the screen for this long
view_recalculate[0] = false
view_graph_pixels[0,0] = 0
view_graph_data[0,0] = 0
view_next_insert[0] = 0
view_intro_highlight_frame[0] = view_intro_highlight_frames
#endregion
#region top level commands
var i = 0
enum command_1 {
	create,
	set,
	destroy,
	view,
	script,
	game,
	console, 
	
	size
}

commands[command_1.create]	= "create"
commands[command_1.set]		= "set" // edit also works 
commands[command_1.destroy] = "destroy"
commands[command_1.view]	= "view"
commands[command_1.script]	= "script"
commands[command_1.game]	= "game"
commands[command_1.console] = "console"

commands_visible = array_create(command_1.size,false) // if we show this command 
commands_focused = array_create(command_1.size,false) // does this command have focus
#endregion
#region second level commands 

	predictions[0] = ""
	predictions_visible[0] = 0 // if we show this command 
	predictions_focused[0] = 0 // does this command have focus
	command_to_prediction[0] = 0 // this is a lookup table to go between the full list of predictions and the smaller list of commands
	
	second_level_commands[0] = 0
	
	#region create
		//get all objects 
		var i = 0
		var still_finding_objects = true
		do {
			if (object_exists(i)) {
				second_level[command_1.create,i] = object_get_name(i)
				second_level[command_1.set,i] = second_level[command_1.create,i] // naughty of me to put this here as it breaks the layout but it is less code 
				second_level[command_1.destroy,i] = second_level[command_1.create,i] // naughty of me to put this here as it breaks the layout but it is less code 
				second_level[command_1.view,i] = second_level[command_1.create,i] // naughty of me to put this here as it breaks the layout but it is less code 
				i++
			} else {
				still_finding_objects = false
			}
		} until (!still_finding_objects);
	#endregion
	#region set
		// naughty me put this in the create one because it is less code 
	#endregion
	#region destroy
		// naughty me put this in the create one because it is less code 
	#endregion
	#region view
		// naughty me put this in the create one because it is less code 
	#endregion
	#region script
		
		//get all scripts 
		var i = 0
		var still_finding_objects = true
		do {
			if (script_exists(i)) {
				second_level[command_1.script,i] = script_get_name(i)
				i++
			} else {
				still_finding_objects = false
			}
		} until (!still_finding_objects);
	#endregion
	#region game
		var i = 0
		second_level[command_1.game,i++] = "speed_set"
		second_level[command_1.game,i++] = "resource_count"
		second_level[command_1.game,i++] = "instance_count"
		second_level[command_1.game,i++] = "restart"
		second_level[command_1.game,i++] = "fullscreen_toggle"
		second_level[command_1.game,i++] = "room_restart"
		second_level[command_1.game,i++] = "room_goto"
		second_level[command_1.game,i++] = "debug_overlay"
		second_level[command_1.game,i++] = "debug_audio" // audio_debug also works
		second_level[command_1.game,i++] = "texture_debug"
		second_level[command_1.game,i++] = "debug_event"
	#endregion
	#region console
		var i = 0
		second_level[command_1.console,i++] = "clear_screen"
		second_level[command_1.console,i++] = "delete_history"
		second_level[command_1.console,i++] = "version"
		second_level[command_1.console,i++] = "check_for_updates"
		second_level[command_1.console,i++] = "about"
	#endregion
#endregion
#region third level commands
third_level[0] = ""
#endregion
