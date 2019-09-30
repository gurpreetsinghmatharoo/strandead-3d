/// @description 
#region Camera
//Cam position
//if (instance_exists(oPlayer)){
	camX = oPlayer.x;
	camY = oPlayer.y;
	camZ = oPlayer.z;
//}

//Get look position
lookX = camX + (dcos(global.camYaw) * dcos(global.camPitch)) * 32;
lookY = camY + (dsin(global.camYaw) * dcos(global.camPitch)) * 32;
lookZ = camZ + (dsin(global.camPitch)) * 32;
#endregion

#region Camera
//Mat lookat
var lookMat = matrix_build_lookat(camX, camY, camZ, lookX, lookY, lookZ, 0, 0, 1);
var projMat = matrix_build_projection_perspective_fov(-camFOV, -16/9, 1, 32000);

camera_set_view_mat(camera, lookMat);
camera_set_proj_mat(camera, projMat);
camera_apply(camera);
#endregion

#region Background
draw_surface(tSurf, 0, 0);
surface_free(tSurf);

//vertex_submit(vbuff, pr_trianglelist, -1);
//draw_rectangle(0, 0, room_width, room_height, 0);
#endregion

#region Objects
//Loop
for(var i=0; i<instance_count; i++){
	//Vars
	var inst = instance_id_get(i);
	if (instance_exists(inst) && sprite_exists(inst.sprite_index)){
		var key = string(inst);
		var tex = sprite_get_texture(inst.sprite_index, inst.image_index);
		var arr = vMap[? key];
		
		//Init vars
		if (!variable_instance_exists(inst, "Billboard") || !variable_instance_exists(inst, "Faces")){
			init_3d_vars(inst);
		}
	
		//Vbuff
		if (arr==undefined || arr[apr.spr]!=inst.sprite_index || arr[apr.sub]!=floor(inst.image_index) || ((arr[apr.x]!=inst.x || arr[apr.y]!=inst.y) && !depthOptimization)){
			//Vars
			var uvs = texture_get_uvs(tex);
			
			if (arr==undefined){
				var texW = texture_get_texel_width(tex);
				var texH = texture_get_texel_height(tex);
			}
			else{
				var texW = arr[apr.texw];
				var texH = arr[apr.texh];
			}
			
			var _w = (uvs[2]-uvs[0])/texW;
			var _h = (uvs[3]-uvs[1])/texH;
			
			var pos = [0, 0, _w, _h];
		
			//Vbuff
			var vBuff;
			if (arr=undefined)
				vBuff = vertex_create_buffer();
			else
				vBuff = arr[apr.vbuff];
		
			vertex_begin(vBuff, vFormat);
		
			//Triangle 1
			vertex_position_3d(vBuff, (inst.x*(!depthOptimization)) + pos[uv.x], (inst.y*(!depthOptimization)), pos[uv.h]);
			vertex_texcoord(vBuff, uvs[uv.x], uvs[uv.y]);
			vertex_color(vBuff, c_white, 1);
		
			vertex_position_3d(vBuff, (inst.x*(!depthOptimization)) + pos[uv.w], (inst.y*(!depthOptimization)), pos[uv.h]);
			vertex_texcoord(vBuff, uvs[uv.w], uvs[uv.y]);
			vertex_color(vBuff, c_white, 1);
		
			vertex_position_3d(vBuff, (inst.x*(!depthOptimization)) + pos[uv.x], (inst.y*(!depthOptimization)), pos[uv.y]);
			vertex_texcoord(vBuff, uvs[uv.x], uvs[uv.h]);
			vertex_color(vBuff, c_white, 1);
		
			//Triangle 2
			vertex_position_3d(vBuff, (inst.x*(!depthOptimization)) + pos[uv.w], (inst.y*(!depthOptimization)), pos[uv.y]);
			vertex_texcoord(vBuff, uvs[uv.w], uvs[uv.h]);
			vertex_color(vBuff, c_white, 1);
		
			vertex_position_3d(vBuff, (inst.x*(!depthOptimization)) + pos[uv.w], (inst.y*(!depthOptimization)), pos[uv.h]);
			vertex_texcoord(vBuff, uvs[uv.w], uvs[uv.y]);
			vertex_color(vBuff, c_white, 1);
		
			vertex_position_3d(vBuff, (inst.x*(!depthOptimization)) + pos[uv.x], (inst.y*(!depthOptimization)), pos[uv.y]);
			vertex_texcoord(vBuff, uvs[uv.x], uvs[uv.h]);
			vertex_color(vBuff, c_white, 1);
		
			vertex_end(vBuff);
		
			//Log
			var verb = "modified";
			if (arr=undefined) verb = "created";
			show_debug_message(string(current_time) + ": Vertex buffer " + verb + " for " + key);
		
			//Get offset
			var offset = (sprite_get_xoffset(inst.sprite_index)/sprite_get_width(inst.sprite_index))*_w;
		
			//Array
			if (arr==undefined){
				var arr = [vBuff, inst.sprite_index, inst.image_index, inst.x, inst.y, texW, texH, _w, _h, offset];
		
				vMap[? key] = arr;
			}
			else{
				arr[@ apr.spr] = inst.sprite_index;
				arr[@ apr.sub] = floor(inst.image_index);
				arr[@ apr.x] = inst.x;
				arr[@ apr.y] = inst.y;
				arr[@ apr.w] = _w;
				arr[@ apr.h] = _h;
				arr[@ apr.offset] = offset;
			}
		}
		else{
			//Get info
			var vBuff = arr[apr.vbuff];
			var tex = sprite_get_texture(arr[apr.spr], arr[apr.sub]);
			var _w = arr[apr.w];
			var _h = arr[apr.h];
			var offset = arr[apr.offset];
			
			//Update info
			arr[@ apr.x] = inst.x;
			arr[@ apr.y] = inst.y;
		}
		
		//Vars
		var zCenter = inst.z + inst.sprite_height/2;
		
		//Submit
		for(var f=0; f<inst.Faces; f++){
			//Billboard
			var camDirZ = point_direction(inst.x, inst.y, camX, camY);
			var camDistZ = point_distance(inst.x, inst.y, camX, camY);
			
			if (inst.Billboard){
				//inst.zRot = camDirZ-90;
				inst.zRot = -global.camYaw-90;
			}
			if (inst.Billboard>1){
				inst.xRot = point_direction(0, inst.z, camDistZ, camZ);
				//inst.xRot = global.camPitch;
			}
			
			//Rotation
			var _rot = inst.zRot + ((180/inst.Faces)*f);
			
			//Offsets
			var _xoff = lengthdir_x(offset, _rot);
			var _yoff = lengthdir_y(offset, _rot);
			
			//Submit
			draw_vbuff_transform(vBuff, (inst.x*depthOptimization)-_xoff, (inst.y*depthOptimization)-_yoff, inst.z, 1, 1, 1, pr_trianglelist, tex, c_white, 1, inst.xRot, inst.yRot, _rot);
		}
	}
	
	//Bullet
	if (inst.object_index==oBullet){
		//var bDist = point_distance(inst.x1, inst.y1, inst.x2, inst.y2);
		//var bDir = point_direction(inst.x1, inst.y1, inst.x2, inst.y2);
		
		//draw_vbuff_transform(vbCube, inst.x1, inst.y1, inst.z, 1, bDist, 1, pr_trianglelist, -1, inst.color, inst.alpha, 0, 0, bDir);
		//draw_vbuff_transform(vbCube, inst.x1, inst.y1, inst.z, 1, 1, 1, pr_trianglelist, -1, inst.color, inst.alpha, 0, 0, 0);
		
		//Just draw a line for now
		vertex_begin(vBullet, vF);
		
		vertex_position_3d(vBullet, inst.x1, inst.y1, inst.z);
		vertex_color(vBullet, inst.color, inst.alpha);
		
		vertex_position_3d(vBullet, inst.x2, inst.y2, inst.z);
		vertex_color(vBullet, inst.color, inst.alpha);
		
		vertex_end(vBullet);
		
		//Draw
		vertex_submit(vBullet, pr_linelist, -1);
	}
}

