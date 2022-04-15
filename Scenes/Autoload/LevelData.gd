extends Node

var score:int
var time_elapsed:float
var time_running:bool

func reset():
	score = 0
	time_elapsed = 0.0
	time_running = true

func get_score()->int:
	return score

func add_score(amount):
	score += amount

func stop_timing():
	time_running = false

func increment_time(delta):
	if time_running:
		time_elapsed += delta

func get_time_elapsed()->int:
	return int(time_elapsed)
