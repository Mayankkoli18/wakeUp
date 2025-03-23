extends Node

signal task_completed

var completed_tasks = []
var task_order = ["water_plants", "clear_trash", "buy_dog_food", "feed_dog", "sit_by_lake"]
var current_task_index = 0
const TOTAL_TASKS = 5;
func complete_task(task_name):
	print(current_task_index)
	if task_name == task_order[current_task_index]:  # Only complete if it's the correct task
		completed_tasks.append(task_name)
		if current_task_index<task_order.size()-1:
			current_task_index += 1  # Move to the next task
		print(completed_tasks)
		ClockManager.advance_time()  # Move time forward
		task_completed.emit()  # Notify other systems
func is_task_completed(task_name: String) -> bool:
	#print(task_name)
	return task_name in completed_tasks
func all_tasks_completed() -> bool:
	return len(completed_tasks) >= TOTAL_TASKS-1
