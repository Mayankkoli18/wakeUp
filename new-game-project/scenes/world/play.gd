extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world/bedroom.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/mainMenu.tscn")
