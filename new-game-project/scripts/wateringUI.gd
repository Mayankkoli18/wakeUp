extends Control

signal watering_completed  # Notifies main scene when task is done

@onready var plant_buttons = $PlantsContainer.get_children()
var watered_count = 0
const TOTAL_PLANTS = 9

func _ready():
	for button in plant_buttons:
		button.connect("pressed", _on_plant_clicked.bind(button))

func _on_plant_clicked(button):
	button.disabled = true  # Prevent multiple clicks
	button.modulate = Color(0.5, 1, 0.5)  # Green tint to show it's watered
	watered_count += 1

	if watered_count == TOTAL_PLANTS:
		complete_task()

func complete_task():
	TaskManager.complete_task("water_plants")
	visible = false  # Hide UI
func reset_ui():
	for button in plant_buttons:
		button.disabled = false

	watered_count = 0
