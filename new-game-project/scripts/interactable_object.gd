extends Area2D

@onready var label = $Label  

var normal_messages = ["Hmm, just as yesterday.", "Looks exactly the same.", "Nothing changed here."]
var anomaly_messages = [
	["That looks... strange.", "Something feels off.", "I don't remember it like this."], 
	["It's definitely different.", "This is changing...", "I feel uneasy looking at it."], 
	["What is happening?", "Why is this happening?", "This isn't right..."], 
	["Reality is breaking...", "This shouldn't be possible.", "I want to wake up."], 
	["Everything is wrong.", "Am I losing my mind?", "Help me..."]
]

@export var scene_name: String  # Scene where this object exists
@export var anomaly_id: String  # Unique ID for this anomaly
@export var is_anomaly: bool = false
var day_variable = 0  

func _ready():
	# 50% chance of this being an anomaly
	if randf() < 0.5:
		set_anomaly()
	else:
		self.visible=false
		is_anomaly = false  # Reset anomaly

func set_anomaly():
	is_anomaly = true
	self.visible=true
	day_variable = GameManager.day  

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		show_message()

func show_message():
	var message = ""

	if is_anomaly:
		var index = min(day_variable, anomaly_messages.size() - 1)
		message = anomaly_messages[index].pick_random()
		GameManager.anomaly_found(scene_name)  # Notify GameManager
		is_anomaly = false  # Remove anomaly after detection
	else:
		message = normal_messages.pick_random()

	print(message)  
	if label:
		label.text = message
		clear_label_after_delay()

func clear_label_after_delay():
	await get_tree().create_timer(3.0).timeout
	if label:
		label.text = ""  
