extends Control

@onready var tasks = $Label3

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("hide"):
		toggleVisi()
func toggleVisi():
	tasks.visible =  !tasks.visible
