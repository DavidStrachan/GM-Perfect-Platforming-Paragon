/// @description Insert description here
// You can write your code in this editor


draw_set_font(font_timer_main)
draw_set_colour(c_black)
draw_set_halign(fa_left)

if (past_timer_counter > 2) {
	draw_text(20,20,t.play_besttime + ": " + best_time_string)
}
	
for (var i = 0; i < past_timer_counter; ++i) {
	draw_text(20,40+(i*18),past_times_string[i])
}

#region popup
switch (popup_part)
{
    case 0: // down bottom
		draw_set_font(font_timer_popup)
		draw_set_colour(c_white)
		draw_set_halign(fa_center)
		var popup_lerp = lerp(0,1,popup_frame/popup_framesmax[popup_part])
		draw_text_transformed(400,100+(popup_lerp*20),popup_string,popup_lerp,popup_lerp,0)
    break;
    case 1: // stay up
		draw_set_font(font_timer_popup)
		draw_set_colour(c_white)
		draw_set_halign(fa_center)
		draw_text(400,120,popup_string)
    break;
    case 2: // stay up
		draw_set_font(font_timer_popup)
		draw_set_colour(c_white)
		draw_set_halign(fa_center)
		var popup_lerp = lerp(0,1,popup_frame/popup_framesmax[popup_part])
		var draw_y = lerp(120,(40+(past_timer_counter*18)),popup_lerp)
		var popup_scale = 1-(popup_lerp/2)
		draw_text_transformed(400-(popup_lerp*370),draw_y,popup_string,popup_scale,popup_scale,0)

    break;
}
#endregion