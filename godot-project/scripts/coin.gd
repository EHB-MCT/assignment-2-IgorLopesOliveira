extends Area2D

@onready var game_manager = get_node("/root/Scene/GameManager")  # Adjust the path based on where your GameManager is
@onready var animation_player = $AnimationPlayer

#/**
# * Triggered when a body enters the Area2D (i.e., the coin is collected).
# * Inputs: body (the object that collided with the Area2D, expected to be a player or other relevant entity)
# * Actions: Prints a message, adds a point to the game manager, and plays the pickup animation.
# * Outputs: The point is added to the game score, and the pickup animation is triggered.
# */
func _on_body_entered(body):
    print("Coin collected!")
    game_manager.add_point()  # Add a point to the game manager's score
    animation_player.play("pickup")  # Play the "pickup" animation for visual feedback
