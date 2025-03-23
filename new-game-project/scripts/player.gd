extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D  # Reference to the animated sprite

const SPEED = 1000  # Movement speed

func _process(delta):
	var direction = Vector2.ZERO
	
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

	# Set animations based on movement
	update_animation(direction)

func update_animation(direction: Vector2):
	if direction == Vector2.ZERO:
		sprite.play("Idle")  # Play idle animation when not moving
	elif direction.y > 0:
		sprite.play("walkFront")  # Moving down
	elif direction.y < 0:
		sprite.play("walkBack")   # Moving up
	elif direction.x > 0:
		sprite.play("walkSide")   # Moving right
		sprite.flip_h = false     # Ensure correct facing
	elif direction.x < 0:
		sprite.play("walkSide")   # Moving left
		sprite.flip_h = true      # Flip sprite to face left
