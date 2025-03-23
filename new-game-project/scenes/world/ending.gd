extends Node2D
@export var aa:Sprite2D
func _ready() -> void:
	aa.visible=true
	await get_tree().create_timer(25).timeout
	aa.visible=false
