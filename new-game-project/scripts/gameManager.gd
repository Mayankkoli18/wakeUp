extends Node

var day = 0  # Track in-game day
var anomaly_count = 0  # Track how many anomalies have occurred

# Function to progress the day
func next_day():
	day += 1
	anomaly_count += 1  # Increase the number of anomalies
	var objects = get_tree().get_nodes_in_group("interactables")

	# Reset all objects to normal first
	for obj in objects:
		obj.is_anomaly = false  # Clear previous anomalies
		obj.day_variable = day  # Update day variable

	# Pick one random object to be an anomaly today
	if anomaly_count <= 5:  # We have 5 anomalies in total
		var random_object = objects.pick_random()
		random_object.set_anomaly()  # Set it as an anomaly

	print("Day:", day, "Anomalies so far:", anomaly_count)
func _process(delta):
	if Input.is_action_just_pressed("dd"):
		next_day()
