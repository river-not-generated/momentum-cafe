function increase_flow() {
	global.speed_mod = min(global.speed_mod + 0.2, 2.0);
	if (global.speed_mod == 1.2) {
		audio_sound_gain(global.guitar, 1, 1000);
	}
	else if (global.speed_mod == 1.6) {
		audio_sound_gain(global.xylo, 1, 1000);
	}
	else if (global.speed_mod == 2.0) {
		audio_sound_gain(global.piano, 1, 1000);
	}
}

function reset_flow() {
	global.speed_mod = 1;
	audio_sound_gain(global.guitar, 0, 250);
	audio_sound_gain(global.xylo, 0, 250);
	audio_sound_gain(global.piano, 0, 250);
	if (instance_exists(mgr_flow_state)) {
		mgr_flow_state.alarm[0] = game_get_speed(gamespeed_fps) * mgr_flow_state.timer_duration;
	}
}