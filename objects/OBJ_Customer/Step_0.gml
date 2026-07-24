
switch(serveState) {
	case ServeState.Walking:
		if (instance_exists(obj_counter)){
			var angle = point_direction(x, y, obj_counter.x, obj_counter.y);
			dx = lengthdir_x(character_speed, angle);
			dy = lengthdir_y(character_speed, angle);
		};
		var old_x = x;
		var old_y = y;

		move_and_collide(dx, dy, obj_counter);
		if (x == old_x && y == old_y)
		{
		    serveState = ServeState.NotServed;
			show_debug_message("Not Served");
			place_order(self);
		}
		break;
		
	case ServeState.NotServed:
		break;
		
	case ServeState.ReceivedOrder:
		show_debug_message("Going to table");
		//Choose table based on which tables are full
		target = chooseTable();
		serveState = ServeState.Served;
		break;
		
	case ServeState.Served:
		dx = 0;
		dy = 0;

		if (instance_exists(target))
		{
		    // Move down first
		    if (y < target.y)
		    {
		        dy = character_speed;
		    }
		    // Then move right
		    else if (x != target.x)
		    {
		        dx = sign(target.x - x) * character_speed;
		    }
			move_and_collide(dx, dy, target);
		}
		break;
		
	case ServeState.Done:
		break;
		
	default:
		break;
}



