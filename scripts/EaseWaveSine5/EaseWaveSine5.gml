/// @description EaseWaveSine5(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseWaveSine5
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveSine5() {

	return argument2 * 0.5 * (1 - cos(pi * argument0 / (argument3/10))) + argument1;

}