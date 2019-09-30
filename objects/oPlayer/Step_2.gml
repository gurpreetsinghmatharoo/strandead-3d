/// @description 
//Sprite code from Draw because it doesn't run there because of !visible
if (!dead){
	//Draw selected item
	if (global.selectedItem >= 0){
		//Vars
		var selectedArr = global.inv[| global.selectedItem];
		var selItem = selectedArr[pr.item];
		var spr = global.items[selItem, stat.sprite];
	
		//Item
		if (selItem<item.woodblock32){
			var isMelee = selItem>=item.axe && selItem<=item.pickaxe;
			var dist = (sprite_get_width(spr)/2) * !isMelee;
			var dir = mouseDir + itemAngle/2;
			var yoff = 4 * isMelee;
	
			//draw_sprite_ext(spr, 0, x + lengthdir_x(dist, dir), y + lengthdir_y(dist, dir) + yoff, itemScale, (-1 + (abs(angle_difference(dir, 0))<=90)*2)*itemScale, dir + itemAngle/2, image_blend, image_alpha);
			
			var baseAngle = 0;
			if (selItem==item.axe || selItem==item.pickaxe){
				baseAngle = -40;
			}
			
			oHandItem.sprite_index = spr;
			oHandItem.yAdd = baseAngle + itemAngle;
		}
	}
	else{
		oHandItem.sprite_index = -1;
	}
	
	//Hand 2
	draw_sprite_ext(sPlayerHand, 0, x + lengthdir_x(2, mouseDir + itemAngle), y + lengthdir_y(2, mouseDir + itemAngle) + 4, 1, 1, mouseDir + itemAngle, -1, 1);
}