if (global.current_character == SetCharacter.CHARLIE){
instance_create_layer(60, room_height / 2, "Player", chr_charlie);
} else {
	instance_create_layer(60, room_height / 2, "Player", chr_lucas);
}