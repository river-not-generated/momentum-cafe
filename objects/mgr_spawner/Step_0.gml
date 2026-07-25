if (!timer_set && instance_number(OBJ_Customer) < 4) {
	var count = instance_number(OBJ_Customer);
	var waiting = 0;
	for (var i = 0; i < count; i++) {
		var customer = instance_find(OBJ_Customer, i);
		if (customer.serveState = ServeState.NotServed || customer.serveState = ServeState.Walking) {
			waiting++;
		}
	}
	if (waiting < 2) {
		alarm[0] = game_get_speed(gamespeed_fps) * 1 / global.speed_mod;
		timer_set = true;
	}
}