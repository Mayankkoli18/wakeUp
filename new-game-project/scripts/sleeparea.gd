extends Area2D

@export var SleepSprite6 : Sprite2D
@export var SleepSprite1 : Sprite2D
@export var SleepSprite2 : Sprite2D
@export var SleepSprite3 : Sprite2D
@export var SleepSprite4 : Sprite2D
@export var SleepSprite5 : Sprite2D
@export var game_manager : Node  # Reference to GameManager

func _on_body_entered(body):
	if body.name == "Player" and TaskManager.is_task_completed("sit_by_lake"):
		print("Player is sleeping...")
		sleep_sequence()
func journal():
	if GameManager.i==0:
		SleepSprite2.visible=true
		await get_tree().create_timer(10).timeout
		SleepSprite2.visible=false
	elif GameManager.i==1:
		SleepSprite3.visible=true
		await get_tree().create_timer(10).timeout
		SleepSprite3.visible=false
	elif GameManager.i==2:
		SleepSprite4.visible=true
		await get_tree().create_timer(10).timeout
		SleepSprite4.visible=false
	elif GameManager.i==3:
		SleepSprite5.visible=true	
		await get_tree().create_timer(10).timeout
		SleepSprite5.visible=false
	elif GameManager.i==4:
		SleepSprite6.visible=true
		await get_tree().create_timer(10).timeout
		SleepSprite6.visible=false
	elif GameManager.i==5:
		print(GameManager.i)
		get_tree().change_scene_to_file("res://scenes/world/ending.tscn")
	
	else:pass
	
func sleep_sequence():
	if GameManager.anomalytoday==false:
		SleepSprite1.visible = true  # Show sleeping sprite
		await get_tree().create_timer(3).timeout  # Wait 3 seconds
		SleepSprite1.visible = false  # Hide sleeping sprite
	if GameManager.anomalytoday==true:
		journal()
		print(GameManager.i)
		GameManager.i+=1
		GameManager.anomalytoday=false
		
	TaskManager.current_task_index=0
	game_manager.next_day()  # Start a new day
