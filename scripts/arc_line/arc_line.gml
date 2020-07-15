/// @description So this isnt a normal arc, its a kinda fake 3d arc where you know where you want the finish position to be, can be used for things like debries. 
/// @function arc_line
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param amount_decimal 
/// @param height
/// returns [x,y]

function arc_line(argument0, argument1, argument2, argument3, argument4, argument5) {

	var dir = point_direction(argument0,argument1,argument2,argument3)
	var dist = point_distance(argument0,argument1,argument2,argument3)

	var the_x = argument0+lengthdir_x(dist*argument4,dir)
	var the_y = argument1+lengthdir_y(dist*argument4,dir)

	the_y -= argument5*ee2(ease.outQuad,ease.inQuad,argument4,1,0.5,true)

	return [the_x,the_y]


}
