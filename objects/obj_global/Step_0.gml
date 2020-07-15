/// @description Insert description here
// You can write your code in this editor

// DELTATIME STUFF
var actual_delta = delta_time/1000000
global.delta_multiplier = 1//actual_delta/target_delta



#region see language strings 
if (keyboard_check_pressed(223)) { // if ` key pressed
	last_language_pack = global.current_language
	load_language("string") // technically if it cant find a column with the name it will load this column 
} else if (keyboard_check_released(223)) {
	load_language(last_language_pack)
}
#endregion
