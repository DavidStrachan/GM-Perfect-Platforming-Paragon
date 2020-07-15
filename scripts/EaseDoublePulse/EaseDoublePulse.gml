/// @description EaseDoublePulse(inputvalue,outputmin,outputmax,inputmax)
/// @function EaseDoublePulse
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseDoublePulse() {
	return ((ee3(ease.off,ease.waveSine,ease.waveSine,argument0,argument3,0.4,0.7,false,false)*(argument2-argument1))+argument1)
}