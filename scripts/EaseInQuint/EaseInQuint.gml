/// @description  EaseInQuint(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseInQuint
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseInQuint() {

	return argument2 * power(argument0 / argument3, 5) + argument1;

}
