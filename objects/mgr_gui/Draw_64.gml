draw_set_font(font);
draw_set_colour(c_white);
// draw the ticket
draw_set_alpha(0.8);
draw_sprite(spr_ticket, 0, 250, 0);
draw_set_alpha(1);

draw_set_colour(c_black);
draw_text(260, 9, "Score: " + string(global.player_score));
// write out each item in the player's inventory if they're holding anything
var inv = obj_player.inventory;
if (inv != undefined && array_length(inv) > 0) {
	draw_set_colour(c_black);
	for (var i = 0; i < array_length(inv); i++) {
		var text = "Mystery Drink";
		switch (inv[i]) {
			case Item.COCOA:
				text = "Cocoa";
				break;
			case Item.COFFEE:
				text = "Coffee";
				break;
			case Item.ESPRESSO:
				text = "Espresso";
				break;
			case Item.LATTE:
				text = "Latte";
				break;
		}
		draw_text(260, (12 * i) + 21, text);
	}
}

if (instance_exists(mgr_flow_state)) {
	draw_set_colour(c_white);
	draw_sprite(spr_timer, mgr_flow_state.eighths, room_width - 24, room_height - 24);
	
}

// health bar
// semi-transparent background
draw_set_alpha(0.75)
draw_set_colour(make_colour_rgb(210, 210, 210));
draw_rectangle(240, 10, 248, 60, false);
// the health bar itself
draw_set_alpha(1);
draw_set_colour(c_red);
draw_rectangle(240, 60 - (global.player_health / 2.0), 248, 60, false);
// border
draw_set_colour(c_black);
draw_line_width(238, 10, 248, 10, 2);
draw_line_width(247, 10, 247, 60, 2);
draw_line_width(248, 60, 238, 60, 2);
draw_line_width(239, 60, 239, 10, 2);

if (hurt_alpha > 0) {
	draw_set_alpha(hurt_alpha);
	draw_sprite(spr_hurt_border, 1, 0, 0);
	draw_set_alpha(1);
	hurt_alpha = max(0, hurt_alpha - 0.075);
}