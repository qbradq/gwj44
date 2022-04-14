extends "res://Scenes/Enemy/Enemy.gd"

func _ready():
	seek_player()

func _physics_process(delta):
	# AI processing
	if not $VisibilityNotifier2D.is_on_screen():
		queue_free()
	# Base processing
	._physics_process(delta)
