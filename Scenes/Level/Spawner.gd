extends Node2D

var enemy_scenes = [
	preload("res://Scenes/Enemy/Bugoid.tscn"),
	preload("res://Scenes/Enemy/Goober.tscn")
]

var spawn_cooldown:float = 0.5
var spawn_time:float

func _physics_process(delta):
	while spawn_time <= 0:
		spawn_time += spawn_cooldown
		spawn()
	spawn_time -= delta

func spawn():
	var rot = rand_range(0.0, 2*PI)
	var ofs:Vector2 = (Vector2.RIGHT * 200.0).rotated(rot)
	var enemy_scene = enemy_scenes[randi() % enemy_scenes.size()]
	var enemy:Area2D = enemy_scene.instance()
	enemy.global_position = global_position + ofs
	get_parent().add_child(enemy)
