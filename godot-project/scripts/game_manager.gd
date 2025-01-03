extends Node

# Declare variables for the game elements and data tracking
@onready var score_label = $ScoreLabel  # Reference to the UI label that shows score
@onready var http_request = $"../HTTPRequest"  # Reference to the HTTPRequest node for sending data to the server
@onready var finish_zone = $"../FinishZone"  # Reference to the FinishZone node, used for determining when the game is over
@onready var player = $"../Player"  # Reference to the Player node, used to track player's actions

# Game data variables
var score = 0  # Tracks the player's score (coins collected)
var jumps_made = 0  # Tracks the number of jumps the player has made
var lives_left = 3  # Tracks how many lives the player has left
var elapsed_time = 0.0  # Tracks the elapsed time since the game started

# Called when the game is ready and initialized
func _ready():
	# Check if the HTTPRequest node is connected
	if http_request != null:
		print("HTTPRequest node found.")
		# Connect the 'request_completed' signal to handle server responses
		http_request.connect("request_completed", Callable(self, "_on_HTTPRequest_request_completed"))
	else:
		print("Error: HTTPRequest node not found!")

	# Check if the method '_on_HTTPRequest_request_completed' exists
	if not has_method("_on_HTTPRequest_request_completed"):
		print("Error: _on_HTTPRequest_request_completed method not defined!")

# Function to add a point (when the player collects a coin)
func add_point():
	score += 1  # Increase score by 1 for each coin collected
	score_label.text = "You collected " + str(score) + " coins."  # Update the score UI label

# Function to set the elapsed time (e.g., the time the player has been playing)
func set_elapsed_time(time):
	elapsed_time = time  # Update the elapsed time variable

# Function to submit game data to the backend (server)
func submit_game_data():
	jumps_made = player.jump_count  # Get the total number of jumps made by the player
	lives_left = Livecounter.lives  # Get the number of lives left (assuming Livecounter is a node managing player lives)
	
	# Prepare the game data in a dictionary format
	var game_data = {
		"jumpCount": jumps_made,
		"elapsedTime": round(elapsed_time),  # Round the time to a whole number for storage
		"livesLeft": lives_left,
		"coinsCollected": score  # Include the player's score (coins collected)
	}

	# Convert the game data to JSON format for easy transmission
	var json_data = JSON.stringify(game_data)
	print("Sending game data: ", json_data)  # Log the data being sent

	# Define the server URL where the data will be sent
	var url = "http://localhost:10000/submit-game-data"
	var headers = ["Content-Type: application/json"]  # Set the headers to indicate JSON format
	# Send the HTTP POST request to the server with the game data
	var error = http_request.request(url, headers, HTTPClient.METHOD_POST, json_data)
	
	# Check if the request was sent successfully
	if error == OK:
		print("Game data request sent.")
	else:
		print("Failed to send game data: ", error)  # Log the error if the request failed

# Callback function that handles the response from the server after the HTTP request is completed
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	# Check if the server responded with a successful status code (201 Created)
	if response_code == 201:
		var data = body.get_string_from_utf8()  # Parse the response body to a string
		print("Game data submitted successfully: ", data)  # Log the success message
	else:
		# If the submission failed, log the response code and body for debugging
		print("Failed to submit game data. Response code: ", response_code)
		print("Response body: ", body)
