dx = 0;
dy = 0;
walking = true;

// this is to be an array
inventory = array_create(0);
max_capacity = 3;

global.tileset_collision = layer_tilemap_get_id("Collision");

if (global.current_character == SetCharacter.CHARLIE){
	dead_sprite = spr_charlie_dead;
} else {
	dead_sprite = spr_lucas_dead;
}



