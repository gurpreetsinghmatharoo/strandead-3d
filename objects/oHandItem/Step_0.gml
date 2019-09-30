/// @description 
//Rotation
yRot = (global.camPitch / 2) - yAdd;
zRot = -global.camYaw+rot;

//Position
//x = oPlayer.x + lengthdir_x(dist, -global.camYaw + dir);
//y = oPlayer.y + lengthdir_y(dist, -global.camYaw + dir);
//z = zBase - lengthdir_y(16, global.camPitch);

//Position
x = oPlayer.x + (dcos(global.camYaw + dir) * dcos(global.camPitch)) * dist;
y = oPlayer.y + (dsin(global.camYaw + dir) * dcos(global.camPitch)) * dist;
z = zBase + (dsin(global.camPitch)) * dist/2;