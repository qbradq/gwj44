extends Node2D

var enemy_scene:PackedScene = load("res://Scenes/Bugoid.tscn")

var spawn_cooldown:float = 0.5
var spawn_time:float

func _physics_process(delta):
	while spawn_time <= 0:
		spawn_time += spawn_cooldown
		spawn()
	spawn_time -= delta

func spawn():
	var rot = rand_range(0.0, 2*PI)
	var ofs:Vector2 = (Vector2.RIGHT * 360.0).rotated(rot)
	var enemy:Area2D = enemy_scene.instance()
	enemy.global_position = global_position + ofs
	get_parent().add_child(enemy)
