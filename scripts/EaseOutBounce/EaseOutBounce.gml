/// @description  EaseOutBounce(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseOutBounce
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseOutBounce() { 

	argument0 /= argument3;

	if (argument0 < 1/2.75)
	{
	    return argument2 * 7.5625 * argument0 * argument0 + argument1;
	}
	else
	if (argument0 < 2/2.75)
	{
	    argument0 -= 1.5/2.75;
	    return argument2 * (7.5625 * argument0 * argument0 + 0.75) + argument1;
	}
	else
	if (argument0 < 2.5/2.75)
	{
	    argument0 -= 2.25/2.75;
	    return argument2 * (7.5625 * argument0 * argument0 + 0.9375) + argument1;
	}
	else
	{
	    argument0 -= 2.625/2.75;
	    return argument2 * (7.5625 * argument0 * argument0 + 0.984375) + argument1;
	}

}

