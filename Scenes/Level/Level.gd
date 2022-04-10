extends Node2D

var score:int

func _process(delta):
	$ScoreLabel.text = "SCORE: %d" % score

func _physics_process(delta):
	# Clean up temp audio nodes
	for c in $AudioTemp.get_children():
		if c.playing == false:
			c.queue_free()

func _on_AfterDeathTimer_timeout():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func add_score(amount):
	score += amount
