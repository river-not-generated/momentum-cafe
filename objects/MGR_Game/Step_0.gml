switch(global.game_state){
	case GameState.GAMESTART:
if (global.player_health <= 0){
	global.game_state = GameState.DEAD;
	
}
break;
case GameState.DEAD:
	alarm[0] = game_get_speed(gamespeed_fps) * 1.5;
	global.game_state = GameState.GAMEEND;
break;
case GameState.GAMEEND:
break;
}