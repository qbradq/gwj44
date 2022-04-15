extends "res://Scenes/Enemy/Enemy.gd"


export var lilrito_scene = preload("res://Scenes/Enemy/LilRito.tscn")


func _physics_process(delta):
	# AI processing
	seek_player()
	# Base processing
	._physics_process(delta)


func _on_LaunchTimer_timeout():
	var lilrito:Area2D = lilrito_scene.instance()
	lilrito.global_transform = $LaunchPoint.global_transform
	get_parent().add_child(lilrito)
