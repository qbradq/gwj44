extends CPUParticles2D

func _physics_process(delta):
	if not emitting:
		queue_free()
