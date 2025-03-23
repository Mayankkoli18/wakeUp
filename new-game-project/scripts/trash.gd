extends Area2D

@export var task_manager: Node  # Assign TaskManager in the editor

var is_cleared = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and not is_cleared:
		clear_trash()

func clear_trash():
	if TaskManager.is_task_completed("water_plants"):
		is_cleared = true
		self.hide()  # Hide trash from the scene
		task_manager.trash_collected()  # Notify TaskManager
