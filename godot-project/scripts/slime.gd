extends Node2D

# Constant for movement speed
const SPEED = 60

# Direction for the character's movement (1 for right, -1 for left)
var direction = 1

# Node references to RayCast nodes and the AnimatedSprite2D
@onready var ray_cast_right = $RayCastRight  # Raycast checking for collisions on the right
@onready var ray_cast_left = $RayCastLeft    # Raycast checking for collisions on the left
@onready var animated_sprite = $AnimatedSprite2D  # AnimatedSprite2D node for character animation

# Called every frame
func _process(delta):
	# If the right raycast is colliding, change direction to the left and flip the sprite
	if ray_cast_right.is_colliding():
		direction = -1  # Change direction to move left
		animated_sprite.flip_h = true  # Flip the sprite to face left
	
	# If the left raycast is colliding, change direction to the right and flip the sprite
	if ray_cast_left.is_colliding():
		direction = 1  # Change direction to move right
		animated_sprite.flip_h = false  # Flip the sprite to face right
	
	# Update the position of the character based on the current direction and speed
	position.x += direction * SPEED * delta  # Move the character left or right depending on the direction
