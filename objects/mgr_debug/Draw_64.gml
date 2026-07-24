draw_set_font(font);


if (instance_exists(obj_player)) {
	draw_set_colour(c_black);
	draw_set_halign(fa_right);
	draw_text(room_width - 2, room_height - 8, "char:" + string_lower(obj_player.name));
	draw_set_halign(fa_left);
}
