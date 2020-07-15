/// @description  EaseWaveCos(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseWaveCos2
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveCos2() {

	return argument2 * (sin(pi * argument0 / (argument3/4))) + argument1;

}