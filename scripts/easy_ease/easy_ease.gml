/// @description Main function to ease things 
/// @function ease
/// @param type
/// @param value_current
/// @param value_max
/// returns 0 to 1

enum ease {
	inBack, 
	inBounce,
	inCirc,
	inCubic,
	inElastic,
	inExpo,
	inOutBack,
	inOutBounce,
	inOutCirc,
	inOutCubic,
	inOutElastic,
	inOutExpo,
	inOutQuad,
	inOutQuart,
	inOutQuint,
	inOutSine,
	inQuad,
	inQuart,
	inQuint,
	inSine,
	linear,
	outBack,
	outBounce,
	outCirc,
	outCubic,
	outElastic,
	outExpo,
	outQuad,
	outQuart,
	outQuint,
	outSine,
	waveSine,
	waveSine2,
	waveSine3,
	waveSine4,
	waveSine5,
	waveCos,
	waveCos2,
	waveCos3,
	waveCos4,
	waveCos5,
	waveSaw,
	waveSaw2,
	waveSaw3,
	waveSaw4,
	waveSaw5,
	waveSquare,
	waveSquare2,
	waveSquare3,
	waveSquare4,
	waveSquare5,
	on,
	off,
	flicker1,
	flicker2,
	doublePulse,
	lightning1,
}

/// @description ease_combine
/// @function ease_combine
/// @param value1
/// @param value2
/// @param ratio  (0.5 means 50:50 from each side)

function ease_combine () {

	var val1 = argument0 * argument2
	var val2 = argument1 * (1-argument2)

	return (val1+val2)

}


