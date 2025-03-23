extends Area2D

@export var store_ui_label: Label  # Assign the label under the clock in Inspector

var has_dog_food = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and not has_dog_food:
		buy_dog_food()

func buy_dog_food():
	if TaskManager.is_task_completed("clear_trash"):
		has_dog_food = true
		TaskManager.complete_task("buy_dog_food")
		store_ui_label.text = "Thank You come back today c: "  # Show text under clock
	
