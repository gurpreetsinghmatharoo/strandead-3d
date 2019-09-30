/// @description 
//3D
z = sprite_height * 0.75;

//Health
hp = 100;
dead = false;

//Movement
moveSpeed = 2;
kbSpeed = 5;

hsp = 0;
vsp = 0;

hspBoost = 0;
vspBoost = 0;

hurtTime = 0;

//Animation
itemScale = 1;
itemBig = 1.2;
itemAngle = 0;
itemAngleRaw = 0;

//Shooting
cooldown = 0;

//Hand item
instance_create_layer(x, y, "Instances", oHandItem);