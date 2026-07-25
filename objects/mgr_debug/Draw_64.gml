draw_set_font(font);

draw_set_colour(c_black);
draw_set_halign(fa_right);
if (instance_exists(obj_player)) {
	draw_text(room_width - 2, room_height - 8, "char:" + string_lower(obj_player.name));
}
draw_text(room_width - 2, room_height - 16, "health:" + string(global.player_health) + "/" + string(global.max_health));
draw_text(room_width - 2, room_height - 24, "combo:" + string(global.combo));
draw_text(room_width - 2, room_height - 32, "speed:" + string(global.speed_mod));
if (instance_exists(mgr_flow_state)) {
	draw_text(room_width - 2, room_height - 40, "timer:" + string(mgr_flow_state.eighths));
}
draw_set_halign(fa_left);