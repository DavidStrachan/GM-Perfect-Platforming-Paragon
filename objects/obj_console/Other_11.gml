/// @description Post to histroy 

/*
This is how you post something to history:
temp_post_message = "Example message"
event_user(1)
*/

#region move all history down by one 
if (history_text_count > 0) {
	for (var i = history_text_count-1; i >= 0; --i) {
		history_text[i+1] = history_text[i]
		history_text_type[i+1] = history_text_type[i]
	}
}
#endregion

history_text[0] = temp_post_message
history_text_type[0] = 2
history_text_count ++


temp_post_message = ""
