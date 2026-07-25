random_set_seed(current_time);

global.currentRoom = "Title";
global.waypoints = [OBJ_Waypoint2, OBJ_Waypoint3, OBJ_Waypoint4, OBJ_Waypoint5];
global.counters = [OBJ_Waypoint, OBJ_Waypoint1];

alarm[7] = game_get_speed(gamespeed_fps) * 0.5;