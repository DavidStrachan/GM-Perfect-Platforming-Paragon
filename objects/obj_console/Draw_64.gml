/// @description Insert description here


if (display_frame > 0) { // draw something 

	#region backgrounds 
	
	// HISTORY BACKGROUND 
	draw_set_colour(history_background_col)
	draw_set_alpha(history_background_alpha)
	draw_rectangle(history_x1+1,history_y1,history_x2,history_y2_draw,false)

	// HISTORY BORDER
	draw_set_colour(history_border_col)
	draw_set_alpha(history_border_alpha)
	draw_rectangle(history_x1,history_y1,history_x2,history_y2_draw,true)

	// MAIN BACKGROUND 
	draw_set_colour(main_background_col)
	draw_set_alpha(main_background_alpha)
	draw_rectangle(main_x1+1,main_y1_draw,main_x2,main_y2_draw,false)

	// MAIN BORDER
	draw_set_colour(main_border_col)
	draw_set_alpha(main_border_alpha)
	draw_rectangle(main_x1,main_y1_draw,main_x2,main_y2_draw,true)

	if (display_frame >= display_frames) { // predictions can only be seen at full open 

		// PREDICT BACKGROUND 
		draw_set_colour(predict_background_col)
		draw_set_alpha(predict_background_alpha)
		draw_rectangle(predict_x1+1,predict_y1,predict_x2,predict_y2_draw,false)

		// PREDICT BORDER
		draw_set_colour(predict_border_col)
		draw_set_alpha(predict_border_alpha)
		draw_rectangle(predict_x1,predict_y1,predict_x2,predict_y2_draw,true)

	}

	#endregion

	#region main text
	draw_set_colour(main_text1_col)
	draw_set_font(font_for_main)
	draw_set_alpha(1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	
	if (good_first_stage == false) {draw_set_colour(main_text_bad_col)}
	
	var textlength = string_length(text)

	if (flash_frame < flash_frames_half) { // cursor 
        var character_to_get = clamp(cursor_at,0,textlength+1) 
        var cursor_x = text_start_x+text_char_running_length[character_to_get]+1
		if (cursor_at == 0) {cursor_x = text_start_x} // if the cursor is as left as it can be
		draw_line(cursor_x,main_y1+8,cursor_x,main_y2-8)
	}
	
	if (focus == 0) { // the arrow if text box has focus 
		draw_set_colour(focus_text_col)
		draw_text(text_start_x-12,text_y,">")
		draw_set_colour(main_text1_col)
	}
	
	draw_set_alpha(main_text_alpha)
	// text 
	for (var i = 0; i < textlength; ++i) {
		
		var thechar = string_char_at(text,i+1)
		
		if (thechar == " ") { // This is just a really simple way to set the colour of the first part to be different from other parts
			draw_set_colour(main_text2_col)
		}
		
		// Where we want each character drawn:
		var main_text_x = text_start_x+text_char_running_length[i]
		var main_text_y = text_y_draw
		
		#region draw the text shadow
		if (main_text_shadow > 0) { // text shadow 
			draw_set_alpha(main_text_shadow)
			var old_colour = draw_get_colour();
			draw_set_colour(c_black);
			draw_text(main_text_x+1,main_text_y+1,thechar)
			draw_set_alpha(main_text_alpha) // reset everything
			draw_set_colour(old_colour);
		}
		#endregion
		#region is it selected by the mouse?
		var text_selected_by_mouse = false
		if (i >= mouse_selection_start and i < mouse_selection_end) {
			var old_colour = draw_get_colour();
			draw_set_colour(main_mouse_selected_col)
			text_selected_by_mouse = true
		}
		#endregion
		
		draw_text(main_text_x,main_text_y,thechar) // DRAW MAIN TEXT
		
		#region If the text was selected reset to the old colour
		if (text_selected_by_mouse) {
			draw_set_colour(old_colour);
		}
		#endregion
	}

	
	#endregion
	
	#region history text
	for (var i = 0; i < history_text_count; ++i) {
		
		var history_text_x_draw = history_text_x 
		var history_text_col_draw = history_text_col 
	
		#region if I'm focused 
		if (focus == i+1) {
			history_text_x_draw += 30 
			history_text_col_draw = history_text_col_focus
		}
		#endregion
		
	    if (history_text_shadow > 0) {
			draw_set_colour(c_black)
			draw_set_alpha(history_text_shadow)
			
			draw_text(history_text_x_draw+1,history_text_y_draw-(history_line_height*i)+1,history_text[i])
		}
		
		if (history_text_type[i] == 1) { // different colour for information text
			if (history_mouse_hover == i+1) { // if the mouse if hovering over the text
				draw_set_colour(history_text_col_hover)
			} else {
				draw_set_colour(history_text_col_draw)
			}
		} else {
			draw_set_colour(history_text_col_info)
		}
		draw_set_alpha(history_text_alpha)
			
		draw_text(history_text_x_draw,history_text_y_draw-(history_line_height*i),history_text[i])
	}
	
	
	
	#endregion
	
	#region prediction area
	if (display_frame >= display_frames) { // predictions can only be seen at full open 
		
		draw_set_alpha(predict_text_alpha)
		draw_set_colour(predict_text_col)
		
		#region cursor at first stage of predictions (or blank)
		
		
			if (cursor_at_stage <= 0) {
			
				var running_predictions_count = 0
		
				for (var i = 0; i < command_1.size; ++i) {
					if (commands_visible[i] == true) {

						draw_set_colour(predict_text_col)
						
						// Where we want each prediction drawn:
						var predict_text_x = text_start_x
						var predict_text_y = predict_y1+(predict_line_height*running_predictions_count)+10
						
						#region focus
						if (commands_focused[i] == true) {
							// This one has focus 
							var previous_alpha = draw_get_alpha()
							draw_set_alpha(focus_background_alpha)
							draw_set_colour(focus_background_col)
							draw_rectangle(predict_text_x,predict_text_y-10,text_end_x+10,predict_text_y+10,false)
							
							// draw the arrow 
							draw_set_colour(focus_text_col)
							draw_text(predict_text_x-10,predict_text_y,">")
							
							draw_set_alpha(previous_alpha)
						}

						#endregion
						
						#region draw prediction shadow 
						if (predict_text_shadow > 0) { // text shadow 
							draw_set_alpha(predict_text_shadow)
							var old_colour = draw_get_colour();
							draw_set_colour(c_black);
							draw_text(predict_text_x+1,predict_text_y+1,commands[i])
							draw_set_alpha(predict_text_alpha) // reset everything
							draw_set_colour(old_colour);
						}
						#endregion
						
					    draw_text(predict_text_x,predict_text_y,commands[i])
						running_predictions_count++
					}
			
					if (running_predictions_count >= prediction_count_max) {break;} // limit to the max number of predictions
		
				}
			}
		#endregion
		
		#region other levels of prediction 
			
			if (cursor_at_stage >= 1) {
				var second_level_length = array_length_1d(second_level_commands)
				for (var i = 0; i < second_level_length; ++i) {
					
					draw_set_colour(predict_text_col)
			
					// Where we want each prediction drawn:
					var predict_text_x = text_start_x+text_char_running_length[stage_text_running_length[cursor_at_stage]]+10
					var predict_text_y = predict_y1+(predict_line_height*i)+10
					
						#region focus
						if (predictions_focused[command_to_prediction[i]] == true) {

							// This one has focus 
							var previous_alpha = draw_get_alpha()
							draw_set_alpha(focus_background_alpha)
							draw_set_colour(focus_background_col)
							draw_rectangle(predict_text_x,predict_text_y-10,text_end_x+10,predict_text_y+10,false)
							
							// draw the arrow 
							draw_set_colour(focus_text_col)
							draw_text(predict_text_x-10,predict_text_y,">")
							
							draw_set_alpha(previous_alpha)
						}

						#endregion

					#region draw prediction shadow 
					if (predict_text_shadow > 0) { // text shadow 
						draw_set_alpha(predict_text_shadow)
						var old_colour = draw_get_colour();
						draw_set_colour(c_black);
						draw_text(predict_text_x+1,predict_text_y+1,second_level_commands[i])
						draw_set_alpha(predict_text_alpha) // reset everything
						draw_set_colour(old_colour);
					}
					#endregion
			
					draw_text(predict_text_x,predict_text_y,second_level_commands[i])
					
					if (predict_text_y > predict_y2_draw) {break;} // dont load things out of the animation 
					if (i >= prediction_count_max) {break;} // limit to the max number of predictions

				}
			}
		#endregion

	}
	#endregion

}

#region The whole graphing variables 

if (view_active_count > 0) { // draw any graphs we need 
	
	draw_set_font(font_for_main)
	draw_set_valign(fa_middle)
	
	// outer box
	var view_pos_boundary_x1 = view_left_margin 
	var view_pos_boundary_y1 = view_bottom_margin-(view_each_height*view_active_count)-view_bottom_padding
	var view_pos_boundary_x2 = view_data_right_x
	var view_pos_boundary_y2 = view_bottom_margin+view_bottom_padding
	// innerbox
	var view_pos_area_x1 = view_left_margin+view_left_padding
	var view_pos_area_y1 = view_pos_boundary_y1 + view_bottom_padding
	var view_pos_area_x2 = view_data_right_x - view_left_padding
	var view_pos_area_y2 = view_pos_boundary_y2 - view_bottom_padding
	
	var view_pos_middle_x = ((view_pos_area_x2 - view_pos_area_x1)/2) + view_pos_area_x1
	
	#region draw background 
	draw_set_colour(view_background_col)
	draw_set_alpha(view_background_alpha)
	draw_rectangle(view_pos_boundary_x1, view_pos_boundary_y1,view_pos_boundary_x2,view_pos_boundary_y2,false)
	draw_set_colour(view_border_col)
	draw_set_alpha(view_border_alpha)
	draw_rectangle(view_pos_boundary_x1, view_pos_boundary_y1,view_pos_boundary_x2,view_pos_boundary_y2,true)
	#endregion

	for (var i = 0; i < view_active_count; ++i) {
		
		var my_area_height = view_pos_area_y1+(view_each_height*(i+1))
		
		#region if this is a newly created area and needs a highlight 
			if(view_intro_highlight_frame[i] > 0) {
				draw_set_colour(view_intro_highlight_col)
				draw_set_alpha(view_intro_highlight_frame[i] / view_intro_highlight_frames)
				
				var wholebg = view_pos_boundary_y1+(view_each_height*(i))+view_bottom_padding
				draw_rectangle(view_pos_boundary_x1, wholebg,view_pos_boundary_x2,wholebg+view_each_height,false)
			}
		#endregion
		
		#region title of each block
		draw_set_colour(view_text_title_col)
		draw_set_alpha(1)
		draw_set_halign(fa_middle)
		draw_text_transformed(view_pos_middle_x, my_area_height-view_data_height-10, view_title[i],0.8,0.8,0)
		#endregion

		switch (view_type[i]) {
		    case 0: // int
				#region int
					#region data for each block 
					draw_set_colour(view_text_value_col)
					draw_set_halign(fa_left)
					draw_text(view_pos_area_x2+5, my_area_height-view_data_height+15, view_last_data[i])
					#endregion
		
					#region min and max each block
					draw_set_colour(view_text_title_col)
					draw_set_halign(fa_right)
					draw_text_transformed(view_pos_area_x1-5, my_area_height-view_data_height+5, view_max[i],0.8,0.8,0)
					draw_text_transformed(view_pos_area_x1-5, my_area_height-view_data_height+view_data_height-5, view_min[i],0.8,0.8,0)
					#endregion
		
					draw_set_colour(view_data_top_col)
					draw_set_alpha(view_data_top_alpha)
					var data_distance = view_data_width/view_history_datapoints
					for (var j = 0; j < view_history_datapoints; ++j) {
						if (view_graph_pixels[i,j] != -8765.43) { // Just a number I thought was unlikley to come up
							draw_point(view_pos_area_x1+(j*data_distance),my_area_height-view_graph_pixels[i,j])
						}
					}

				#endregion
		    break;
		    case 1: // str
				#region str
					draw_set_colour(view_text_value_col)
					draw_set_halign(fa_left)
					draw_text(view_pos_area_x1-15, my_area_height-view_data_height+5, view_last_data[i])
				#endregion
		    break;
		    case 2: // array
		        // code here
		    break;
		    case 3: // destroyed
				#region destroyed
					draw_set_colour(view_text_value_col)
					draw_set_halign(fa_middle)
					draw_text(view_pos_middle_x, my_area_height-view_data_height+15, "Object Removed")
				#endregion
		    break;
		}
		
	}
	
}

#endregion

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(1)
