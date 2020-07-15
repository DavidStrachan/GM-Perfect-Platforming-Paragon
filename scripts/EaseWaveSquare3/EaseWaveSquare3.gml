/// @description EaseWaveSquare3(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseWaveSquare3
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseWaveSquare3() {

	var easeReturn = (argument2 * (argument0*3) / argument3 + argument1) mod argument2;

	if (easeReturn > 0.5) {
		return 1
	} else {
		return 0
	}

}