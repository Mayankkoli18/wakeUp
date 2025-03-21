extends CharacterBody2D

const SPEED = 100  # Movement speed

func _process(delta):
	var direction = Vector2.ZERO  # Default to no movement
	
	# Get player input (WASD or arrow keys)
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1

	# Normalize direction to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()

	# Apply movement
	velocity = direction * SPEED
	move_and_slide()
