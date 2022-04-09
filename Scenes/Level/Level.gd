extends Node2D

func _physics_process(delta):
	# Clean up temp audio nodes
	for c in $AudioTemp.get_children():
		if c.playing == false:
			c.queue_free()

func _on_AfterDeathTimer_timeout():
	get_tree().change_scene("res://Scenes/Menu.tscn")
