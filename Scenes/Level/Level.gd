extends Node2D

func _ready():
	LevelData.reset()

func _process(delta):
	# Score
	$ScoreLabel.text = "SCORE: %d" % LevelData.get_score()
	# Ammo
	if $Player and $Player/Gun:
		if $Player/Gun.infinite_ammo:
			$AmmoLabel.text = "AMMO: ∞"
		else:
			$AmmoLabel.text = "AMMO: %d" % $Player/Gun.ammo
	# Time
	LevelData.increment_time(delta)
	var ltime = LevelData.get_time_elapsed()
	var minutes = ltime / 60
	var seconds = ltime % 60
	$TimeLabel.text = "TIME: %d:%02d" % [minutes, seconds]

func _physics_process(delta):
	# Clean up temp audio nodes
	for c in $AudioTemp.get_children():
		if c.playing == false:
			c.queue_free()

func _on_AfterDeathTimer_timeout():
	get_tree().change_scene("res://Scenes/UI/Results.tscn")
