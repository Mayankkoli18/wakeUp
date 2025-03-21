extends Area2D

@onready var label = $Label  # Optional UI label for debugging

var normal_messages = ["Hmm, just as yesterday.", "Looks exactly the same.", "Nothing changed here."]
var anomaly_messages = [
	["That looks... strange.", "Something feels off.", "I don't remember it like this."], 
	["It's definitely different.", "This is changing...", "I feel uneasy looking at it."], 
	["What is happening?", "Why is this happening?", "This isn't right..."], 
	["Reality is breaking...", "This shouldn't be possible.", "I want to wake up."], 
	["Everything is wrong.", "Am I losing my mind?", "Help me..."]
]

@export var is_anomaly = false  # Set manually in Inspector
var day_variable = 0  # Updated by `game_manager.gd`

func set_anomaly():
	is_anomaly = true

# Detect mouse clicks
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		show_message()

# Show correct message
func show_message():
	var message = ""

	if is_anomaly:
		var index = min(day_variable, anomaly_messages.size() - 1)  # Prevent out-of-bounds
		message = anomaly_messages[index].pick_random()
	else:
		message = normal_messages.pick_random()

	print(message)  # Change to UI popup later
	if label:
		label.text = message  # Update label
		clear_label_after_delay()

# Clear label after 3 seconds
func clear_label_after_delay():
	await get_tree().create_timer(3.0).timeout
	if label:
		label.text = ""  # Clear the text
