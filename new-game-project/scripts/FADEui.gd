extends Control

@export var fade_screen :ColorRect

# Fades in (screen turns black)
func fade_in():
	var tween = create_tween()
	tween.tween_property(fade_screen, "modulate:a", 1.0, 2.0)  # 2 sec fade-in
	await tween.finished

# Fades out (screen becomes normal)
func fade_out():
	var tween = create_tween()
	tween.tween_property(fade_screen, "modulate:a", 0.0, 2.0)  # 2 sec fade-out
	await tween.finished