function ee(argument0, argument1, argument2) {

	switch (argument0) {
		case ease.inBack:
			var ease_to_return = EaseInBack(argument1,0,1,argument2);
		break;
		case ease.inBounce:
			var ease_to_return = EaseInBounce(argument1,0,1,argument2);
		break;
		case ease.inCirc:
			var ease_to_return = EaseInCirc(argument1,0,1,argument2);
		break;
		case ease.inCubic:
			var ease_to_return = EaseInCubic(argument1,0,1,argument2);
		break;
		case ease.inElastic:
			var ease_to_return = EaseInElastic(argument1,0,1,argument2);
		break;
		case ease.inExpo:
			var ease_to_return = EaseInExpo(argument1,0,1,argument2);
		break;
		case ease.inOutBack:
			var ease_to_return = EaseInOutBack(argument1,0,1,argument2);
		break;
		case ease.inOutBounce:
			var ease_to_return = EaseInOutBounce(argument1,0,1,argument2);
		break;
		case ease.inOutCirc:
			var ease_to_return = EaseInOutCirc(argument1,0,1,argument2);
		break;
		case ease.inOutCubic:
			var ease_to_return = EaseInOutCubic(argument1,0,1,argument2);
		break;
		case ease.inOutElastic:
			var ease_to_return = EaseInOutElastic(argument1,0,1,argument2);
		break;
		case ease.inOutExpo:
			var ease_to_return = EaseInOutExpo(argument1,0,1,argument2);
		break;
		case ease.inOutQuad:
			var ease_to_return = EaseInOutQuad(argument1,0,1,argument2);
		break;
		case ease.inOutQuart:
			var ease_to_return = EaseInOutQuart(argument1,0,1,argument2);
		break;
		case ease.inOutQuint:
			var ease_to_return = EaseInOutQuint(argument1,0,1,argument2);
		break;
		case ease.inOutSine:
			var ease_to_return = EaseInOutSine(argument1,0,1,argument2);
		break;
		case ease.inQuad:
			var ease_to_return = EaseInQuad(argument1,0,1,argument2);
		break;
		case ease.inQuart:
			var ease_to_return = EaseInQuart(argument1,0,1,argument2);
		break;
		case ease.inQuint:
			var ease_to_return = EaseInQuint(argument1,0,1,argument2);
		break;
		case ease.inSine:
			var ease_to_return = EaseInSine(argument1,0,1,argument2);
		break;
		case ease.linear:
			var ease_to_return = EaseLinear(argument1,0,1,argument2);
		break;
		case ease.outBack:
			var ease_to_return = EaseOutBack(argument1,0,1,argument2);
		break;
		case ease.outBounce:
			var ease_to_return = EaseOutBounce(argument1,0,1,argument2);
		break;
		case ease.outCirc:
			var ease_to_return = EaseOutCirc(argument1,0,1,argument2);
		break;
		case ease.outCubic:
			var ease_to_return = EaseOutCubic(argument1,0,1,argument2);
		break;
		case ease.outElastic:
			var ease_to_return = EaseOutElastic(argument1,0,1,argument2);
		break;
		case ease.outExpo:
			var ease_to_return = EaseOutExpo(argument1,0,1,argument2);
		break;
		case ease.outQuad:
			var ease_to_return = EaseOutQuad(argument1,0,1,argument2);
		break;
		case ease.outQuart:
			var ease_to_return = EaseOutQuart(argument1,0,1,argument2);
		break;
		case ease.outQuint:
			var ease_to_return = EaseOutQuint(argument1,0,1,argument2);
		break;
		case ease.outSine:
			var ease_to_return = EaseOutSine(argument1,0,1,argument2);
		break;
		case ease.waveSine:
			var ease_to_return = EaseWaveSine(argument1,0,1,argument2);
		break;
		case ease.waveSine2:
			var ease_to_return = EaseWaveSine2(argument1,0,1,argument2);
		break;
		case ease.waveSine3:
			var ease_to_return = EaseWaveSine3(argument1,0,1,argument2);
		break;
		case ease.waveSine4:
			var ease_to_return = EaseWaveSine4(argument1,0,1,argument2);
		break;
		case ease.waveSine5:
			var ease_to_return = EaseWaveSine5(argument1,0,1,argument2);
		break;
		case ease.waveCos:
			var ease_to_return = EaseWaveCos(argument1,0,1,argument2);
		break;
		case ease.waveCos2:
			var ease_to_return = EaseWaveCos2(argument1,0,1,argument2);
		break;
		case ease.waveCos3:
			var ease_to_return = EaseWaveCos3(argument1,0,1,argument2);
		break;
		case ease.waveCos4:
			var ease_to_return = EaseWaveCos4(argument1,0,1,argument2);
		break;
		case ease.waveCos5:
			var ease_to_return = EaseWaveCos5(argument1,0,1,argument2);
		break;
		case ease.waveSaw:
			var ease_to_return = EaseWaveSaw(argument1,0,1,argument2);
		break;
		case ease.waveSaw2:
			var ease_to_return = EaseWaveSaw2(argument1,0,1,argument2);
		break;
		case ease.waveSaw3:
			var ease_to_return = EaseWaveSaw3(argument1,0,1,argument2);
		break;
		case ease.waveSaw4:
			var ease_to_return = EaseWaveSaw4(argument1,0,1,argument2);
		break;
		case ease.waveSaw5:
			var ease_to_return = EaseWaveSaw5(argument1,0,1,argument2);
		break;
		case ease.waveSquare:
			var ease_to_return = EaseWaveSquare(argument1,0,1,argument2);
		break;
		case ease.waveSquare2:
			var ease_to_return = EaseWaveSquare2(argument1,0,1,argument2);
		break;
		case ease.waveSquare3:
			var ease_to_return = EaseWaveSquare3(argument1,0,1,argument2);
		break;
		case ease.waveSquare4:
			var ease_to_return = EaseWaveSquare4(argument1,0,1,argument2);
		break;
		case ease.waveSquare5:
			var ease_to_return = EaseWaveSquare5(argument1,0,1,argument2);
		break;
		case ease.on:
			var ease_to_return = EaseOn(argument1,0,1,argument2);
		break;
		case ease.off:
			var ease_to_return = EaseOff(argument1,0,1,argument2);
		break;
		case ease.flicker1:
			var ease_to_return = EaseFlicker1(argument1,0,1,argument2);
		break;
		case ease.flicker2:
			var ease_to_return = EaseFlicker2(argument1,0,1,argument2);
		break;
		case ease.doublePulse:
			var ease_to_return = EaseDoublePulse(argument1,0,1,argument2);
		break;
		case ease.lightning1:
			var ease_to_return = EaseLightning1(argument1,0,1,argument2);
		break;
	    default:
	        show_debug_message("ERROR:- You wanted to use easing but I didnt know which one to use")
	    break;
	}

	return ease_to_return

}


/// @description Main function to ease things 
/// @function ee2
/// @param type1
/// @param type2
/// @param value_current
/// @param value_max
/// @param join_point_0_to_1
/// @param flip_second_0_at_end
/// returns 0 to 1

