extends CharacterBody2D

# Constants for player movement
const SPEED = 130.0  # Horizontal speed of the player
const JUMP_VELOCITY = -350.0  # The velocity applied when the player jumps

# Get the default gravity from the project settings
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Node references
@onready var animated_sprite = $AnimatedSprite2D  # Reference to the player's AnimatedSprite2D node for animation control

# Player state variables
var is_hurt = false  # Tracks if the player is currently hurt
var is_dead = false  # Tracks if the player is dead
var jump_count = 0  # Tracks the number of jumps made by the player

# Function to handle the player's "hurt" state
func hurt():
	if not is_hurt and not is_dead:
		is_hurt = true  # Mark the player as hurt
		animated_sprite.play("hurt")  # Play the "hurt" animation
		await get_tree().create_timer(0.5).timeout  # Wait for half a second
		is_hurt = false  # Mark the player as no longer hurt

# Function to handle the player's death
func _on_player_dead():
	if not is_dead:
		is_dead = true  # Mark the player as dead
		animated_sprite.play("death")  # Play the "death" animation
		await get_tree().create_timer(1).timeout  # Wait for one second before reloading the scene
		get_tree().reload_current_scene()  # Reload the current scene (player respawns)

# Called every frame by the physics engine
func _physics_process(delta):
	if is_hurt or is_dead:
		return  # If the player is hurt or dead, no movement or actions will be processed
	
	# Apply gravity if the player is in the air (not on the floor)
	if not is_on_floor():
		velocity.y += gravity * delta  # Accelerate the player downward based on gravity
	
	# Handle jumping when the player presses the jump button (default "ui_accept")
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY  # Apply the jump velocity (upward force)
		jump_count += 1  # Increment the jump count
		print("You jumped!")  # Print a debug message

	# Handle horizontal movement
	var direction = Input.get_axis("ui_left", "ui_right")  # Get the horizontal direction input (-1 for left, 1 for right)

	# Flip the player's sprite based on the movement direction
	if direction > 0:
		animated_sprite.flip_h = false  # Player faces right
	elif direction < 0:
		animated_sprite.flip_h = true  # Player faces left
	
	# Handle animation based on whether the player is on the floor or in the air
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("IDLE")  # Play idle animation when not moving
		else:
			animated_sprite.play("run")  # Play running animation when moving
	else:
		animated_sprite.play("jump")  # Play jumping animation when in the air
	
	# Apply movement based on the player's input direction
	if direction:
		velocity.x = direction * SPEED  # Move left or right depending on the input
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)  # Smoothly stop the player when no input is given

	move_and_slide()  # Move the player with sliding behavior (handles collisions automatically)
