extends Area2D

#/**
# * Declare a variable for the Timer node that controls the time scale adjustment.
# */
@onready var timer = $Timer

#/**
# * Triggered when a body enters the Area2D (e.g., the player dies by falling).
# * Inputs: body (the object that collided with the Area2D, expected to be the player).
# * Actions: Prints a message, slows down the time scale, removes the player's collision shape 
# *          (effectively "killing" the player), and starts the timer.
# * Outputs: The player is removed from the scene, the game slows down, and the timer starts.
# */
func _on_body_entered(body):
	print("You died by falling!")  # Print a message indicating the player died by falling
	Engine.time_scale = 0.5  # Slow down the game time to create a dramatic effect
	body.get_node("CollisionShape2D").queue_free()  # Remove the player's collision shape (effectively removing the player)
	timer.start()  # Start the timer to control time scale reset

#/**
# * Triggered when the timer times out (when the timer reaches the timeout value).
# * Actions: Resets the time scale back to normal (1.0) and reloads the current scene.
# * Outputs: The game time returns to normal speed, and the scene is reloaded.
# */
func _on_timer_timeout():
	Engine.time_scale = 1.0  # Reset the time scale to normal speed
	get_tree().reload_current_scene()  # Reload the current scene (effectively restarting the level)
