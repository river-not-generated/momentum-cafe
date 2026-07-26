character_option[0] = OBJ_Customer;
character_option[1] = cust_froggy;
character_option[2] = cust_grimm;
character_option[3] = cust_jaden;
character_option[4] = cust_johnny;
character_option[5] = cust_selene;
character_option[6] = (global.current_character == SetCharacter.CHARLIE ? cust_lucas : cust_charlie);
character_option[7] = cust_river;
character_option[8] = cust_scott;


function spawn_customer() {
	var i = 0;
	if (irandom(99) != 0) {
		i = irandom(array_length(character_option) - 2) + 1;
	}
	instance_create_layer(room_width + 20, room_height / 2, "Instances", character_option[i]);
}

spawn_customer();
timer_set = false;


