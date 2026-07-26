switch (global.game_state) {
	case GameState.GAMESTART:
		if (!game_music_playing) {
			audio_stop_sound(bgm_title);
			game_music_playing = true;
			title_music_playing = false;
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
		audio_stop_sound(global.bass);
		audio_stop_sound(global.guitar);
		audio_stop_sound(global.xylo);
		audio_stop_sound(global.piano);
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
		if (!title_music_playing) {
			audio_stop_sound(global.piano);
			game_over_playing = false;
			title_music_playing = true;
			audio_play_sound(bgm_title, 50, true);
		}
		break;
}