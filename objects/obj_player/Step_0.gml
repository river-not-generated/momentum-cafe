// check if the player is pressing the movement keys
var _left = (keyboard_check(global.key_left));
var _right = (keyboard_check(global.key_right));
var _up = (keyboard_check(global.key_up));
var _down = (keyboard_check(global.key_down));
	
// set the x and y movement based on what keys are being pressed
if (_down || _up || _left || _right) {
	walking = true;
	dx = (_right - _left) * chr_speed;
	dy = (_down - _up) * chr_speed;
}
else {
	walking = false;
	dx = 0;
	dy = 0;
}

// set the sprite based on what direction they're moving
// left/right takes priority if moving at a diagonal
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


move_and_collide(dx, dy, global.tileset_collision, 4, undefined, undefined, chr_speed, chr_speed);

// only animate if walking
if (walking) image_speed = 1;
else image_speed = 0;