extends Area2D

export var gun_scene:PackedScene = load("res://Scenes/Gun/Rapid.tscn")

var ttl:float = 15.0

func _physics_process(delta):
	ttl -= delta
	if ttl <= 0.0:
		queue_free()

func _on_PowerUp_area_entered(area):
	if area.is_in_group("player"):
		var gun = gun_scene.instance()
		area.change_gun(gun)
		queue_free()
