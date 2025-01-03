extends Node

var start_time = null

func start_timer():
	start_time = Time.get_ticks_msec()
	print("Timer started at: ", start_time)

func stop_timer():
	print("Timer stopped!")

func get_elapsed_time() -> float:
	if start_time != null:
		var current_time = Time.get_ticks_msec()
		return (current_time - start_time) / 1000.0
	else:
		return 0.0
