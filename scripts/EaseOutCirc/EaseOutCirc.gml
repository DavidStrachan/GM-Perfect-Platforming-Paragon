/// @description  EaseOutCirc(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseOutCirc
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseOutCirc() {

	argument0 = argument0 / argument3 - 1;
	return argument2 * sqrt(1 - argument0 * argument0) + argument1;

}
