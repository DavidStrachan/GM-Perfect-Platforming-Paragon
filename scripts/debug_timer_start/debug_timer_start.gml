/// @decription start the timer to see how long code takes 
/// @function time_debug_start


function debug_timer_start() {
	
	
	gml_pragma("forceinline");
	global.debug_start_time = get_timer()
	
}