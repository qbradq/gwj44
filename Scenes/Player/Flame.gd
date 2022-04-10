extends Area2D

var speed:float = 100.0
var ttl:float = 1.0

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * delta * speed
	if position.x < 0 || position.x > 360 || position.y < 0 || position.y > 180:
		queue_free()
	ttl -= delta
	$Sprite.scale = Vector2.ONE * (3.0 - ttl * 2.0)
	$CollisionShape2D.scale = Vector2.ONE * (3.0 - ttl * 2.0)
	if ttl <= 0.0:
		queue_free()

func _on_PlayerBullet_area_entered(area):
	if area.is_in_group("enemy"):
		get_parent().add_score(1)
		area.die()
		queue_free()
