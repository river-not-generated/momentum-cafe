window_set_size(room_width * 4, room_height * 4);
random_set_seed(current_time);


if (global.current_character == SetCharacter.CHARLIE){
instance_create_layer(45, room_height / 2, "Player", chr_charlie);
} else {
	instance_create_layer(45, room_height / 2, "Player", chr_lucas);
}