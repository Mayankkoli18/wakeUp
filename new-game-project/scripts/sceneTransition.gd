extends Area2D

@export var target_scene: String  # Set scene path in the Inspector

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player") and target_scene:
		change_scene()

func change_scene():
	get_tree().change_scene_to_file(target_scene)  # Load the assigned scene
