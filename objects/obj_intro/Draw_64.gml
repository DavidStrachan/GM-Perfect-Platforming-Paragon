/// @description Insert description here
// You can write your code in this editor


draw_set_font(font_intro_interact_popup)
draw_set_halign(fa_center)

var ease_amount = lerp(0,1,animate_frame/animate_frames) //ee(ease.inCubic,animate_frame,animate_frames)

draw_set_colour(c_black)
draw_text_transformed(401,(301)+(ease_amount*40),t.intro_interact_popup,ease_amount,ease_amount,0)
draw_set_colour(c_white)
draw_text_transformed(400,(300)+(ease_amount*40),t.intro_interact_popup,ease_amount,ease_amount,0)

draw_set_halign(fa_left)