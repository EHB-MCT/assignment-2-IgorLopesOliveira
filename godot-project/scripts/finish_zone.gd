extends Area2D

@onready var game_manager = %GameManager

#/**
# * Triggered when a body enters the Area2D (i.e., the player finishes the game).
# * Inputs: body (the object that collided with the Area2D, expected to be the player)
# * Actions: Stops the timer, retrieves the elapsed time, prints game statistics (coins, jumps, lives),
# *          updates the game manager with the elapsed time, and submits the game data.
# * Outputs: The game data (elapsed time, coins collected, jumps made, lives left) is submitted to the game manager,
# *          and the "end" node becomes visible, indicating the game has ended.
# */
func _on_body_entered(body):
    if body.name == "Player":  
        TimeManager.stop_timer()  # Stops the game timer
        var elapsed_time = TimeManager.get_elapsed_time()  # Retrieves the elapsed time from the timer
        print("You finished! Time: " + str(elapsed_time) + " seconds")

        var coins_collected = game_manager.score  # Gets the number of coins collected
        var jumps_made = body.jump_count  # Gets the number of jumps made by the player
        var lives_left = Livecounter.lives  # Gets the number of lives left

        print("You collected " + str(coins_collected) + " coins!")  # Prints the coin count
        print("You jumped " + str(jumps_made) + " times!")  # Prints the jump count
        print("You have " + str(lives_left) + " lives left!")  # Prints the remaining lives

        game_manager.set_elapsed_time(elapsed_time)  # Sets the elapsed time in the game manager
        game_manager.submit_game_data()  # Submits the game data to the manager

        get_parent().get_node("end").visible = true  # Makes the "end" node visible to show the end screen
