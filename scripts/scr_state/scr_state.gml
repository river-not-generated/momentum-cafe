enum GameState {
	INIT,
	TITLE,
	GAMESTART,
	GAMEEND,
	DEAD,
	CAFFINATED,
	GAMEOVER
}

enum SetCharacter{
	CHARLIE,
	LUCAS
}

global.game_state = GameState.INIT;