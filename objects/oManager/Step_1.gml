/// @description 
//Mouse
global.mouseXPrev = global.mouseX;
global.mouseYPrev = global.mouseY;
global.mouseX = window_mouse_get_x();
global.mouseY = window_mouse_get_y();

getMouse();