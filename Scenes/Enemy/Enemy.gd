extends Area2D


export var speed:float = 50.0


var sparks_scene:PackedScene = load("res://Scenes/Bits/Sparks.tscn")
var drop_chance:float = 10.0
var velocity:Vector2


var powerups = [
	preload("res://Scenes/PowerUp/Rapid.tscn"),
	preload("res://Scenes/PowerUp/Spread.tscn"),
	preload("res://Scenes/PowerUp/FlameThrower.tscn"),
	preload("res://Scenes/PowerUp/Laser.tscn"),
	preload("res://Scenes/PowerUp/Missle.tscn")
]


func _physics_process(delta):
	# Movement
	global_position += velocity * delta


func die():
	# Score
	LevelData.increment_score()
	# Play the pow sound effect
	var pa = $PowAudio
	if pa != null:
		remove_child(pa)
		get_parent().find_node("AudioTemp").add_child(pa)
		pa.play()
	# Create sparks explosion
	var sparks = sparks_scene.instance()
	sparks.global_position = global_position
	sparks.restart()
	get_parent().add_child(sparks)
	# Drop power-ups
	if rand_range(0.0, 100.0) < drop_chance:
		drop()
	# And remove ourselves
	queue_free()


func look_at_player():
	var p:Area2D = get_parent().find_node("Player")
	if p != null:
		look_at(p.global_position)


func seek_player():
	look_at_player()
	velocity = Vector2.RIGHT.rotated(rotation) * speed


func drop():
	var pu = powerups[randi()%powerups.size()].instance()
	pu.global_position = global_position
	get_parent().add_child(pu)
