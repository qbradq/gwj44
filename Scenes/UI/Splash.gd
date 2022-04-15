extends Control


func _ready():
	randomize()


func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_Timer_timeout()
	elif event is InputEventMouseButton and event.pressed:
		_on_Timer_timeout()


func _on_Timer_timeout():
	$AnimationPlayer.play("FadeOut")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://Scenes/UI/Menu.tscn")
