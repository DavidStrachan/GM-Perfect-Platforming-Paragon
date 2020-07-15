/// @description  EaseInOutBounce(inputvalue,outputmin,outputmax,inputmax)
/// @function  EaseInOutBounce
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax

function EaseInOutBounce() {

	if (argument0 < argument3*0.5) 
	{
	    return (EaseInBounce(argument0*2, 0, argument2, argument3)*0.5 + argument1);
	}

	return (EaseOutBounce(argument0*2 - argument3, 0, argument2, argument3)*0.5 + argument2*0.5 + argument1);

}