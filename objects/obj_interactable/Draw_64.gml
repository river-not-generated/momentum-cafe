// draw an interact prompt over the object if the player can interact with it
if (place_meeting(x, y, obj_player) && obj_player.can_interact) {
	draw_set_colour(c_white);
	draw_sprite(spr_interact, -1, x, y - y_offset);
}
else {
	y_offset = y_min;
	sprite_up = true;
}