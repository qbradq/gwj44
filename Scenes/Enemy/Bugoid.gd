extends "res://Scenes/Enemy/Enemy.gd"


func _physics_process(delta):
	# AI processing
	seek_player()
	# Base processing
	._physics_process(delta)
