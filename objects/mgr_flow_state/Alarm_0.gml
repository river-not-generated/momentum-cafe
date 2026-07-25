eighths--;
if (eighths == 0) {
	reset_flow();
	audio_play_sound(snd_timer_expire, 20, false);
	
	global.player_health = max(0, ceil(global.player_health - 10 * obj_player.health_loss));
	global.combo = 0;
	eighths = 8;
}
else {
	audio_play_sound(snd_clock, 20, false);
	audio_sound_gain(snd_clock, 0.5, 0);
}

alarm[0] = game_get_speed(gamespeed_fps) * (timer_duration / 8.0) / global.speed_mod;

