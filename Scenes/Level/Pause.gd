extends Control

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused
