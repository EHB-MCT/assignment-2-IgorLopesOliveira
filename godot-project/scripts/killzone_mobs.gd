extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
		body.hurt()
		print("You got hurt!")
		Engine.time_scale = 0.9
		Livecounter.lives -= 1
		timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
