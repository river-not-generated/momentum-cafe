audio_play_sound(global.bass, 50, true);
audio_play_sound(global.guitar, 50, true);
audio_play_sound(global.xylo, 50, true);
audio_play_sound(global.piano, 50, true);

// start all the tracks at once and mute everything but the bass
audio_sound_gain(global.guitar, 0, 0);
audio_sound_gain(global.xylo, 0, 0);
audio_sound_gain(global.piano, 0, 0);