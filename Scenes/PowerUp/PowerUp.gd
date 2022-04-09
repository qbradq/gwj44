extends Area2D

export var gun_scene:PackedScene = load("res://Scenes/Gun/Rapid.tscn")

func _on_PowerUp_area_entered(area):
	if area.is_in_group("player"):
		var gun = gun_scene.instance()
		area.change_gun(gun)
		queue_free()
