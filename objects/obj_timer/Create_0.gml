
checkpoint_count = instance_number(obj_checkpoint)
checkpoint_done = array_create(checkpoint_count,false)
race_timer = 0 

past_times = []
past_times_string = []
past_timer_counter = 0


best_time_frames = 100000
best_time_string = ""


popup_string = ""
popup_speed = 0
popup_frame = 0 
popup_framesmax[0] = 5 // popup
popup_framesmax[1] = 100 // stay on screen
popup_framesmax[2] = 20 // to top left
popup_framesmax[3] = 20 // end 


popup_part = 3 // what part of the animation we are on 