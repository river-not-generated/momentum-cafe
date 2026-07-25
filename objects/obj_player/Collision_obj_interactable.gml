// check if the player is facing the machine (dependent on the machine itself)
switch (sprite_index) {
	case up_sprite:
		can_interact = other.interact_from == Direction.FRONT;
		break;
	case down_sprite:
		can_interact = other.interact_from == Direction.BACK;
		break;
	case side_sprite:
		if (image_xscale == -1) {
			can_interact = other.interact_from == Direction.RIGHT;
		}
		else {
			can_interact = other.interact_from == Direction.LEFT;
		}
		break;
	default:
		can_interact = false;
		break;
}

// if they are facing the machine they can interact with it
if (can_interact && keyboard_check_pressed(global.key_accept)) {
	show_debug_message(other.object_index);
	if (other.object_index == obj_machine || object_get_parent(other.object_index) == obj_machine) {
	// if machine, give the item that machine gives if your hand isn't full
		if (array_length(inventory) < max_capacity) {
			array_insert(inventory, array_length(inventory), other.gives);
			audio_play_sound(global.interact_sound, 10, false);
			array_sort(inventory, true);
		}
		else {
			audio_play_sound(global.error_sound, 20, false);
		}
	}
	// if trash can, throw away all inventory items (if you're holding anything)
	else if (other.object_index == obj_trash) {
		if (array_length(inventory) > 0) {
			array_delete(inventory, 0, array_length(inventory));
		}
		audio_play_sound(global.interact_sound, 10, false);
	}
	else if (other.object_index == obj_counter || object_get_parent(other.object_index) == obj_counter) {
		if (instance_exists(OBJ_Customer)) {
			var result = compare_order();
			if (result != -1) {
				// successful order - award points, increase combo, reset flow timer
				if (result) {
					audio_play_sound(global.interact_sound, 10, false);
					show_debug_message("good job");
					global.combo += 1;
					mgr_flow_state.update_flow();
				}
				else if (!result) {
					audio_play_sound(global.error_sound, 20, false);
					show_debug_message("order was incorrect >:(");
					global.player_health = max(0, global.player_health - ceil(10 * health_loss));
					global.combo = 0;
					reset_flow();
				}
				if (array_length(inventory) > 0) array_delete(inventory, 0, array_length(inventory));
			}
		}
	}
}