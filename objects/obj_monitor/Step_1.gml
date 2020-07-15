/// @description Insert description here
// You can write your code in this editor

countsurfaces = 0
for (var i = 0; i < 1000; ++i) {
    if (surface_exists(i)) {countsurfaces++}
}

steptimestart = get_timer()