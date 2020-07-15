/// @description Insert description here
// You can write your code in this editor

depth = 9999999
x = 30
y = room_height - 140

dist = 20
worstspeed = 0
worstfps = 0

steptimestart = 0
steptime = 0 // how long this frame took


recordframes = room_speed * 3 // 3 seconds

timings[recordframes] = 0
fpsrecordings[recordframes] = 0

howlongforframe = 1000000 / room_speed

countsurfaces = 0

frames_not_fast_enough = 0

debug_sound_on = true