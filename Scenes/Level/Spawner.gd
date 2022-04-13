extends Node2D

#var enemy_scenes = [
#	preload("res://Scenes/Enemy/Bugoid.tscn"),
#	preload("res://Scenes/Enemy/Goober.tscn"),
#	preload("res://Scenes/Enemy/Zipper.tscn")
#]

export var enemy_scene:PackedScene = preload("res://Scenes/Enemy/Bugoid.tscn")
export var spawn_interval:float = 1.0
export var spawn_delay:float = 0.0

var spawn_time:float

func _ready():
	spawn_time = spawn_delay

func _physics_process(delta):
	while spawn_time <= 0:
		spawn_time += spawn_interval
		spawn()
	spawn_time -= delta

func spawn():
	var rot = rand_range(0.0, 2*PI)
	var ofs:Vector2 = (Vector2.RIGHT * 200.0).rotated(rot)
	var enemy:Area2D = enemy_scene.instance()
	enemy.global_position = global_position + ofs
	get_parent().get_parent().add_child(enemy)
