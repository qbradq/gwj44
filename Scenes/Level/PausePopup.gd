extends Popup

func _input(event):
	if visible and event.is_action_pressed("ui_accept"):
		print("unpausing")
		get_tree().paused = false
		hide()
