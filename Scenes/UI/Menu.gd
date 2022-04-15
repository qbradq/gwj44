extends Control


func _ready():
	$AnimationPlayer.play("FadeIn")


func _on_StartButton_pressed():
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer, "finished")
	get_tree().change_scene("res://Scenes/Level/Level.tscn")
