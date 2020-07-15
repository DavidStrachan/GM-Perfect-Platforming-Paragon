/// @description  EaseOutCubic(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseOutCubic
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseOutCubic() {

	return argument2 * (power(argument0/argument3 - 1, 3) + 1) + argument1;

}
