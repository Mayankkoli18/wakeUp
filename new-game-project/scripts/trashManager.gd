extends Node

signal trash_task_completed

@onready var trash_items = self.get_children()
var trash_count = 0
const TOTAL_TRASH = 5  # Adjust if needed

func _ready():
	for trash in trash_items:
		trash.task_manager = self  # Assign self to each trash item

func trash_collected():
	trash_count += 1
	if trash_count == TOTAL_TRASH:
		complete_task()

func complete_task():
	TaskManager.complete_task("clear_trash")
	ClockManager.advance_time()  # Move time forward
	trash_task_completed.emit()  # Notify other systems

func reset_task():
	trash_count = 0
	for trash in trash_items:
		trash.show()  # Make trash visible again
