/// @description  EaseInSine(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseInSine
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseInSine() {

	return argument2 * (1 - cos(argument0 / argument3 * (pi / 2))) + argument1;

}
