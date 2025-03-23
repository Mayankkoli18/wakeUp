extends Area2D

@export var store_ui_label: Label  # Assign the same label under the clock

var is_fed = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and TaskManager.is_task_completed("buy_dog_food") and not is_fed:
		feed_dog()
	else:
		pass

func feed_dog():
	is_fed = true
	store_ui_label.text = "WOOF WOOF"  # Remove "Holding: Dog Food"
	TaskManager.complete_task("feed_dog")

	# If both buy & feed tasks are done, then skip time
	if TaskManager.is_task_completed("buy_dog_food") and TaskManager.is_task_completed("feed_dog"):
		ClockManager.advance_time()  # Skip time only when both are done
func reset_task():
	is_fed = false
