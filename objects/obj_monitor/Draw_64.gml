/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_monitor)
draw_set_halign(fa_left)
draw_set_alpha(1)

var runningy = 0

draw_set_colour(c_white)

draw_text(x-1,y-1+runningy,"FPS: " +string(worstfps)) 
draw_text(x-1,y+1+runningy,"FPS: " +string(worstfps)) 
draw_text(x+1,y-1+runningy,"FPS: " +string(worstfps)) 
draw_text(x+1,y+1+runningy,"FPS: " +string(worstfps)) 
runningy += dist 

draw_text(x-1,y-1+runningy,"Objects: " +string(instance_count)) 
draw_text(x-1,y+1+runningy,"Objects: " +string(instance_count)) 
draw_text(x+1,y-1+runningy,"Objects: " +string(instance_count)) 
draw_text(x+1,y+1+runningy,"Objects: " +string(instance_count))
runningy += dist 

draw_text(x-1,y-1+runningy,"Wosrt time: " +string(worstspeed)) 
draw_text(x-1,y+1+runningy,"Wosrt time: " +string(worstspeed)) 
draw_text(x+1,y-1+runningy,"Wosrt time: " +string(worstspeed)) 
draw_text(x+1,y+1+runningy,"Wosrt time: " +string(worstspeed)) 
runningy += dist 

draw_set_colour(c_black)
runningy = 0

if (worstfps > room_speed) {
	draw_set_colour(c_black)
} else {
	draw_set_colour(c_red)	
}
draw_text(x,y+runningy,"FPS: " +string(worstfps)) 
var res = 300
var amount = ((res-worstfps) / res) * 100
draw_healthbar(x+160,y+runningy+3,x+230,y+runningy+7,amount,c_black,c_green,c_red,0,true,true)
var amount = ((res-fps_real) / res) * 100
draw_healthbar(x+160,y+runningy+3,x+230,y+runningy+7,amount,c_black,c_yellow,c_yellow,0,false,false)
if (worstfps > room_speed) {
	draw_set_colour(c_white)
} else {
	draw_set_colour(c_purple)	
}
var dontgooverline = x+230-((room_speed/res)*60)
draw_line(dontgooverline,y+runningy+2,dontgooverline,y+runningy+7)

draw_set_colour(c_black)
runningy += dist 
draw_text(x,y+runningy,"Objects: " +string(instance_count)) 
runningy += dist 

if (worstspeed < howlongforframe) {
	draw_set_colour(c_black)
} else {
	draw_set_colour(c_red)	
}
draw_text(x,y+runningy,"Worst time: " +string(worstspeed)) 
var amount = (worstspeed / howlongforframe) * 100
draw_healthbar(x+160,y+runningy+3,x+230,y+runningy+7,amount,c_black,c_green,c_red,0,true,true)
var amount = (steptime / howlongforframe) * 100
draw_healthbar(x+160,y+runningy+3,x+230,y+runningy+7,amount,c_black,c_yellow,c_yellow,0,false,false)

runningy += dist 
draw_set_colour(c_white)
draw_text(x-1,y-1+runningy,"Surfaces: " +string(countsurfaces)) 
draw_text(x-1,y+1+runningy,"Surfaces: " +string(countsurfaces)) 
draw_text(x+1,y-1+runningy,"Surfaces: " +string(countsurfaces)) 
draw_text(x+1,y+1+runningy,"Surfaces: " +string(countsurfaces)) 
draw_set_colour(c_black)
draw_text(x,y+runningy,"Surfaces: " +string(countsurfaces)) 

runningy += dist 
draw_set_colour(c_white)
draw_text(x-1,y-1+runningy,"Dropped Frames: " +string(frames_not_fast_enough)) 
draw_text(x-1,y+1+runningy,"Dropped Frames: " +string(frames_not_fast_enough)) 
draw_text(x+1,y-1+runningy,"Dropped Frames: " +string(frames_not_fast_enough)) 
draw_text(x+1,y+1+runningy,"Dropped Frames: " +string(frames_not_fast_enough)) 
draw_set_colour(c_black)
// red text if problem 
if (frames_not_fast_enough > 0) {
	draw_set_colour(c_red)
}
draw_text(x,y+runningy,"Dropped Frames: " +string(frames_not_fast_enough)) 
var amount = (frames_not_fast_enough / recordframes) * 100
draw_healthbar(x+160,y+runningy+3,x+230,y+runningy+7,amount,c_black,c_red,c_red,0,true,true)

