/// @description  EaseOutQuad(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseOutQuad
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseOutQuad() {

	argument0 /= argument3;
	return -argument2 * argument0 * (argument0 - 2) + argument1;

}
