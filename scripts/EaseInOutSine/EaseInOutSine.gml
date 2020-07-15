/// @description  EaseInOutSine(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseInOutSine
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseInOutSine() {

	return argument2 * 0.5 * (1 - cos(pi * argument0 / argument3)) + argument1;

}

