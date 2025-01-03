extends Node

var start_time = null  # Variable to store the start time of the timer

#/**
# * Starts the timer by recording the current time in milliseconds.
# * Inputs: None
# * Actions: Records the current time using Time.get_ticks_msec() and stores it in the start_time variable.
# * Outputs: Prints the start time to the console.
# */
func start_timer():
    start_time = Time.get_ticks_msec()  # Store the current time in milliseconds
    print("Timer started at: ", start_time)  # Print the start time to the console

#/**
# * Stops the timer.
# * Inputs: None
# * Actions: Prints a message indicating that the timer has been stopped.
# * Outputs: A message is printed to the console.
# */
func stop_timer():
    print("Timer stopped!")  # Print that the timer has been stopped

#/**
# * Gets the elapsed time since the timer started.
# * Inputs: None
# * Actions: If the timer has been started, calculates the elapsed time by subtracting the start time from the current time.
# * Outputs: Returns the elapsed time in seconds. If the timer was not started, it returns 0.0.
# */
func get_elapsed_time() -> float:
    if start_time != null:
        var current_time = Time.get_ticks_msec()  # Get the current time in milliseconds
        return (current_time - start_time) / 1000.0  # Return the elapsed time in seconds
    else:
        return 0.0  # If the timer wasn't started, return 0.0
