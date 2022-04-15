extends "res://Scenes/Enemy/Enemy.gd"


export var seek:bool


func _ready():
	seek_player()


func _physics_process(delta):
	# AI processing
	if seek:
		seek_player()
	if not $VisibilityNotifier2D.is_on_screen():
		queue_free()
	# Base processing
	._physics_process(delta)
