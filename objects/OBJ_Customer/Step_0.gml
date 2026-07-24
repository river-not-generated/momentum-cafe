
switch(serveState){
case ServeState.Walking:

if (instance_exists(OBJ_Waypoint1)){
var angle = point_direction(x, y, OBJ_Waypoint1.x, OBJ_Waypoint1.y);
dx = lengthdir_x(character_speed, angle);
dy = lengthdir_y(character_speed, angle);
};
var old_x = x;
var old_y = y;

move_and_collide(dx, dy, OBJ_Waypoint1);

if (x == old_x && y == old_y)
{
    serveState = ServeState.NotServed;
}

break;
case ServeState.NotServed:
show_debug_message("Not Served");

if (mouse_check_button_pressed(mb_left))
{
    show_debug_message("Going to table");
	//Choose table based on which tables are full
	target = chooseTable();
    serveState = ServeState.Served;
}
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



