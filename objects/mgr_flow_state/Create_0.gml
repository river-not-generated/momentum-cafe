timer_duration = 12.5;
combo_requirement = 5;
eighths = 8;
alarm[0] = timer_length();

function update_flow() {
	if (global.combo % combo_requirement == 0 && global.combo != 0) {
		increase_flow();
	}
	alarm[0] = timer_length();
	eighths = 8;
}

function timer_length() {
	if (instance_exists(obj_player)) {
		return game_get_speed(gamespeed_fps) * (timer_duration * obj_player.timer_mod / 8.0) / global.speed_mod;
	}
	else {
		return game_get_speed(gamespeed_fps) * (timer_duration / 8.0) / global.speed_mod;
	}
}