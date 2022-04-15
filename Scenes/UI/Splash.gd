extends Control


export var next_scene:PackedScene = load("res://Scenes/UI/Splash2.tscn")


func _ready():
	randomize()
	SaveGame.load_data()


func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_Timer_timeout()
	elif event is InputEventMouseButton and event.pressed:
		_on_Timer_timeout()


func _on_Timer_timeout():
	$AnimationPlayer.play("FadeOut")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene_to(next_scene)
