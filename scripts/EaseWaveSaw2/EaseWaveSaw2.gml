/// @description EaseWaveSaw2(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseWaveSaw2
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveSaw2() {

	return (argument2 * (argument0*4) / argument3 + argument1) mod argument2;

}