#endregion

#region Debug
if (devMode){
	//Camera direction
	var len = 64;
	draw_line_color(camX, camY, camX + lengthdir_x(len, -global.camYaw), camY + lengthdir_y(len, -global.camYaw), c_red, c_orange);
	
	//Bullet
	//if (instance_exists(oBullet)){
	//	draw_line_color(oBullet.x1, oBullet.y1, oBullet.x2, oBullet.y2, c_yellow, c_green);
	//}
}
#endregion

#region Block grid
//if (global.selectedItem >= 0){
//	var selectedArr = global.inv[| global.selectedItem];
//	var selItem = selectedArr[pr.item];
	
//	//Draw block grid
//	if (selItem>=item.woodblock32){
//		var size = global.items[selItem, stat.size];
		
//		var camX = camera_get_view_x(view_camera);
//		var camY = camera_get_view_y(view_camera);
//		var camW = camera_get_view_width(view_camera);
//		var camH = camera_get_view_height(view_camera);
		
//		var mX = (mouse_x div size) * size;
//		var mY = (mouse_y div size) * size;
		
//		for(var xx=(camX div size)*size; xx<=camX+camW; xx+=size){
//			for(var yy=(camY div size)*size; yy<=camY+camH; yy+=size){
//				draw_set_alpha(0.5);
				
//				draw_line(xx, yy, xx+size, yy);
//				draw_line(xx, yy, xx, yy+size);
				
//				if (mX==xx && mY==yy){
//					draw_rectangle(xx, yy, xx+size, yy+size, false);
//				}
				
//				draw_set_alpha(1);
//			}
//		}
//	}
//}
#endregion