function ee2() {

	var ease_current_decimal = argument2/argument3

	if (ease_current_decimal < argument4) {
		var ease_to_use = argument0
		var value_to_use = ease_current_decimal/argument4
		var value_end = 1
	} else {
		var ease_to_use = argument1
		
		var ease_low = (argument3*argument4)
		var value_end = argument3-ease_low

		var value_to_use = (argument2-ease_low)
	}


	switch (ease_to_use) {
		case ease.inBack:
			var ease_to_return = EaseInBack(value_to_use,0,1,value_end);
		break;
		case ease.inBounce:
			var ease_to_return = EaseInBounce(value_to_use,0,1,value_end);
		break;
		case ease.inCirc:
			var ease_to_return = EaseInCirc(value_to_use,0,1,value_end);
		break;
		case ease.inCubic:
			var ease_to_return = EaseInCubic(value_to_use,0,1,value_end);
		break;
		case ease.inElastic:
			var ease_to_return = EaseInElastic(value_to_use,0,1,value_end);
		break;
		case ease.inExpo:
			var ease_to_return = EaseInExpo(value_to_use,0,1,value_end);
		break;
		case ease.inOutBack:
			var ease_to_return = EaseInOutBack(value_to_use,0,1,value_end);
		break;
		case ease.inOutBounce:
			var ease_to_return = EaseInOutBounce(value_to_use,0,1,value_end);
		break;
		case ease.inOutCirc:
			var ease_to_return = EaseInOutCirc(value_to_use,0,1,value_end);
		break;
		case ease.inOutCubic:
			var ease_to_return = EaseInOutCubic(value_to_use,0,1,value_end);
		break;
		case ease.inOutElastic:
			var ease_to_return = EaseInOutElastic(value_to_use,0,1,value_end);
		break;
		case ease.inOutExpo:
			var ease_to_return = EaseInOutExpo(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuad:
			var ease_to_return = EaseInOutQuad(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuart:
			var ease_to_return = EaseInOutQuart(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuint:
			var ease_to_return = EaseInOutQuint(value_to_use,0,1,value_end);
		break;
		case ease.inOutSine:
			var ease_to_return = EaseInOutSine(value_to_use,0,1,value_end);
		break;
		case ease.inQuad:
			var ease_to_return = EaseInQuad(value_to_use,0,1,value_end);
		break;
		case ease.inQuart:
			var ease_to_return = EaseInQuart(value_to_use,0,1,value_end);
		break;
		case ease.inQuint:
			var ease_to_return = EaseInQuint(value_to_use,0,1,value_end);
		break;
		case ease.inSine:
			var ease_to_return = EaseInSine(value_to_use,0,1,value_end);
		break;
		case ease.linear:
			var ease_to_return = EaseLinear(value_to_use,0,1,value_end);
		break;
		case ease.outBack:
			var ease_to_return = EaseOutBack(value_to_use,0,1,value_end);
		break;
		case ease.outBounce:
			var ease_to_return = EaseOutBounce(value_to_use,0,1,value_end);
		break;
		case ease.outCirc:
			var ease_to_return = EaseOutCirc(value_to_use,0,1,value_end);
		break;
		case ease.outCubic:
			var ease_to_return = EaseOutCubic(value_to_use,0,1,value_end);
		break;
		case ease.outElastic:
			var ease_to_return = EaseOutElastic(value_to_use,0,1,value_end);
		break;
		case ease.outExpo:
			var ease_to_return = EaseOutExpo(value_to_use,0,1,value_end);
		break;
		case ease.outQuad:
			var ease_to_return = EaseOutQuad(value_to_use,0,1,value_end);
		break;
		case ease.outQuart:
			var ease_to_return = EaseOutQuart(value_to_use,0,1,value_end);
		break;
		case ease.outQuint:
			var ease_to_return = EaseOutQuint(value_to_use,0,1,value_end);
		break;
		case ease.outSine:
			var ease_to_return = EaseOutSine(value_to_use,0,1,value_end);
		break;
		case ease.waveSine:
			var ease_to_return = EaseWaveSine(value_to_use,0,1,value_end);
		break;
		case ease.waveSine2:
			var ease_to_return = EaseWaveSine2(value_to_use,0,1,value_end);
		break;
		case ease.waveSine3:
			var ease_to_return = EaseWaveSine3(value_to_use,0,1,value_end);
		break;
		case ease.waveSine4:
			var ease_to_return = EaseWaveSine4(value_to_use,0,1,value_end);
		break;
		case ease.waveSine5:
			var ease_to_return = EaseWaveSine5(value_to_use,0,1,value_end);
		break;
		case ease.waveCos:
			var ease_to_return = EaseWaveCos(value_to_use,0,1,value_end);
		break;
		case ease.waveCos2:
			var ease_to_return = EaseWaveCos2(value_to_use,0,1,value_end);
		break;
		case ease.waveCos3:
			var ease_to_return = EaseWaveCos3(value_to_use,0,1,value_end);
		break;
		case ease.waveCos4:
			var ease_to_return = EaseWaveCos4(value_to_use,0,1,value_end);
		break;
		case ease.waveCos5:
			var ease_to_return = EaseWaveCos5(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw:
			var ease_to_return = EaseWaveSaw(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw2:
			var ease_to_return = EaseWaveSaw2(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw3:
			var ease_to_return = EaseWaveSaw3(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw4:
			var ease_to_return = EaseWaveSaw4(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw5:
			var ease_to_return = EaseWaveSaw5(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare:
			var ease_to_return = EaseWaveSquare(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare2:
			var ease_to_return = EaseWaveSquare2(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare3:
			var ease_to_return = EaseWaveSquare3(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare4:
			var ease_to_return = EaseWaveSquare4(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare5:
			var ease_to_return = EaseWaveSquare5(value_to_use,0,1,value_end);
		break;
		case ease.on:
			var ease_to_return = EaseOn(value_to_use,0,1,value_end);
		break;
		case ease.off:
			var ease_to_return = EaseOff(value_to_use,0,1,value_end);
		break;
		case ease.flicker1:
			var ease_to_return = EaseFlicker1(value_to_use,0,1,value_end);
		break;
		case ease.flicker2:
			var ease_to_return = EaseFlicker2(value_to_use,0,1,value_end);
		break;
		case ease.doublePulse:
			var ease_to_return = EaseDoublePulse(value_to_use,0,1,value_end);
		break;
		case ease.lightning1:
			var ease_to_return = EaseLightning1(value_to_use,0,1,value_end);
		break;
	    default:
	        show_debug_message("ERROR:- You wanted to use easing but I didnt know which one to use")
	    break;
	}

	if (argument5 == true and ease_current_decimal >= argument4) {
		ease_to_return = 1-ease_to_return
	}


	return ease_to_return
}




/// @description Main function to ease things 
/// @function ee3
/// @param type1
/// @param type2
/// @param type3
/// @param value_current
/// @param value_max
/// @param join_point_0_to_1
/// @param join_point_0_to_1
/// @param flip_second_0_at_end
/// @param flip_third_0_at_end
/// returns 0 to 1

function ee3() {

	var ease_current_decimal = argument3/argument4

	if (ease_current_decimal < argument5) {
		var ease_to_use = argument0
		var value_to_use = ease_current_decimal/argument5
		var value_end = 1
	} else if (ease_current_decimal < argument6)  {
		var ease_to_use = argument1
		
		var ease_low = (argument4*argument5)
		var ease_end = argument4-ease_low

		var value_to_use = (argument3-ease_low)

		var value_end = (argument4*argument6)-ease_low
	} else {
		var ease_to_use = argument2
		
		var ease_low = (argument4*argument6)
		var ease_end = argument4-ease_low

		var value_to_use = (argument3-ease_low)

		var value_end = ease_end
	}


	switch (ease_to_use) {
		case ease.inBack:
			var ease_to_return = EaseInBack(value_to_use,0,1,value_end);
		break;
		case ease.inBounce:
			var ease_to_return = EaseInBounce(value_to_use,0,1,value_end);
		break;
		case ease.inCirc:
			var ease_to_return = EaseInCirc(value_to_use,0,1,value_end);
		break;
		case ease.inCubic:
			var ease_to_return = EaseInCubic(value_to_use,0,1,value_end);
		break;
		case ease.inElastic:
			var ease_to_return = EaseInElastic(value_to_use,0,1,value_end);
		break;
		case ease.inExpo:
			var ease_to_return = EaseInExpo(value_to_use,0,1,value_end);
		break;
		case ease.inOutBack:
			var ease_to_return = EaseInOutBack(value_to_use,0,1,value_end);
		break;
		case ease.inOutBounce:
			var ease_to_return = EaseInOutBounce(value_to_use,0,1,value_end);
		break;
		case ease.inOutCirc:
			var ease_to_return = EaseInOutCirc(value_to_use,0,1,value_end);
		break;
		case ease.inOutCubic:
			var ease_to_return = EaseInOutCubic(value_to_use,0,1,value_end);
		break;
		case ease.inOutElastic:
			var ease_to_return = EaseInOutElastic(value_to_use,0,1,value_end);
		break;
		case ease.inOutExpo:
			var ease_to_return = EaseInOutExpo(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuad:
			var ease_to_return = EaseInOutQuad(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuart:
			var ease_to_return = EaseInOutQuart(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuint:
			var ease_to_return = EaseInOutQuint(value_to_use,0,1,value_end);
		break;
		case ease.inOutSine:
			var ease_to_return = EaseInOutSine(value_to_use,0,1,value_end);
		break;
		case ease.inQuad:
			var ease_to_return = EaseInQuad(value_to_use,0,1,value_end);
		break;
		case ease.inQuart:
			var ease_to_return = EaseInQuart(value_to_use,0,1,value_end);
		break;
		case ease.inQuint:
			var ease_to_return = EaseInQuint(value_to_use,0,1,value_end);
		break;
		case ease.inSine:
			var ease_to_return = EaseInSine(value_to_use,0,1,value_end);
		break;
		case ease.linear:
			var ease_to_return = EaseLinear(value_to_use,0,1,value_end);
		break;
		case ease.outBack:
			var ease_to_return = EaseOutBack(value_to_use,0,1,value_end);
		break;
		case ease.outBounce:
			var ease_to_return = EaseOutBounce(value_to_use,0,1,value_end);
		break;
		case ease.outCirc:
			var ease_to_return = EaseOutCirc(value_to_use,0,1,value_end);
		break;
		case ease.outCubic:
			var ease_to_return = EaseOutCubic(value_to_use,0,1,value_end);
		break;
		case ease.outElastic:
			var ease_to_return = EaseOutElastic(value_to_use,0,1,value_end);
		break;
		case ease.outExpo:
			var ease_to_return = EaseOutExpo(value_to_use,0,1,value_end);
		break;
		case ease.outQuad:
			var ease_to_return = EaseOutQuad(value_to_use,0,1,value_end);
		break;
		case ease.outQuart:
			var ease_to_return = EaseOutQuart(value_to_use,0,1,value_end);
		break;
		case ease.outQuint:
			var ease_to_return = EaseOutQuint(value_to_use,0,1,value_end);
		break;
		case ease.outSine:
			var ease_to_return = EaseOutSine(value_to_use,0,1,value_end);
		break;
		case ease.waveSine:
			var ease_to_return = EaseWaveSine(value_to_use,0,1,value_end);
		break;
		case ease.waveSine2:
			var ease_to_return = EaseWaveSine2(value_to_use,0,1,value_end);
		break;
		case ease.waveSine3:
			var ease_to_return = EaseWaveSine3(value_to_use,0,1,value_end);
		break;
		case ease.waveSine4:
			var ease_to_return = EaseWaveSine4(value_to_use,0,1,value_end);
		break;
		case ease.waveSine5:
			var ease_to_return = EaseWaveSine5(value_to_use,0,1,value_end);
		break;
		case ease.waveCos:
			var ease_to_return = EaseWaveCos(value_to_use,0,1,value_end);
		break;
		case ease.waveCos2:
			var ease_to_return = EaseWaveCos2(value_to_use,0,1,value_end);
		break;
		case ease.waveCos3:
			var ease_to_return = EaseWaveCos3(value_to_use,0,1,value_end);
		break;
		case ease.waveCos4:
			var ease_to_return = EaseWaveCos4(value_to_use,0,1,value_end);
		break;
		case ease.waveCos5:
			var ease_to_return = EaseWaveCos5(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw:
			var ease_to_return = EaseWaveSaw(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw2:
			var ease_to_return = EaseWaveSaw2(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw3:
			var ease_to_return = EaseWaveSaw3(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw4:
			var ease_to_return = EaseWaveSaw4(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw5:
			var ease_to_return = EaseWaveSaw5(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare:
			var ease_to_return = EaseWaveSquare(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare2:
			var ease_to_return = EaseWaveSquare2(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare3:
			var ease_to_return = EaseWaveSquare3(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare4:
			var ease_to_return = EaseWaveSquare4(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare5:
			var ease_to_return = EaseWaveSquare5(value_to_use,0,1,value_end);
		break;
		case ease.on:
			var ease_to_return = EaseOn(value_to_use,0,1,value_end);
		break;
		case ease.off:
			var ease_to_return = EaseOff(value_to_use,0,1,value_end);
		break;
		case ease.flicker1:
			var ease_to_return = EaseFlicker1(value_to_use,0,1,value_end);
		break;
		case ease.flicker2:
			var ease_to_return = EaseFlicker2(value_to_use,0,1,value_end);
		break;
		case ease.doublePulse:
			var ease_to_return = EaseDoublePulse(value_to_use,0,1,value_end);
		break;
		case ease.lightning1:
			var ease_to_return = EaseLightning1(value_to_use,0,1,value_end);
		break;
	    default:
	        show_debug_message("ERROR:- You wanted to use easing but I didnt know which one to use")
	    break;
	}

	if (argument8 == true and ease_current_decimal >= argument6) {
		ease_to_return = 1-ease_to_return
	} else if (argument7 == true and (ease_current_decimal >= argument5 and ease_current_decimal < argument6)) {
		ease_to_return = 1-ease_to_return
	}


	return ease_to_return

}


/// @description Main function to ease things 
/// @function ee4
/// @param type1
/// @param type2
/// @param type3
/// @param type4
/// @param value_current
/// @param value_max
/// @param join_point_0_to_1
/// @param join_point_0_to_1
/// @param join_point_0_to_1
/// @param flip_second_0_at_end
/// @param flip_third_0_at_end
/// @param flip_forth_0_at_end
/// returns 0 to 1

function ee4() {

	var ease_current_decimal = argument4/argument5

	if (ease_current_decimal < argument6) {
		var ease_to_use = argument0
		var value_to_use = ease_current_decimal/argument6
		var value_end = 1
	} else if (ease_current_decimal < argument7)  {
		var ease_to_use = argument1
		
		var ease_low = (argument5*argument6)
		var ease_end = argument5-ease_low

		var value_to_use = (argument4-ease_low)

		var value_end = (argument5*argument7)-ease_low
	} else if (ease_current_decimal < argument8)  {
		var ease_to_use = argument2
		
		var ease_low = (argument5*argument7)
		var ease_end = argument5-ease_low

		var value_to_use = (argument4-ease_low)

		var value_end = (argument5*argument8)-ease_low
	} else {
		var ease_to_use = argument3
		
		var ease_low = (argument5*argument8)
		var ease_end = argument5-ease_low

		var value_to_use = (argument4-ease_low)

		var value_end = ease_end
	}


	switch (ease_to_use) {
		case ease.inBack:
			var ease_to_return = EaseInBack(value_to_use,0,1,value_end);
		break;
		case ease.inBounce:
			var ease_to_return = EaseInBounce(value_to_use,0,1,value_end);
		break;
		case ease.inCirc:
			var ease_to_return = EaseInCirc(value_to_use,0,1,value_end);
		break;
		case ease.inCubic:
			var ease_to_return = EaseInCubic(value_to_use,0,1,value_end);
		break;
		case ease.inElastic:
			var ease_to_return = EaseInElastic(value_to_use,0,1,value_end);
		break;
		case ease.inExpo:
			var ease_to_return = EaseInExpo(value_to_use,0,1,value_end);
		break;
		case ease.inOutBack:
			var ease_to_return = EaseInOutBack(value_to_use,0,1,value_end);
		break;
		case ease.inOutBounce:
			var ease_to_return = EaseInOutBounce(value_to_use,0,1,value_end);
		break;
		case ease.inOutCirc:
			var ease_to_return = EaseInOutCirc(value_to_use,0,1,value_end);
		break;
		case ease.inOutCubic:
			var ease_to_return = EaseInOutCubic(value_to_use,0,1,value_end);
		break;
		case ease.inOutElastic:
			var ease_to_return = EaseInOutElastic(value_to_use,0,1,value_end);
		break;
		case ease.inOutExpo:
			var ease_to_return = EaseInOutExpo(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuad:
			var ease_to_return = EaseInOutQuad(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuart:
			var ease_to_return = EaseInOutQuart(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuint:
			var ease_to_return = EaseInOutQuint(value_to_use,0,1,value_end);
		break;
		case ease.inOutSine:
			var ease_to_return = EaseInOutSine(value_to_use,0,1,value_end);
		break;
		case ease.inQuad:
			var ease_to_return = EaseInQuad(value_to_use,0,1,value_end);
		break;
		case ease.inQuart:
			var ease_to_return = EaseInQuart(value_to_use,0,1,value_end);
		break;
		case ease.inQuint:
			var ease_to_return = EaseInQuint(value_to_use,0,1,value_end);
		break;
		case ease.inSine:
			var ease_to_return = EaseInSine(value_to_use,0,1,value_end);
		break;
		case ease.linear:
			var ease_to_return = EaseLinear(value_to_use,0,1,value_end);
		break;
		case ease.outBack:
			var ease_to_return = EaseOutBack(value_to_use,0,1,value_end);
		break;
		case ease.outBounce:
			var ease_to_return = EaseOutBounce(value_to_use,0,1,value_end);
		break;
		case ease.outCirc:
			var ease_to_return = EaseOutCirc(value_to_use,0,1,value_end);
		break;
		case ease.outCubic:
			var ease_to_return = EaseOutCubic(value_to_use,0,1,value_end);
		break;
		case ease.outElastic:
			var ease_to_return = EaseOutElastic(value_to_use,0,1,value_end);
		break;
		case ease.outExpo:
			var ease_to_return = EaseOutExpo(value_to_use,0,1,value_end);
		break;
		case ease.outQuad:
			var ease_to_return = EaseOutQuad(value_to_use,0,1,value_end);
		break;
		case ease.outQuart:
			var ease_to_return = EaseOutQuart(value_to_use,0,1,value_end);
		break;
		case ease.outQuint:
			var ease_to_return = EaseOutQuint(value_to_use,0,1,value_end);
		break;
		case ease.outSine:
			var ease_to_return = EaseOutSine(value_to_use,0,1,value_end);
		break;
		case ease.waveSine:
			var ease_to_return = EaseWaveSine(value_to_use,0,1,value_end);
		break;
		case ease.waveSine2:
			var ease_to_return = EaseWaveSine2(value_to_use,0,1,value_end);
		break;
		case ease.waveSine3:
			var ease_to_return = EaseWaveSine3(value_to_use,0,1,value_end);
		break;
		case ease.waveSine4:
			var ease_to_return = EaseWaveSine4(value_to_use,0,1,value_end);
		break;
		case ease.waveSine5:
			var ease_to_return = EaseWaveSine5(value_to_use,0,1,value_end);
		break;
		case ease.waveCos:
			var ease_to_return = EaseWaveCos(value_to_use,0,1,value_end);
		break;
		case ease.waveCos2:
			var ease_to_return = EaseWaveCos2(value_to_use,0,1,value_end);
		break;
		case ease.waveCos3:
			var ease_to_return = EaseWaveCos3(value_to_use,0,1,value_end);
		break;
		case ease.waveCos4:
			var ease_to_return = EaseWaveCos4(value_to_use,0,1,value_end);
		break;
		case ease.waveCos5:
			var ease_to_return = EaseWaveCos5(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw:
			var ease_to_return = EaseWaveSaw(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw2:
			var ease_to_return = EaseWaveSaw2(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw3:
			var ease_to_return = EaseWaveSaw3(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw4:
			var ease_to_return = EaseWaveSaw4(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw5:
			var ease_to_return = EaseWaveSaw5(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare:
			var ease_to_return = EaseWaveSquare(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare2:
			var ease_to_return = EaseWaveSquare2(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare3:
			var ease_to_return = EaseWaveSquare3(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare4:
			var ease_to_return = EaseWaveSquare4(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare5:
			var ease_to_return = EaseWaveSquare5(value_to_use,0,1,value_end);
		break;
		case ease.on:
			var ease_to_return = EaseOn(value_to_use,0,1,value_end);
		break;
		case ease.off:
			var ease_to_return = EaseOff(value_to_use,0,1,value_end);
		break;
		case ease.flicker1:
			var ease_to_return = EaseFlicker1(value_to_use,0,1,value_end);
		break;
		case ease.flicker2:
			var ease_to_return = EaseFlicker2(value_to_use,0,1,value_end);
		break;
		case ease.doublePulse:
			var ease_to_return = EaseDoublePulse(value_to_use,0,1,value_end);
		break;
		case ease.lightning1:
			var ease_to_return = EaseLightning1(value_to_use,0,1,value_end);
		break;
	    default:
	        show_debug_message("ERROR:- You wanted to use easing but I didnt know which one to use")
	    break;
	}

	if (argument11 == true and ease_current_decimal >= argument8) {
		ease_to_return = 1-ease_to_return
	} else if (argument10 == true and (ease_current_decimal >= argument7 and ease_current_decimal < argument8)) {
		ease_to_return = 1-ease_to_return
	} else if (argument9 == true and (ease_current_decimal >= argument6 and ease_current_decimal < argument7)) {
		ease_to_return = 1-ease_to_return
	}


	return ease_to_return

}

/// @description Main function to ease things 
/// @function ee5
/// @param type1
/// @param type2
/// @param type3
/// @param type4
/// @param type5
/// @param value_current
/// @param value_max
/// @param join_point_0_to_1
/// @param join_point_0_to_1
/// @param join_point_0_to_1
/// @param join_point_0_to_1
/// @param flip_second_0_at_end
/// @param flip_third_0_at_end
/// @param flip_forth_0_at_end
/// @param flip_fifth_0_at_end
/// returns 0 to 1


function ee5() {

	var ease_current_decimal = argument5/argument6

	if (ease_current_decimal < argument7) {
		var ease_to_use = argument0
		var value_to_use = ease_current_decimal/argument7
		var value_end = 1
	} else if (ease_current_decimal < argument8)  {
		var ease_to_use = argument1
		
		var ease_low = (argument6*argument7)
		var ease_end = argument6-ease_low

		var value_to_use = (argument5-ease_low)

		var value_end = (argument6*argument8)-ease_low
	} else if (ease_current_decimal < argument9)  {
		var ease_to_use = argument2
		
		var ease_low = (argument6*argument8)
		var ease_end = argument6-ease_low

		var value_to_use = (argument5-ease_low)

		var value_end = (argument6*argument9)-ease_low
	} else if (ease_current_decimal < argument10)  {
		var ease_to_use = argument3
		
		var ease_low = (argument6*argument9)
		var ease_end = argument6-ease_low

		var value_to_use = (argument5-ease_low)

		var value_end = (argument6*argument10)-ease_low
	} else {
		var ease_to_use = argument4
		
		var ease_low = (argument6*argument10)
		var ease_end = argument6-ease_low

		var value_to_use = (argument5-ease_low)

		var value_end = ease_end
	}

	switch (ease_to_use) {
		case ease.inBack:
			var ease_to_return = EaseInBack(value_to_use,0,1,value_end);
		break;
		case ease.inBounce:
			var ease_to_return = EaseInBounce(value_to_use,0,1,value_end);
		break;
		case ease.inCirc:
			var ease_to_return = EaseInCirc(value_to_use,0,1,value_end);
		break;
		case ease.inCubic:
			var ease_to_return = EaseInCubic(value_to_use,0,1,value_end);
		break;
		case ease.inElastic:
			var ease_to_return = EaseInElastic(value_to_use,0,1,value_end);
		break;
		case ease.inExpo:
			var ease_to_return = EaseInExpo(value_to_use,0,1,value_end);
		break;
		case ease.inOutBack:
			var ease_to_return = EaseInOutBack(value_to_use,0,1,value_end);
		break;
		case ease.inOutBounce:
			var ease_to_return = EaseInOutBounce(value_to_use,0,1,value_end);
		break;
		case ease.inOutCirc:
			var ease_to_return = EaseInOutCirc(value_to_use,0,1,value_end);
		break;
		case ease.inOutCubic:
			var ease_to_return = EaseInOutCubic(value_to_use,0,1,value_end);
		break;
		case ease.inOutElastic:
			var ease_to_return = EaseInOutElastic(value_to_use,0,1,value_end);
		break;
		case ease.inOutExpo:
			var ease_to_return = EaseInOutExpo(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuad:
			var ease_to_return = EaseInOutQuad(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuart:
			var ease_to_return = EaseInOutQuart(value_to_use,0,1,value_end);
		break;
		case ease.inOutQuint:
			var ease_to_return = EaseInOutQuint(value_to_use,0,1,value_end);
		break;
		case ease.inOutSine:
			var ease_to_return = EaseInOutSine(value_to_use,0,1,value_end);
		break;
		case ease.inQuad:
			var ease_to_return = EaseInQuad(value_to_use,0,1,value_end);
		break;
		case ease.inQuart:
			var ease_to_return = EaseInQuart(value_to_use,0,1,value_end);
		break;
		case ease.inQuint:
			var ease_to_return = EaseInQuint(value_to_use,0,1,value_end);
		break;
		case ease.inSine:
			var ease_to_return = EaseInSine(value_to_use,0,1,value_end);
		break;
		case ease.linear:
			var ease_to_return = EaseLinear(value_to_use,0,1,value_end);
		break;
		case ease.outBack:
			var ease_to_return = EaseOutBack(value_to_use,0,1,value_end);
		break;
		case ease.outBounce:
			var ease_to_return = EaseOutBounce(value_to_use,0,1,value_end);
		break;
		case ease.outCirc:
			var ease_to_return = EaseOutCirc(value_to_use,0,1,value_end);
		break;
		case ease.outCubic:
			var ease_to_return = EaseOutCubic(value_to_use,0,1,value_end);
		break;
		case ease.outElastic:
			var ease_to_return = EaseOutElastic(value_to_use,0,1,value_end);
		break;
		case ease.outExpo:
			var ease_to_return = EaseOutExpo(value_to_use,0,1,value_end);
		break;
		case ease.outQuad:
			var ease_to_return = EaseOutQuad(value_to_use,0,1,value_end);
		break;
		case ease.outQuart:
			var ease_to_return = EaseOutQuart(value_to_use,0,1,value_end);
		break;
		case ease.outQuint:
			var ease_to_return = EaseOutQuint(value_to_use,0,1,value_end);
		break;
		case ease.outSine:
			var ease_to_return = EaseOutSine(value_to_use,0,1,value_end);
		break;
		case ease.waveSine:
			var ease_to_return = EaseWaveSine(value_to_use,0,1,value_end);
		break;
		case ease.waveSine2:
			var ease_to_return = EaseWaveSine2(value_to_use,0,1,value_end);
		break;
		case ease.waveSine3:
			var ease_to_return = EaseWaveSine3(value_to_use,0,1,value_end);
		break;
		case ease.waveSine4:
			var ease_to_return = EaseWaveSine4(value_to_use,0,1,value_end);
		break;
		case ease.waveSine5:
			var ease_to_return = EaseWaveSine5(value_to_use,0,1,value_end);
		break;
		case ease.waveCos:
			var ease_to_return = EaseWaveCos(value_to_use,0,1,value_end);
		break;
		case ease.waveCos2:
			var ease_to_return = EaseWaveCos2(value_to_use,0,1,value_end);
		break;
		case ease.waveCos3:
			var ease_to_return = EaseWaveCos3(value_to_use,0,1,value_end);
		break;
		case ease.waveCos4:
			var ease_to_return = EaseWaveCos4(value_to_use,0,1,value_end);
		break;
		case ease.waveCos5:
			var ease_to_return = EaseWaveCos5(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw:
			var ease_to_return = EaseWaveSaw(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw2:
			var ease_to_return = EaseWaveSaw2(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw3:
			var ease_to_return = EaseWaveSaw3(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw4:
			var ease_to_return = EaseWaveSaw4(value_to_use,0,1,value_end);
		break;
		case ease.waveSaw5:
			var ease_to_return = EaseWaveSaw5(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare:
			var ease_to_return = EaseWaveSquare(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare2:
			var ease_to_return = EaseWaveSquare2(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare3:
			var ease_to_return = EaseWaveSquare3(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare4:
			var ease_to_return = EaseWaveSquare4(value_to_use,0,1,value_end);
		break;
		case ease.waveSquare5:
			var ease_to_return = EaseWaveSquare5(value_to_use,0,1,value_end);
		break;
		case ease.on:
			var ease_to_return = EaseOn(value_to_use,0,1,value_end);
		break;
		case ease.off:
			var ease_to_return = EaseOff(value_to_use,0,1,value_end);
		break;
		case ease.flicker1:
			var ease_to_return = EaseFlicker1(value_to_use,0,1,value_end);
		break;
		case ease.flicker2:
			var ease_to_return = EaseFlicker2(value_to_use,0,1,value_end);
		break;
		case ease.doublePulse:
			var ease_to_return = EaseDoublePulse(value_to_use,0,1,value_end);
		break;
		case ease.lightning1:
			var ease_to_return = EaseLightning1(value_to_use,0,1,value_end);
		break;
	    default:
	        show_debug_message("ERROR:- You wanted to use easing but I didnt know which one to use")
	    break;
	}



	if (argument14 == true and ease_current_decimal >= argument10) {
		ease_to_return = 1-ease_to_return
	} else if (argument13 == true and (ease_current_decimal >= argument9 and ease_current_decimal < argument10)) {
		ease_to_return = 1-ease_to_return
	} else if (argument12 == true and (ease_current_decimal >= argument8 and ease_current_decimal < argument9)) {
		ease_to_return = 1-ease_to_return
	} else if (argument11 == true and (ease_current_decimal >= argument7 and ease_current_decimal < argument8)) {
		ease_to_return = 1-ease_to_return
	}

	return ease_to_return

}