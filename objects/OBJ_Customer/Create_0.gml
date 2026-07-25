dx = 0;
dy = 0;
base_speed = 1.25;
character_speed = base_speed;

enum ServeState{
	Walking,
	NotServed,
	ReceivedOrder,
	Served,
	Seated,
	Leaving
}
target = obj_counter;

bubble = noone;


order = array_create(0);
serveState = ServeState.Walking;

