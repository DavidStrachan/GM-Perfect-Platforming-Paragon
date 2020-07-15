/// @description EaseWaveSquare5(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseWaveSquare5
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveSquare5() {

	var easeReturn = (argument2 * (argument0*5) / argument3 + argument1) mod argument2;

	if (easeReturn > 0.5) {
		return 1
	} else {
		return 0
	}

}