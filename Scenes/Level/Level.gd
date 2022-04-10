extends Node2D

var score:int
var start_time:int

func _ready():
	start_time = OS.get_unix_time()

func _process(delta):
	# Score
	$ScoreLabel.text = "SCORE: %d" % score
	# Ammo
	if $Player and $Player/Gun:
		if $Player/Gun.infinite_ammo:
			$AmmoLabel.text = "AMMO: ∞"
		else:
			$AmmoLabel.text = "AMMO: %d" % $Player/Gun.ammo
	# Time
	var ltime = OS.get_unix_time() - start_time
	var minutes = ltime / 60
	var seconds = ltime % 60
	$TimeLabel.text = "TIME: %d:%d" % [minutes, seconds]

func _physics_process(delta):
	# Clean up temp audio nodes
	for c in $AudioTemp.get_children():
		if c.playing == false:
			c.queue_free()

func _on_AfterDeathTimer_timeout():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func add_score(amount):
	score += amount
