/// @description  EaseOutQuint(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseOutQuint
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseOutQuint() {

	return argument2 * (power(argument0 / argument3 - 1, 5) + 1) + argument1;

}
