extends Line2D

var ttl:float

func _process(delta):
	ttl += delta
	modulate.a = 1.0 - ttl * 2
	if ttl >= 0.5:
		queue_free()

func _physics_process(delta):
	var r = $RayCast2D
	while r.is_colliding():
		var c = r.get_collider()
		if c.is_in_group("enemy"):
			c.die()
		r.add_exception(c)
		r.force_raycast_update()
	r.clear_exceptions()
