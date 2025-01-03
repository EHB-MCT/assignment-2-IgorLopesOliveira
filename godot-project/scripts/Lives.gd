extends Node2D

#/**
# * Declare a flag to track if the player has already died.
# * This is used to ensure the death logic is executed only once.
# */
var has_died = false

# Called when the node is added to the scene.
#/**
# * Set the player's lives to 3 when the game starts.
# * This initializes the game state with 3 lives for the player.
# */
func _ready():
	Livecounter.lives = 3

# Called every frame during the physics processing step.
#/**
# * Check the player's remaining lives and update the UI accordingly.
# * When lives reach 2, 1, or 0, the corresponding UI element (life indicator) is hidden.
# * If the player's lives reach 0 and they haven't already died, the game triggers the death sequence.
# */
func _physics_process(delta):
	# If the player has 2 lives remaining, hide the third life indicator.
	if Livecounter.lives == 2:
		$Live3.hide()
	# If the player has 1 life remaining, hide the second life indicator.
	elif Livecounter.lives == 1:
		$Live2.hide()
	# If the player has 0 lives remaining and hasn't already died, trigger the death sequence.
	elif Livecounter.lives == 0 and not has_died:
		# Hide the first life indicator when the player has no lives left.
		$Live1.hide()
		# Print a message to the console indicating the player died by damage.
		print("You died by damage!")
		# Get the parent node (which should be the player) and call the 'on_player_dead' method.
		var player = get_parent()  
		if player:
			player._on_player_dead()  
		# Set 'has_died' to true to prevent the death logic from running again.
		has_died = true
