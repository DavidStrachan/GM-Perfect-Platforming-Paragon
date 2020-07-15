/// @description EaseWaveSine2(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseWaveSine2
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveSine2() {

	return argument2 * 0.5 * (1 - cos(pi * argument0 / (argument3/4))) + argument1;

}