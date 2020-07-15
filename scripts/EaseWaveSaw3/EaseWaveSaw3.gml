/// @description EaseWaveSaw3(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseWaveSaw3
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveSaw3() {

	return (argument2 * (argument0*6) / argument3 + argument1) mod argument2;

}

