/// @description EaseFlicker1(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseFlicker1
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseFlicker1() {

	return ((ee5(ease.on,ease.inOutBounce,ease.waveSaw,ease.waveSquare3,ease.outBounce,argument0,argument3,0.7,0.75,0.82,0.92,false,false,false,false)*(argument2-argument1))+argument1)

}