extends Control

func _ready():
	randomize()

func _on_StartButton_pressed():
	$AudioStreamPlayer.play()

func _on_AudioStreamPlayer_finished():
	get_tree().change_scene("res://Scenes/Level/Level.tscn")