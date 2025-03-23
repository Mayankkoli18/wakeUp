extends Area2D

@export var sleep_sprite : Sprite2D
@export var game_manager : Node  # Reference to GameManager

func _on_body_entered(body):
	if body.name == "Player":
		print("Player is sleeping...")
		sleep_sequence()

func sleep_sequence():
	sleep_sprite.visible = true  # Show sleeping sprite
	await get_tree().create_timer(3).timeout  # Wait 3 seconds
	sleep_sprite.visible = false  # Hide sleeping sprite
	TaskManager.current_task_index=0
	game_manager.next_day()  # Start a new day
