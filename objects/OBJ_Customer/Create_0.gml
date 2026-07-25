dx = 0;
dy = 0;
base_speed = 1.25;
character_speed = base_speed;

enum ServeState{
	Walking,
	NotServed,
	ReceivedOrder,
	DeniedFood,
	Served,
	Seated,
	Leaving
}
target = obj_counter;

bubble = noone;


order = array_create(0);
serveState = ServeState.Walking;

function set_sprite_direction() {
	if (dy < 0) {
		sprite_index = up_sprite;
		image_xscale = 1;
	}
	else if (dy > 0) {
		sprite_index = down_sprite;
		image_xscale = 1;
	}
	if (dx < 0) {
		// left mirrors the right sprite
		sprite_index = side_sprite;
		image_xscale = -1;
	}
	else if (dx > 0) {
		sprite_index = side_sprite;
		image_xscale = 1;
	}
}
