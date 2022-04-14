extends Control

func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_Timer_timeout()

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/UI/Menu.tscn")
