if (y_offset == y_max && sprite_up) {
	sprite_up = false;
}
else if (y_offset == y_min && !sprite_up) {
	sprite_up = true;
}
y_offset = (sprite_up ? y_offset + 1 : y_offset - 1);
alarm[0] = game_get_speed(gamespeed_fps) * 0.25;