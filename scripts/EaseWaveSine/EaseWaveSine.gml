/// @description  EaseWaveSine(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseWaveSine
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveSine() {

	return argument2 * 0.5 * (1 - cos(pi * argument0 / (argument3/2))) + argument1;

}