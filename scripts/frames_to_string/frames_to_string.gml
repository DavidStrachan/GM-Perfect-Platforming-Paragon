
function frames_to_string(_frames) {
	var _frames_in_sec = game_get_speed(gamespeed_fps)
	var _sec_in_frame = 1/_frames_in_sec
	var _frames_in_min = _frames_in_sec * 60
	
	var fps_min = "0"
	var fps_second = "00"
	var fps_milli = "00"
	
	fps_min = string(floor(_frames/_frames_in_min))
	
	var fps_second_int = floor(_frames/_frames_in_sec) mod 60
	if (fps_second_int < 10) {
		fps_second = "0"+string(fps_second_int)
	} else {
		fps_second = string(fps_second_int)
	}
	
	var fps_milli_int = floor(((_frames*_sec_in_frame) mod 1)*100)

	if (fps_milli_int < 10) {
		fps_milli = "0"+string(fps_milli_int)
	} else if (fps_milli_int < 1) {
		fps_milli = "00"
	} else {
		fps_milli = string(fps_milli_int)
	}
	
	
	return fps_min + ":" + fps_second + "." + fps_milli
}