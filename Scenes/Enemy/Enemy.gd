extends Area2D

var sparks_scene:PackedScene = load("res://Scenes/Bits/Sparks.tscn")

export var speed:float = 50.0

var velocity:Vector2

func _ready():
	add_to_group("enemy")

func _physics_process(delta):
	# Movement
	global_position += velocity * delta

func die():
	var pa = $PowAudio
	if pa != null:
		remove_child(pa)
		get_parent().find_node("AudioTemp").add_child(pa)
		pa.play()
	var sparks = sparks_scene.instance()
	sparks.global_position = global_position
	sparks.restart()
	get_parent().add_child(sparks)
	queue_free()

func look_at_player():
	var p:Area2D = get_parent().find_node("Player")
	if p != null:
		look_at(p.global_position)

func seek_player():
	look_at_player()
	velocity = Vector2.RIGHT.rotated(rotation) * speed
