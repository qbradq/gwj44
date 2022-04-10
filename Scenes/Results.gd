extends Control

func _ready():
	var ltime = LevelData.get_time_elapsed()
	var minutes = ltime / 60
	var seconds = ltime % 60
	$SurvivedLabel.text = "YOU SURVIVED FOR %d:%02d" % [minutes, seconds]
	$ScoreLabel.text = "YOUR SCORE WAS %d" % LevelData.get_score()

func _on_StartButton_pressed():
	$AudioStreamPlayer.play()

func _on_AudioStreamPlayer_finished():
	get_tree().change_scene("res://Scenes/Level/Level.tscn")
