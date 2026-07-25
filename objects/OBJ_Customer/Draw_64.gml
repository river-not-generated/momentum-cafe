if (serveState == ServeState.NotServed) {
	if (bubble != noone && bubble.image_speed == 0) {
		draw_set_colour(c_white);
		var even = array_length(order) % 2 == 0;
		for (var i = 0; i < array_length(order); i++) {
			var offset = (i % 2 == 0 ? -1 : 1);
			var icon = spr_coffee;
			switch (order[i]) {
				case Item.COCOA:
					icon = spr_cocoa;
					break;
				case Item.LATTE:
					icon = spr_latte;
					break;
				case Item.ESPRESSO:
					icon = spr_espresso;
					break;
			}
			if (even) {
				draw_sprite(icon, 0, bubble.x + (floor(i / 2) * offset * 16) + (9 * offset), bubble.y - 17);
			}
			else {
				draw_sprite(icon, 0, bubble.x + (ceil(i / 2) * offset * 16) , bubble.y - 17);
			}
		}
	}
	
}