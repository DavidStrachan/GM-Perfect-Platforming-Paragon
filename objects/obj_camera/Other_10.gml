/// @description Insert description here
// You can write your code in this editor

// angle stuff 
var draw_angle = degtorad(rotation)

var draw_x = round(x) // this is to try and stop a flicker on HTML
var draw_y = round(y)

var vm = matrix_build_lookat(draw_x,draw_y,-10,draw_x,draw_y,0,sin(draw_angle),cos(draw_angle),0);
var pm = matrix_build_projection_ortho(max_screen_size_x*zoom,max_screen_size_y*zoom,-32000,32000)

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);