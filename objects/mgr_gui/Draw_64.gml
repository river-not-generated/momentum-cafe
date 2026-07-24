draw_set_font(font);
draw_set_colour(c_white);
// draw the ticket
draw_sprite(spr_ticket, 0, 250, 0);

// write out each item in the player's inventory if they're holding anything
var inv = obj_player.inventory;
if (inv != undefined && array_length(inv) > 0) {
	draw_set_colour(c_black);
	for (var i = 0; i < array_length(inv); i++) {
		var text = "Mystery Drink";
		switch (inv[i]) {
			case Item.CAPPUCCINO:
				text = "Cappuccino";
				break;
			case Item.COFFEE:
				text = "Coffee";
				break;
			case Item.FRAPPE:
				text = "Frappe";
				break;
			case Item.ICED:
				text = "Iced";
				break;
		}
		draw_text(260, (12 * i) + 21, text);
	}
}