extends Area2D

@onready var watering_ui = $"../../../WateringUI"  # Ensure correct path
var task_completed = false

func _ready():
	# Safety check to avoid null errors
	if watering_ui == null:
		push_error("WateringUI node not found! Check your scene structure.")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and not task_completed:
		open_watering_ui()

func open_watering_ui():
	if watering_ui:
		watering_ui.visible = true
		watering_ui.watering_completed.connect(_on_watering_completed, CONNECT_ONE_SHOT)
	else:
		push_error("WateringUI is null! Check if it's assigned properly.")

func _on_watering_completed():
	task_completed = true
	TaskManager.complete_task("water_plants")
	ClockManager.advance_time()  # Move time forward
	self.hide()  # Hide the WateringSpot so it can't be clicked again
func reset_task():
	task_completed = false
	self.show()  # Show watering spot again
	watering_ui.reset_ui()  # Reset UI
