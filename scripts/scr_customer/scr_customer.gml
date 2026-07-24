/// Returns a reference to the first unoccupied table's waypoint.
function chooseTable() {
	for (var i = 0; i < array_length(global.waypoints); i++) {
		if (global.waypoints[i].isCollided == false){
			global.waypoints[i].isCollided = true;
			return global.waypoints[i];
		}
	}
}

function chooseCounter(){
	for (var i = 0; i < array_length(global.counters); i++){
		if (global.counters[i].isCollided == false){
			global.counters[i].isCollided = true;
			return global.counters[i];
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

/// Returns 0 if the customer is not waiting; otherwise returns a boolean corresponding to whether the player's inventory matches the customer's order.
function compare_order(customer) {
	if (customer.serveState == ServeState.NotServed) {
		// return false if the player's inventory count doesn't match the customer's
		if (array_length(obj_player.inventory) != array_length(customer.order)) 
			return false;
		// and then return false if there is a mismatch
		for (var i = 0; i < array_length(customer.order); i++) {
			if (customer.order[i] != obj_player.inventory[i]) return false;
		}
		// if it hasn't returned yet then they match, return true
		return true;
	}
	// return 0 if there is no customer waiting nearby
	return 0;
}