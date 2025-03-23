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

var i=0
# 🚨 Show discrepancy sprite first



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
	TaskManager.completed_tasks.clear()
	if get_tree():
		get_tree().call_group("tasks", "reset_task") 
	else:
		resett=true 
	
		
