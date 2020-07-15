/// @description  EaseOutSine(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseOutSine
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseOutSine() {  

	return argument2 * sin(argument0 / argument3 * (pi / 2)) + argument1;

}
