/// @description EaseFlicker2(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseFlicker2
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseFlicker2() {

	return ((ee5(ease.waveSquare5,ease.inOutBounce,ease.waveSaw,ease.waveSquare3,ease.outBounce,argument0,argument3,0.3,0.75,0.82,0.92,false,false,false,false)*(argument2-argument1))+argument1)

}