runningy += dist 
draw_set_colour(c_white)
draw_text(x-1,y-1+runningy,"Deltatime: "+string(DT)) 
draw_text(x-1,y+1+runningy,"Deltatime: "+string(DT)) 
draw_text(x+1,y-1+runningy,"Deltatime: "+string(DT)) 
draw_text(x+1,y+1+runningy,"Deltatime: "+string(DT)) 
draw_set_colour(c_black)
draw_text(x,y+runningy,"Deltatime: "+string(DT)) 
draw_healthbar(x+160,y+runningy+3,x+230,y+runningy+7,((DT-1)*30),c_black,c_red,c_red,0,true,true)
/*
runningy += dist 
var puppettest = "puppet 0:"+string(obj_steam.puppet_id[|0])+"      puppet 1:"+string(obj_steam.puppet_id[|1])+"      puppet 2:"+string(obj_steam.puppet_id[|2])
draw_set_colour(c_white)
draw_text(x-1,y-1+runningy,puppettest) 
draw_text(x-1,y+1+runningy,puppettest) 
draw_text(x+1,y-1+runningy,puppettest) 
draw_text(x+1,y+1+runningy,puppettest) 
draw_set_colour(c_black)
draw_text(x,y+runningy,puppettest) 

runningy += dist 
var puppettest = "puppet name 0:"+string(obj_steam.puppet_name[|0])+"      puppet name 1:"+string(obj_steam.puppet_name[|1])+"      puppet name 2:"+string(obj_steam.puppet_name[|2])
draw_set_colour(c_white)
draw_text(x-1,y-1+runningy,puppettest) 
draw_text(x-1,y+1+runningy,puppettest) 
draw_text(x+1,y-1+runningy,puppettest) 
draw_text(x+1,y+1+runningy,puppettest) 
draw_set_colour(c_black)
draw_text(x,y+runningy,puppettest) 

runningy += dist 
var puppettest = "local 0:"+string(obj_global.local_player_id[0])+"      local 1:"+string(obj_global.local_player_id[1])+"      local 2:"+string(obj_global.local_player_id[2])+"      local 3:"+string(obj_global.local_player_id[3])
draw_set_colour(c_white)
draw_text(x-1,y-1+runningy,puppettest) 
draw_text(x-1,y+1+runningy,puppettest) 
draw_text(x+1,y-1+runningy,puppettest) 
draw_text(x+1,y+1+runningy,puppettest) 
draw_set_colour(c_black)
draw_text(x,y+runningy,puppettest) 

runningy += dist 
var puppettest = "on 0:"+string(obj_global.playeron[0])+"      on 1:"+string(obj_global.playeron[1])+"      on 2:"+string(obj_global.playeron[2])+"      on 3:"+string(obj_global.playeron[3])
draw_set_colour(c_white)
draw_text(x-1,y-1+runningy,puppettest) 
draw_text(x-1,y+1+runningy,puppettest) 
draw_text(x+1,y-1+runningy,puppettest) 
draw_text(x+1,y+1+runningy,puppettest) 
draw_set_colour(c_black)
draw_text(x,y+runningy,puppettest) 

runningy += dist 
var puppettest = "contr 0:"+string(obj_global.local_player_controls[0])+"      contr 1:"+string(obj_global.local_player_controls[1])+"      contr 2:"+string(obj_global.local_player_controls[2])+"      contr 3:"+string(obj_global.local_player_controls[3])
draw_set_colour(c_white)
draw_text(x-1,y-1+runningy,puppettest) 
draw_text(x-1,y+1+runningy,puppettest) 
draw_text(x+1,y-1+runningy,puppettest) 
draw_text(x+1,y+1+runningy,puppettest) 
draw_set_colour(c_black)
draw_text(x,y+runningy,puppettest) 
*/

/*
#region move whole timing array down
draw_set_colour(c_red)
for (var i = recordframes; i > 1; --i) {
	draw_text(500,i*20,"t: " +string(timings[i])) 
}
#endregion
*/
