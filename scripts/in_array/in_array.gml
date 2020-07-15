/// @function in_array
/// @param needle 
/// @param haystack

/*
returns the key 
IF NOTHING FOUND RETURNS -1 because 0 could be an array element 
*/

function in_array(_needle,_haystack) {

	var _countarray = array_length(_haystack);

	for (var in_array_i = 0; in_array_i < _countarray; in_array_i ++) {

	    if (_haystack[in_array_i] == _needle) {
	
	        return in_array_i;
			break;
	    }
	}

	return -1

}
