dx = 0;
dy = 0;
character_speed = 1;

enum ServeState{
	Walking,
	NotServed,
	ReceivedOrder,
	Served,
	Done
}
var target;


order = array_create(0);
serveState = ServeState.Walking;

