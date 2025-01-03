extends Area2D

#/**
# * Declare a variable for the Timer node that controls the time scale adjustment.
# */
@onready var timer = $Timer

#/**
# * Triggered when a body enters the Area2D (e.g., the player gets hurt).
# * Inputs: body (the object that collided with the Area2D, expected to be the player).
# * Actions: Applies damage to the player, prints a message, slows down the time scale, 
# *          decreases the player's lives, and starts the timer.
# * Outputs: The player takes damage, the game slows down, and lives are decreased.
# */
func _on_body_entered(body):
		body.hurt()  # Apply damage to the player
		print("You got hurt!")  # Print a message indicating the player got hurt
		Engine.time_scale = 0.9  # Slow down the game time
		Livecounter.lives -= 1  # Decrease the player's lives by 1
		timer.start()  # Start the timer to control time scale reset

#/**
# * Triggered when the timer times out (when the timer reaches the timeout value).
# * Actions: Resets the time scale back to normal (1.0).
# * Outputs: The game time returns to normal speed.
# */
func _on_timer_timeout():
	Engine.time_scale = 1.0  # Reset the time scale to normal speed
