extends CanvasLayer

#/**
# * Initializes the CanvasLayer and sets visibility to false initially.
# * Inputs: None
# * Actions: Sets the `visible` property of the CanvasLayer to false when the scene is ready.
# * Outputs: None
# */
func _ready():
    visible = false

#/**
# * Triggered when the start button is pressed.
# * Inputs: None
# * Actions: Starts the timer via TimeManager and changes the scene to the game scene.
# * Outputs: The timer starts, and the game scene is loaded.
# */
func _on_start_pressed():
    TimeManager.start_timer()
    get_tree().change_scene_to_file("res://scenes/game.tscn")

#/**
# * Triggered when the quit button is pressed.
# * Inputs: None
# * Actions: Exits the game by calling the quit function on the scene tree.
# * Outputs: The game application is closed.
# */
func _on_quit_pressed():
    get_tree().quit()
