extends Area2D

@export var cutscene_sprite: Node  # Assign the sprite in the Inspector
@export var cutscene_label: Label  # Assign the label in the Inspector

var task_completed = false
var cutscene_texts = [
	"Still smells like her.",
	"Do I miss her?",
	"Do I remember her?"
]

func _ready():
	if cutscene_sprite:
		cutscene_sprite.visible = false
		cutscene_sprite.modulate = Color(1, 1, 1, 0)  # Fully transparent initially
	else:
		push_error("Cutscene sprite not assigned!")

	if cutscene_label:
		cutscene_label.visible = false
	else:
		push_error("Cutscene label not assigned!")

func _on_body_entered(body):
	print("aa")
	if body.is_in_group("player") and not task_completed and TaskManager.all_tasks_completed():
		start_cutscene()

func start_cutscene():
	task_completed = true
	cutscene_sprite.visible = true
	cutscene_label.visible = true

	# Pick and display random text
	cutscene_label.text = cutscene_texts.pick_random()

	# Fade in sprite
	var tween = get_tree().create_tween()
	tween.tween_property(cutscene_sprite, "modulate", Color(1, 1, 1, 1), 1.0)  # Fade in in 1 sec

	await get_tree().create_timer(5.0).timeout  # Wait for 5 seconds

	# Hide text
	cutscene_label.visible = false

	# Fade out sprite
	tween = get_tree().create_tween()
	tween.tween_property(cutscene_sprite, "modulate", Color(1, 1, 1, 0), 1.0)  # Fade out in 1 sec
	await tween.finished

	cutscene_sprite.visible = false

	# Mark task as complete and advance time
	TaskManager.complete_task("sit_by_lake")
	ClockManager.advance_time()
