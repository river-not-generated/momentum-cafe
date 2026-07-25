timer_duration = 12.5;
combo_requirement = 5;
eighths = 8;
alarm[0] = game_get_speed(gamespeed_fps) * (timer_duration / 8.0) / global.speed_mod;

function update_flow() {
	if (global.combo % combo_requirement == 0 && global.combo != 0) {
		increase_flow();
	}
	alarm[0] = game_get_speed(gamespeed_fps) * (timer_duration / 8.0) / global.speed_mod;
	eighths = 8;
}