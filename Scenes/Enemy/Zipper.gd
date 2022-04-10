extends "res://Scenes/Enemy/Enemy.gd"

var was_on_screen:bool

func _ready():
	var p = get_parent().find_node("Player")
	if p != null:
		velocity = (p.global_position - global_position).normalized() * speed

func _physics_process(delta):
	# AI processing
	rotate(2 * PI * delta)
	if $VisibilityNotifier2D.is_on_screen():
		was_on_screen = true
	else:
		if was_on_screen:
			queue_free()
	# Base processing
	._physics_process(delta)
