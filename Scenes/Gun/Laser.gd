extends "res://Scenes/Gun/Gun.gd"

func fire_projectile():
	var l:Line2D = bullet_scene.instance()
	l.global_transform = global_transform
	get_parent().get_parent().add_child(l)
