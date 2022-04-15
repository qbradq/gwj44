extends Control


func _ready():
	$StartButton.grab_focus()


func _on_StartButton_pressed():
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer, "finished")
	get_tree().change_scene("res://Scenes/Level/Level.tscn")
