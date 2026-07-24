function chooseTable(){
	for (i = 0; i < array_length(global.waypoints); i += 1){
		if (global.waypoints[i].isCollided == false){
			global.waypoints[i].isCollided = true;
			return global.waypoints[i];
		}
	}
}

