extends Node

signal time_updated
var time = 8  # Start at 08:00 (8 AM)
const END_TIME = 23  # End of the day (23:00 or 11 PM)
const MAX_TASKS = 5  # Total number of tasks

func advance_time():
	if time < END_TIME:
		var time_step = (END_TIME - 8) / float(MAX_TASKS)  # Distribute time evenly
		time += int(time_step)  # Convert to integer
		time_updated.emit(time)  # Notify UI
