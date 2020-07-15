/// @description  EaseInExpo(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseInExpo
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseInExpo() {

	return argument2 * power(2, 10 * (argument0 / argument3 - 1)) + argument1;

}
