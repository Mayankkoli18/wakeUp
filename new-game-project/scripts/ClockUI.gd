extends Control

@onready var clock_label = $ClockLabel

func _ready():
	# Ensure ClockManager exists before connecting
	if ClockManager:
		ClockManager.connect("time_updated", update_time)
		update_time(ClockManager.time)  # Initialize label correctly

func update_time(new_time):
	# Format time as HH:00 (e.g., "08:00", "14:00")
	var formatted_time = "%02d:00" % new_time
	clock_label.text = formatted_time
