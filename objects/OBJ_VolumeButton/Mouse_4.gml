event_inherited();
if (times_pressed >= 2) {
    times_pressed = 0;
} else {
    times_pressed++;
}

if (times_pressed == 0) {
    sprite_index = spr_volume_button_100_hover;
    audio_master_gain(1);
} else if (times_pressed == 1) {
    sprite_index = spr_volume_button_50_hover;
    audio_master_gain(0.5);
} else if (times_pressed == 2) {
    sprite_index = spr_volume_button_0_hover;
    audio_master_gain(0);
}