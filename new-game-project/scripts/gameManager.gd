extends Node

var day = 0  # Current in-game day
var anomalies_found = 0  # Number of discrepancies found
var anamoliesCount = 0
var anomalytoday=false;
var active_anomalies = {}  # Stores current anomaliess
var discovered_anomalies = {}  
@onready var sleep_sprite = $SleepSprite  # Assign in editor
@onready var discrepancy_sprite = $DiscrepancySprite  # Assign in editor
@onready var sleep_label = $SleepLabel  # Label for messages

signal day_started  # Notify other scripts when the day resets

#dd

# 🚀 Called when player enters the bed area
func start_sleep_cycle():
	if anomalies_found > 0:  # If an anomaly was discovered today
		show_discrepancy_effect()
	else:
		begin_normal_sleep()
var i=0
# 🚨 Show discrepancy sprite first
func show_discrepancy_effect():
	discrepancy_sprite.visible = true
	sleep_label.visible = true
	sleep_label.text = "Something feels... off."

	await get_tree().create_timer(3.0).timeout  # Wait for 3 seconds

	discrepancy_sprite.visible = false  # Hide discrepancy sprite
	sleep_label.visible = false

	begin_normal_sleep()

# 😴 Normal sleep transition
func begin_normal_sleep():
	sleep_sprite.visible = true
	sleep_sprite.modulate.a = 0  # Start transparent
	sleep_sprite.modulate.a = 1  # Fade in effect
	await get_tree().create_timer(3.0).timeout  # Wait for 3 seconds

	sleep_sprite.visible = false
	next_day()

# 🌞 Move to next day
func next_day():
	day += 1

	# Reset tasks
	reset_tasks()
	day_started.emit()

func anomaly_found(scene_name):
	anomalies_found += 1
	anomalytoday=true;
	print("🔴 Anomaly Found in", scene_name)
	print(anamoliesCount)
	# If the player detects at least 1 anomaly, progress the day
	if anomalies_found >= 1:
		await get_tree().create_timer(1.5).timeout  # Small delay before transitioning
	else:
		pass

var resett=false
# ✅ Reset tasks for the new day
func reset_tasks():
	if get_tree():
		get_tree().call_group("tasks", "reset_task") 
	else:
		resett=true 
	
		
