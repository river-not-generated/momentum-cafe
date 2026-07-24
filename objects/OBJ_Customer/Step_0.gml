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
			if (distance_to_object(target) != 0){
			//move horizontal
		    if (x != target.x)
		    {
		        if (x < target.x){
		        dx = character_speed;
				} else {
				dx = -character_speed;
				}
			//move vertical
		    } else if (y != target.y) {
				if (y < target.y){
		        dy = character_speed;
				} else {
				dy = -character_speed;
				}
		    }
			move_and_collide(dx, dy, target);
			
			}
		}
		
		if (x == old_x && y == old_y)
		{
			target.isCollided = true;
		    serveState = ServeState.NotServed;
			show_debug_message("Not Served");
			place_order(self);
		}
		break;
		
	case ServeState.NotServed:
		
		break;
		
	case ServeState.ReceivedOrder:
		show_debug_message("Going to table");
		target.isCollided = false;
		//Choose table based on which tables are full
		target = chooseTable();
		serveState = ServeState.Served;
		break;
		
	case ServeState.Served:
		show_debug_message("Served");	
		var xNew = x;
		var yNew = y;
		dx = 0;
		dy = 0;

		if (instance_exists(target))
		{
		   if (distance_to_object(target) != 0){
			//move horizontal
		    if (x != target.x)
		    {
		        if (x < target.x){
		        dx = character_speed;
				} else {
				dx = -character_speed;
				}
			//move vertical
		    } else if (y != target.y) {
				if (y < target.y){
		        dy = character_speed;
				} else {
				dy = -character_speed;
				}
		    }
			move_and_collide(dx, dy, target);
			
			}
		}
		if (x == xNew && y == yNew){
			serveState = ServeState.Seated;
		}
		break;
	case ServeState.Seated:
		show_debug_message("Seated");
		target.isCollided = false;
		serveState = ServeState.Leaving;
	break;
		
	case ServeState.Leaving:
		show_debug_message("Leaving");
		target = OBJ_ExitWaypoint;
		if (instance_exists(target))
		{
		   if (distance_to_object(target) != 0){
			
		    
			//move vertical
		    if (y != target.y) {
				if (y < target.y){
		        dy = character_speed;
				} else {
				dy = -character_speed;
				}
				//move horizontal
		    } else if (x != target.x){
				dy = 0;
		        if (x < target.x){
		        dx = character_speed;
				} else {
				dx = -character_speed;
				}
			}
			move_and_collide(dx, dy, target);
		   } else if (distance_to_object(target) == 0){
				show_debug_message("dead");
				instance_destroy();
			}
			
		}
		

	break;	
}




