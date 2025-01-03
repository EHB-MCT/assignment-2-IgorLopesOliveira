extends Area2D

@onready var game_manager = %GameManager

func _on_body_entered(body):
	if body.name == "Player":  
		TimeManager.stop_timer()  
		var elapsed_time = TimeManager.get_elapsed_time()
		print("You finished! Time: " + str(elapsed_time) + " seconds")

		var coins_collected = game_manager.score
		var jumps_made = body.jump_count
		var lives_left = Livecounter.lives  

		print("You collected " + str(coins_collected) + " coins!")
		print("You jumped " + str(jumps_made) + " times!")
		print("You have " + str(lives_left) + " lives left!")

		game_manager.set_elapsed_time(elapsed_time)
		game_manager.submit_game_data()

		get_parent().get_node("end").visible = true
