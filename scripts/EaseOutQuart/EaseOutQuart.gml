/// @description  EaseOutQuart(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseOutQuart
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseOutQuart() {

	return -argument2 * (power(argument0 / argument3 - 1, 4) - 1) + argument1;

}
