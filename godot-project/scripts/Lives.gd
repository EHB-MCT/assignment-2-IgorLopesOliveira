extends Node2D

var has_died = false

func _ready():
	Livecounter.lives = 3

func _physics_process(delta):
	if Livecounter.lives == 2:
		$Live3.hide()
	elif Livecounter.lives == 1:
		$Live2.hide()
	elif Livecounter.lives == 0 and not has_died:
		$Live1.hide()
		print("You died by damage!")
		var player = get_parent()  
		if player:
			player._on_player_dead()  
		has_died = true 
