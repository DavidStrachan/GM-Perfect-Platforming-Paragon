/// @description  EaseOutExpo(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseOutExpo
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseOutExpo() {

	return argument2 * (-power(2, -10 * argument0 / argument3) + 1) + argument1;

}
