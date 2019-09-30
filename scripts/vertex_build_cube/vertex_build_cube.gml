//Buffer
vbCube = vertex_create_buffer();

vertex_begin(vbCube, vF);

//Bottom
//Triangle 1
vertex_position_3d(vbCube, 0, 0, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 0, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 1, 0);
vertex_color(vbCube, c_white, 1);

//Triangle 2
vertex_position_3d(vbCube, 1, 1, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 0, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 1, 0);
vertex_color(vbCube, c_white, 1);

//Right
//Triangle 1
vertex_position_3d(vbCube, 1, 0, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 0, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 1, 0);
vertex_color(vbCube, c_white, 1);

//Triangle 2
vertex_position_3d(vbCube, 1, 1, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 0, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 1, 0);
vertex_color(vbCube, c_white, 1);

//Left
//Triangle 1
vertex_position_3d(vbCube, 0, 0, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 1, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 0, 1);
vertex_color(vbCube, c_white, 1);

//Triangle 2
vertex_position_3d(vbCube, 0, 1, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 1, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 0, 1);
vertex_color(vbCube, c_white, 1);

//Front
//Triangle 1
vertex_position_3d(vbCube, 0, 0, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 0, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 0, 1);
vertex_color(vbCube, c_white, 1);

//Triangle 2
vertex_position_3d(vbCube, 1, 0, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 0, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 0, 1);
vertex_color(vbCube, c_white, 1);

//Back
//Triangle 1
vertex_position_3d(vbCube, 0, 1, 0);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 1, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 1, 0);
vertex_color(vbCube, c_white, 1);

//Triangle 2
vertex_position_3d(vbCube, 1, 1, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 1, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 1, 0);
vertex_color(vbCube, c_white, 1);

//Top
//Triangle 1
vertex_position_3d(vbCube, 0, 0, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 0, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 1, 1);
vertex_color(vbCube, c_white, 1);

//Triangle 2
vertex_position_3d(vbCube, 1, 1, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 1, 0, 1);
vertex_color(vbCube, c_white, 1);

vertex_position_3d(vbCube, 0, 1, 1);
vertex_color(vbCube, c_white, 1);

vertex_end(vbCube);
vertex_freeze(vbCube);
