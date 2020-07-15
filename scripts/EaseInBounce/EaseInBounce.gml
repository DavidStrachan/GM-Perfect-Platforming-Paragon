/// @description  EaseInBounce(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseInBounce
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseInBounce() {

	return argument2 - EaseOutBounce(argument3 - argument0, 0, argument2, argument3) + argument1

}