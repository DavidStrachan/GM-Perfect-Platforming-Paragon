/// @description  EaseInCubic(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseInCubic
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseInCubic() {

	return argument2 * power(argument0/argument3, 3) + argument1;
	
}
