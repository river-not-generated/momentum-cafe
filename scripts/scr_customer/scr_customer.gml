/// Returns a reference to the first unoccupied table's waypoint.
function chooseTable() {
	for (var i = 0; i < array_length(global.waypoints); i++) {
		if (global.waypoints[i].isCollided == false){
			global.waypoints[i].isCollided = true;
			return global.waypoints[i];
		}
	}
}

function place_order(customer) {
	// the maximum number of items a customer can order is the player's carry capacity
	// if the player doesn't exist for some reason then cap at 3 items
	var max_items = (instance_exists(obj_player) ? obj_player.max_capacity : 3);
	var items = irandom(max_items - 1) + 1;
	
	for (var i = 0; i < items; i++) {
		customer.order[i] = Item.COFFEE;
		//customer.order[i] = irandom(Item.TOTAL - 1);
		show_debug_message(customer.order[i]);
	}
	
	array_sort(customer.order, true);
}

/// Returns -1 if no customer is not waiting; otherwise returns a boolean corresponding to whether the player's inventory matches the customer's order.
function compare_order() {
	if (instance_exists(OBJ_Customer)) {
		for (var i = 0; i < instance_number(OBJ_Customer); i++) {
			var customer = instance_nth_nearest(obj_player.x, obj_player.y, OBJ_Customer, i + 1);
			if (customer.serveState == ServeState.NotServed) {
				customer.serveState = ServeState.ReceivedOrder;
				// return false if the player's inventory count doesn't match the customer's
				if (array_length(obj_player.inventory) != array_length(customer.order)) 
					return false;
				// and then return false if there is a mismatch
				for (var i = 0; i < array_length(customer.order); i++) {
					if (customer.order[i] != obj_player.inventory[i]) {
						return false;
					}
				}
				// if it hasn't returned yet then they match, return true
				global.player_score += ceil((array_length(customer.order) * customer.customer_score) * obj_player.score_multiplier * global.speed_mod);
				return true;
			}
		}
	}
	// return -1 if there is no customer waiting nearby
	return -1;
}

/// @func   instance_nth_nearest(x, y, object, n)
///
/// @desc   Returns the id of the nth nearest instance of an object
///         to a given point or noone if none is found.
///
/// @param  {real}      x           test point x-coordinate
/// @param  {real}      y           test point y-coordinate
/// @param  {object}    object      object index (or all)
/// @param  {real}      n           proximity
///
/// @return {instance}  object instance id
///
/// GMLscripts.com/license
function instance_nth_nearest(x, y, object, n)
{
    n = clamp(instance_number(object), 1, n);
    var list = ds_priority_create();
    var nearest = noone;
    with (object) ds_priority_add(list, id, distance_to_point(x, y));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}