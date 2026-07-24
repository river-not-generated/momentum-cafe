if (keyboard_check_pressed(vk_enter)){
current_character = chooseCharacter();

if (current_character == SetCharacter.CHARLIE){
	up_sprite = spr_charlie_up;
	down_sprite = spr_charlie_down;
	side_sprite = spr_charlie_side;
} else if (current_character == SetCharacter.LUCAS){
	up_sprite = spr_lucas_up;
	down_sprite = spr_lucas_down;
	side_sprite = spr_lucas_side;
}
}

var _left = (keyboard_check(global.key_left));
var _right = (keyboard_check(global.key_right));
var _up = (keyboard_check(global.key_up));
var _down = (keyboard_check(global.key_down));
	
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

if (dy < 0) {
	sprite_index = up_sprite;
	image_xscale = 1;
}
else if (dy > 0) {
	sprite_index = down_sprite;
	image_xscale = 1;
}
if (dx < 0) {
	sprite_index = side_sprite;
	image_xscale = -1;
}
else if (dx > 0) {
	sprite_index = side_sprite;
	image_xscale = 1;
}

move_and_collide(dx, dy, global.tileset_collision, 4, undefined, undefined, 1, 1);

if (walking) image_speed = 1;
else image_speed = 0;


	
	