/// @description  EaseOutBack(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseOutBack
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseOutBack() {

	var _s = 1.70158;

	argument0 = argument0/argument3 - 1;
	return argument2 * (argument0 * argument0 * ((_s + 1) * argument0 + _s) + 1) + argument1;

}
