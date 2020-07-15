/// @description EaseWaveSaw4(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseWaveSaw4
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveSaw4() {

	return (argument2 * (argument0*8) / argument3 + argument1) mod argument2;

}

