/// @description  EaseWaveCos(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseWaveCos
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveCos() {

	return argument2 * (sin(pi * argument0 / (argument3/2))) + argument1;

}