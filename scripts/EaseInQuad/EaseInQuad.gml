/// @description  EaseInQuad(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseInQuad
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseInQuad() {

	argument0 /= argument3;
	return argument2 * argument0 * argument0 + argument1;

}
