/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_delete_med)
var helper_v_distance = 24

// pick side 
if (1 == 2) { //obj_player.x > room_width/2) { // left 
	draw_set_halign(fa_left)
	var helper_start_x = 20
	var helper_start_y = 20
} else { // right 
	draw_set_halign(fa_right)
	var helper_start_x = 800-60
	var helper_start_y = 20
}

for (var i = 0; i < helper.size; ++i) {
	
	
	draw_set_colour(c_black)
    draw_text(helper_start_x+1,helper_start_y+(i*helper_v_distance)+1,t.helper_name[i])
	draw_set_colour($333333)
    draw_text(helper_start_x,helper_start_y+(i*helper_v_distance),t.helper_name[i])
	
	if (helper_used_all) {
		if (helper_on[i]) {
			// draw_text(helper_start_x-280,helper_start_y+(i*helper_v_distance),t.on)
		} else {
			draw_text(helper_start_x-280,helper_start_y+(i*helper_v_distance),t.off)
		}
	}
	
	if (helper_used[i] == true) {
		draw_sprite(spr_checkbox,1,helper_start_x+20,helper_start_y+(i*helper_v_distance)+12)
		var bar_size = 11 - clamp(helper_frame[i]/25,0,11)
		if (bar_size > 1) {
			draw_set_colour($333333)
			draw_rectangle(helper_start_x+35,helper_start_y+(i*helper_v_distance)-bar_size + 17,helper_start_x+37,helper_start_y+(i*helper_v_distance) + 17,false)
		}
	} else {
		draw_sprite(spr_checkbox,0,helper_start_x+20,helper_start_y+(i*helper_v_distance)+12)
	}
	
}


// allow players to change what helpers they have on 
if (helper_used_all) {
	draw_set_halign(fa_right)
	draw_set_colour(c_black)
	draw_set_font(font_gui_controls_for_helpers)
	draw_text(780,580,t.gui_controls_for_helpers)
}