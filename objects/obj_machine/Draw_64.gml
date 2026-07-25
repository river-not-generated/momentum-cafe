// draw an interact prompt over the object if the player can interact with it
if (place_meeting(x, y, obj_player) && obj_player.can_interact) {
	var spr = spr_interact;
	switch (gives) {
		case Item.COFFEE:
			spr = spr_coffee;
			break;
		case Item.COCOA:
			spr = spr_cocoa;
			break;
		case Item.ESPRESSO:
			spr = spr_espresso;
			break;
		case Item.LATTE:
			spr = spr_latte;
			break;
		
	}
	draw_set_colour(c_white);
	draw_sprite(spr, -1, x, y - y_offset);

}
else {
	y_offset = 17;
	sprite_up = true;
}