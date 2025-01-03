extends CanvasLayer

func _ready():
	visible = false

func _on_start_pressed():
	TimeManager.start_timer()
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_quit_pressed():
	get_tree().quit()
