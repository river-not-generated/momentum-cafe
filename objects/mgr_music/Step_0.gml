switch (global.game_state) {
	case GameState.GAMESTART:
		if (!game_music_playing) {
			game_music_playing = true;
			audio_play_sound(global.bass, 50, true);
			audio_play_sound(global.guitar, 50, true);
			audio_play_sound(global.xylo, 50, true);
			audio_play_sound(global.piano, 50, true);

			// start all the tracks at once and mute everything but the bass
			audio_sound_gain(global.guitar, 0, 0);
			audio_sound_gain(global.xylo, 0, 0);
			audio_sound_gain(global.piano, 0, 0);
		}
		break;
	case GameState.DEAD:
		audio_stop_all();
		game_music_playing = false;
		break;
	case GameState.GAMEOVER:
		if (!game_over_playing) {
			game_over_playing = true;
			audio_play_sound(global.piano, 50, true);
			audio_sound_gain(global.piano, 1, 0);
		}
		break;
	case GameState.TITLE:
		audio_stop_all();
		break;
}