extends CanvasLayer

#/**
# * Triggered when the start button is pressed.
# * Inputs: None
# * Actions: Starts the timer using the TimeManager, then changes the scene to the game scene.
# * Outputs: The game timer starts, and the scene transitions to the game scene.
# */
func _on_start_pressed():
    TimeManager.start_timer()  # Start the game timer
    get_tree().change_scene_to_file("res://scenes/game.tscn")  # Change to the game scene

#/**
# * Triggered when the quit button is pressed.
# * Inputs: None
# * Actions: Exits the game by quitting the application.
# * Outputs: The game application is closed.
# */
func _on_quit_pressed():
    get_tree().quit()  # Quit the game
