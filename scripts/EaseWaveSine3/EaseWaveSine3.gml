/// @description EaseWaveSine3(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseWaveSine3
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveSine3() {

	return argument2 * 0.5 * (1 - cos(pi * argument0 / (argument3/6))) + argument1;

}