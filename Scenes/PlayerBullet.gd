extends Area2D

var speed:float = 250.0

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * delta * speed
	if not $VisibilityNotifier2D.is_on_screen():
		queue_free()

func _on_PlayerBullet_area_entered(area):
	if area.is_in_group("enemy"):
		area.die()
		queue_free()
