/// @description  EaseInCirc(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseInCirc
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseInCirc() {

	argument0 /= argument3;
	return argument2 * (1 - sqrt(1 - argument0 * argument0)) + argument1;

}
