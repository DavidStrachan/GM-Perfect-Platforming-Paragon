/// @description Insert description here
// You can write your code in this editor


steptime = get_timer()-steptimestart

#region move whole timing array down
worstspeed = 0
worstfps = 999999

frames_not_fast_enough = 0
for (var i = recordframes; i > 0; --i) {
    timings[i] = timings[i-1]
	if (timings[i] > worstspeed) {
		worstspeed = timings[i]
	}
	
	fpsrecordings[i] = fpsrecordings[i-1]
	if (fpsrecordings[i] < worstfps) {
		worstfps = fpsrecordings[i]
	}
	
	// count number of frames that were slower than room speed 
	if (fpsrecordings[i] < fps) {frames_not_fast_enough++}
		
}
#endregion

	
timings[0] = steptime
fpsrecordings[0] = fps_real


worstspeed = round(worstspeed)
worstfps = round(worstfps)