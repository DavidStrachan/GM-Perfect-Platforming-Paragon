

// draw_self() this migt cause rounding problems and flickering on web 
draw_sprite_ext(sprite_index,image_index,round(x),round(y),image_xscale,image_yscale,image_angle,c_white,image_alpha)


for (var i = 0; i < record_count-1; ++i) {
	if (i != record_frame) {
	    draw_set_colour(record_line_colour[i])
		draw_line(record_line_x[i],record_line_y[i],record_line_x[i+1],record_line_y[i+1])
	} else {
		draw_set_colour(record_line_colour[record_count-1])
		draw_line(record_line_x[record_count-1],record_line_y[record_count-1],record_line_x[0],record_line_y[0])
	}
}

