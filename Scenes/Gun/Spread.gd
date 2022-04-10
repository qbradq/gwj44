extends "res://Scenes/Gun/Gun.gd"

func fire_projectile():
	var b:Area2D
	b = bullet_scene.instance()
	b.global_transform = global_transform
	b.global_rotation_degrees += 0.0
	get_parent().get_parent().add_child(b)
	b = bullet_scene.instance()
	b.global_transform = global_transform
	b.global_rotation_degrees += 15.0
	get_parent().get_parent().add_child(b)
	b = bullet_scene.instance()
	b.global_transform = global_transform
	b.global_rotation_degrees += 30.0
	get_parent().get_parent().add_child(b)
	b = bullet_scene.instance()
	b.global_transform = global_transform
	b.global_rotation_degrees -= 15.0
	get_parent().get_parent().add_child(b)
	b = bullet_scene.instance()
	b.global_transform = global_transform
	b.global_rotation_degrees -= 30.0
	get_parent().get_parent().add_child(b)
