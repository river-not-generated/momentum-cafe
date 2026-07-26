random_set_seed(current_time);
window_set_size(room_width * 4, room_height * 4);
global.game_state = GameState.INIT;
global.current_character = irandom(1);