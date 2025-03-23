extends Control
@onready var playButton = $Button
@onready var aboutButton = $Button2
@onready var creditButton = $Button3




func _on_button_3_pressed() -> void:
	print("Button 3 Pressed")
	get_tree().change_scene_to_file("res://scenes/world/Credits.tscn")  # Replace with your scene path


func _on_button_2_pressed() -> void:
	print("Button 2 Pressed")
	get_tree().change_scene_to_file("res://scenes/world/about.tscn")  # Replace with your scene path


func _on_button_pressed() -> void:
	print("Button 1 Pressed")
	get_tree().change_scene_to_file("res://scenes/world/Tutorials.tscn")  # Replace with your scene path
