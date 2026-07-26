character_speed = base_speed * global.speed_mod;
switch(serveState) {
	case ServeState.Walking:
		if (instance_exists(OBJ_Waypoint) && OBJ_Waypoint.isCollided == false){
			target = OBJ_Waypoint;
			
		} else {
			target = OBJ_Waypoint1;
		}
			
		var old_x = x;
		var old_y = y;
		dx = 0;
		dy = 0;

		if (instance_exists(target))
		{
			if (distance_to_object(target) >= character_speed){
			//move horizontal
		    if (x < target.x - character_speed || x > target.x + character_speed)
		    {
		        if (x < target.x){
		        dx = character_speed;
				} else {
				dx = -character_speed;
				}
			//move vertical
		    } else if (y < target.y - character_speed || y > target.y + character_speed) {
				if (y < target.y){
		        dy = character_speed;
				} else {
				dy = -character_speed;
				}
		    }
			move_and_collide(dx, dy, target);
			set_sprite_direction();
			}
		}
		if (x == old_x && y == old_y)
		{
			target.isCollided = true;
		    serveState = ServeState.NotServed;
			x = floor(x);
			y = floor(y);
			sprite_index = side_sprite;
			image_xscale = -1;
			image_speed = 0;
			image_index = 0;
			show_debug_message("Not Served");
			place_order(self);
			bubble = instance_create_layer(x - 4, y - 10, "Effects", obj_text_bubble);
		}

		break;
		
	case ServeState.NotServed:
		
		break;
		
	case ServeState.ReceivedOrder:
		image_speed = 1;
		show_debug_message("Going to table");
		target.isCollided = false;
		//Choose table based on which tables are full
		target = chooseTable();
		serveState = ServeState.Served;
		instance_destroy(bubble);
		break;
		
	case ServeState.DeniedFood:
		target.isCollided = false;
		image_speed = 1;
		instance_destroy(bubble);
		serveState = ServeState.Leaving;
		break;
		
	case ServeState.Served:	
		var xNew = x;
		var yNew = y;
		dx = 0;
		dy = 0;

		if (instance_exists(target))
		{
		   if (distance_to_object(target) >= character_speed){
			//move horizontal
		    if (x < target.x - character_speed || x > target.x + character_speed)
		    {
		        if (x < target.x){
		        dx = character_speed;
				} else {
				dx = -character_speed;
				}
			//move vertical
		    } else if (y < target.y - character_speed || y > target.y + character_speed) {
				if (y < target.y){
		        dy = character_speed;
				} else {
				dy = -character_speed;
				}
		    }
			move_and_collide(dx, dy, target);
			set_sprite_direction();
			}
		}
		if (x == xNew && y == yNew){
			serveState = ServeState.Seated;
			x = floor(x);
			y = floor(y);
			sprite_index = side_sprite;
			image_xscale = 1;
			image_speed = 0;
			image_index = 0;
			show_debug_message("Seated");
			alarm[0] = game_get_speed(gamespeed_fps) * 5 / global.speed_mod;
		}
		break;
		
	case ServeState.Seated:
		
	break;
		
	case ServeState.Leaving:
		target = OBJ_ExitWaypoint;
		if (instance_exists(target))
		{
		   if (distance_to_object(target) >= character_speed) {
				//move vertical
			    if (y < target.y - character_speed || y > target.y + character_speed) {
					if (y < target.y){
			        dy = character_speed;
					} else {
					dy = -character_speed;
					}
					//move horizontal
			    } else if (x < target.x - character_speed || x > target.x + character_speed){
					dy = 0;
			        if (x < target.x){
			        dx = character_speed;
					} else {
					dx = -character_speed;
					}
				}
				move_and_collide(dx, dy, target);
				set_sprite_direction();
			} else {
				show_debug_message("dead");
				instance_destroy();
			}
		}

	break;	
}




